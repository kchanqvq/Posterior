(cl:in-package #:posterior-graph-transformations)

(defclass placeholder (cfg:instruction cfg:zero-successors-mixin)
  ((%index :initarg :index :reader index)))

(defun required-registers (initial-instruction)
  (let ((result (make-hash-table :test 'eq)))
    (util:depth-first-search-preorder
     (lambda (instruction)
       (loop for register in (cfg:inputs instruction)
             do (setf (gethash register result) t)))
     initial-instruction #'cfg:successors)
    (hash-table-keys result)))

(defun compute-translation-table
    (initial-instruction definitions precious-p rewrite-function)
  (let ((translation-table (make-hash-table :test 'eq)))
    (labels ((required-instructions (initial-instruction)
               (remove-duplicates
                (mappend (rcurry #'util:preimage definitions)
                         (required-registers initial-instruction))))
             (ensure-translation (instruction)
               (unless (gethash instruction translation-table)
                 (let ((translation (funcall rewrite-function instruction)))
                   (setf (gethash instruction translation-table)
                         (funcall rewrite-function instruction))
                   (mapc #'ensure-translation
                         (required-instructions translation))))))
      (util:depth-first-search-preorder
       (lambda (instruction)
         (when (funcall precious-p instruction)
           (ensure-translation instruction)))
       initial-instruction #'cfg:successors))
    translation-table))

(defun fixup-placeholders (initial-instruction translation-table)
  (util:depth-first-search-preorder
   (lambda (instruction)
     (let ((successors (cfg:successors instruction)))
       (util:depth-first-search-preorder
        (lambda (translated-instruction)
          (setf (cfg:successors translated-instruction)
                (mapcar (lambda (successor)
                          (if (typep successor 'placeholder)
                              (nth (index successor) successors)
                              successor))
                        (cfg:successors translated-instruction))))
        (gethash instruction translation-table) #'cfg:successors)))
   initial-instruction #'cfg:successors))

;;; Destructively rewrite an instruction graph
;;;
;;; This function destructively rewrites an instruction graph starting
;;; with INITIAL-INSTRUCTION.  REWRITE-FUNCTION must accept a single
;;; argument which is the instruction to be rewritten, and return the
;;; initial instruction of an instruction graph to replace the
;;; original instruction.  If the returned instruction graph contains
;;; any PLACEHOLDER, it is replaced with the corresponding successor of
;;; the original instruction.
;;;
;;; The function PRECIOUS-P must accept a single argument and return a
;;; generalized boolean.  An instruction is retained if PRECIOUS-P
;;; returns true on it, or if it writes to some input register of some
;;; retained instruction.  Only rewrites of retained instructions are
;;; computed and retained in final result.
;;;
;;; DEFINITIONS must contains an POSTERIOR-ULTILITES:PREIMAGE computed
;;; on OUTPUTS relation from instructions to registers in the
;;; instruction graph.  That is, DEFINITIONS should provide what
;;; instructions write to a given register.
;;;
;;; The function PRECIOUS-P must return true for instructions with numbers
;;; of successors other than one, otherwise the behavior is undefined.

(defun rewrite-graph (initial-instruction definitions precious-p rewrite-function)
  (let* ((translation-table
           (compute-translation-table
            initial-instruction definitions precious-p rewrite-function))
         (initial-instruction
           (filter-graph initial-instruction (rcurry #'gethash translation-table))))
    (fixup-placeholders initial-instruction translation-table)
    (gethash initial-instruction translation-table)))
