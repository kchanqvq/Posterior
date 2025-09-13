(cl:in-package #:posterior-basic-blocks)

(defun repair-trailer-successors (basic-blocks)
  (loop for basic-block in basic-blocks
        for trailer = (trailer basic-block)
        for new-successors = (mapcar #'leader (successors trailer))
        do (reinitialize-instance trailer :successors new-successors)))
