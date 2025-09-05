(cl:in-package #:posterior-utilities)

(defgeneric preimage-table (preimage))

(defclass preimage ()
  ((%preimage-table :initform (make-hash-table :test #'eq)
                    :reader preimage-table)))

(defun preimage (value preimage)
  (gethash value (preimage-table preimage)))

(defun function-preimage (values function)
  (let* ((result (make-instance 'preimage))
         (table (preimage-table result)))
    (loop for value in values
          for image = (funcall function value)
          do (push value (gethash image table '())))
    result))

(defun relation-preimage (values relation)
  (let* ((result (make-instance 'preimage))
         (table (preimage-table result)))
    (loop for value in values
          for images = (funcall relation value)
          do (loop for image in images
                   do (push value (gethash image table '()))))
    result))
