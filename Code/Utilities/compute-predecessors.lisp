(cl:in-package #:posterior-utilities)

(defgeneric predecessors-table (predecessors))

(defclass predecessors ()
  ((%predecessors-table :initform (make-hash-table :test #'eq)
                        :reader predecessors-table)))

(defun predecessors (node predecessors)
  (gethash node (predecessors-table predecessors)))

;;; Compute predecessors for each node in a graph of nodes starting
;;; with START-NODE.  The function SUCCESSORS-FUNCTION must return a
;;; proper list of successors of a node.  To client code, the object
;;; returned is opaque, and can be used to pass to the function
;;; PREDECESSORS.

(defun compute-predecessors (start-node successors-function)
  (let* ((result (make-instance 'predecessors))
         (table (predecessors-table result)))
    (depth-first-search-preorder
     (lambda (node)
       (loop for successor in (funcall successors-function node)
             do (push node (gethash successor table '()))))
     start-node successors-function)
    result))
