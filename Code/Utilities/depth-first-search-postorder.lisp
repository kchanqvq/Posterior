(cl:in-package #:posterior-utilities)

;;; This function does a depth-first postorder traversal of a graph of
;;; nodes starting with START-NODE.  The function SUCCESSORS-FUNCTION
;;; must return a proper list of successors of a node.  FUNCTION will
;;; be called exactly once for each node in the instruction graph, and
;;; it will be called with that node as the only argument.

(defun depth-first-search-postorder (function start-node successors-function)
  (let ((table (make-hash-table :test #'eq)))
    (labels ((traverse (node)
               (unless (gethash node table)
                 (setf (gethash node table) t)
                 (loop for successor in (funcall successors-function node)
                       do (traverse successor))
                 (funcall function node))))
      (traverse start-node))))
