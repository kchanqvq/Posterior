(cl:in-package #:posterior-utilities)

;;; This function does a depth-first postorder traversal of a graph of
;;; nodes starting with START-NODE.  The function SUCCESSORS-FUNCTION
;;; must return a proper list of successors of a node.  FUNCTION will
;;; be called exactly once for each node in the instruction graph, and
;;; it will be called with that node as the only argument.
;;;
;;; For a given node, SUCCESSORS-FUNCTION is called to compute the
;;; successors before FUNCTION is called, so that FUNCTION is allowed
;;; to mutate the node such that SUCCESSORS-FUNCTION would return a
;;; different list of successors.  Such mutation will not affect the
;;; set and ordering of nodes that are traversed.

(defun depth-first-search-postorder (function start-node successors-function)
  (let ((table (make-hash-table :test #'eq)))
    (labels ((traverse (node)
               (unless (gethash node table)
                 (setf (gethash node table) t)
                 (loop for successor in (funcall successors-function node)
                       do (traverse successor))
                 (funcall function node))))
      (traverse start-node))))
