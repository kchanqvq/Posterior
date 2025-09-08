(cl:in-package #:posterior-utilities)

(defgeneric preimage-table (preimage))

(defclass preimage ()
  ((%preimage-table :initform (make-hash-table :test #'eq)
                    :reader preimage-table)))

(defun preimage (value preimage)
  (gethash value (preimage-table preimage)))

(defun relation-preimage-for-graph (start-node successors-function relation)
  (let* ((result (make-instance 'preimage))
         (table (preimage-table result)))
    (depth-first-search-preorder
     (lambda (value)
       (loop for image in (funcall relation value)
             do (push value (gethash image table '()))))
     start-node successors-function)
    result))
