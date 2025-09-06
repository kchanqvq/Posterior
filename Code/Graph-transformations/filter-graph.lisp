(cl:in-package #:posterior-graph-transformations)

;;; Destructively filter an instruction graph.
;;;
;;; This function destructively delete instructions that does not
;;; satisfy TEST from a instruction graph starting with
;;; INITIAL-INSTRUCTION, and returns the initial instruction of the
;;; resulting graph.
;;;
;;; The function TEST must return true for instructions with numbers
;;; of successors other than one, otherwise the behavior is undefined.

(defun filter-graph (initial-instruction test)
  (let ((visited (make-hash-table :test 'eq)))
    (labels ((visit-instruction (instruction)
               (if (funcall test instruction)
                   (progn
                     (unless (gethash instruction visited)
                       (setf (gethash instruction visited) t)
                       (setf (cfg:successors instruction)
                             (mapcar #'visit-instruction (cfg:successors instruction))))
                     instruction)
                   (visit-instruction (cfg:successor instruction)))))
      (visit-instruction initial-instruction))))
