(cl:in-package #:posterior-utilities)

(defun count-nodes (start-node successors-function)
  (let ((count 0))
    (depth-first-search-preorder
     (lambda (node)
       (declare (ignore node))
       (incf count))
     start-node successors-function)
    count))
