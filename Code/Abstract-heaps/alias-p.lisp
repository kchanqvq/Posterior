(cl:in-package #:posterior-abstract-heaps)

;;; Test if side effects on two abstract heaps may interfere

(defgeneric alias-p (abstract-heap-1 abstract-heap-2))

(defun child-p (heap-1 heap-2)
  (loop while heap-1
        when (eq heap-1 heap-2)
          return t
        do (setf heap-1 (parent heap-1))))

(defmethod alias-p ((heap-1 abstract-heap) (heap-2 abstract-heap))
  (or (child-p heap-1 heap-2) (child-p heap-2 heap-1)))
