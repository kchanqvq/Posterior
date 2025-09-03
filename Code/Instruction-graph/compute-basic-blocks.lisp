(cl:in-package #:posterior-instruction-graph)

(defun instruction-is-leader-p (instruction predecessors)
  (let ((predecessors
          (utilities:predecessors instruction predecessors)))
    (or (/= (length predecessors) 1)
        (not (typep (first predecessors) 'one-successor-mixin)))))

(defun instruction-is-trailer-p (instruction predecessors)
  (or (not (typep instruction 'one-successor-mixin))
      (/= (length (utilities:predecessors
                   (successor instruction) predecessors))
          1)))

(defgeneric leader (basic-block))

(defgeneric trailer (basic-block))

(defclass basic-block ()
  ((%leader :initarg :leader :accessor leader)
   (%trailer :initarg :trailer :accessor trailer)))

(defun fill-basic-block (basic-block predecessors)
  (loop with last = (trailer basic-block)
        until (instruction-is-trailer-p last predecessors)
        do (setf last (successor last))
        finally (setf (trailer basic-block) last)))

(defun compute-basic-blocks (initial-instruction)
  (let ((predecessors
          (utilities:compute-predecessors initial-instruction #'successors))
        (basic-blocks '()))
    (utilities:depth-first-search-preorder
     (lambda (instruction)
       (when (instruction-is-leader-p instruction predecessors)
         (push (make-instance 'basic-block
                              :leader instruction
                              :trailer instruction)
               basic-blocks)))
     initial-instruction #'successors)
    (loop for basic-block in basic-blocks
          do (fill-basic-block basic-block predecessors))
    basic-blocks))
