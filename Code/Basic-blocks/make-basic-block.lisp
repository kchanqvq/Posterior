(cl:in-package #:posterior-basic-blocks)

;;; Chain a series of instructions into a basic block.

(defun make-basic-block (&rest instructions)
  (loop for (instruction next) on instructions
        when next do (setf (cfg:successor instruction) next)
          finally (return (make-instance 'basic-block
                                         :leader (car instructions)
                                         :trailer instruction))))
