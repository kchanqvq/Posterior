(cl:in-package #:posterior-graph-transformations)

;;; Destructively filter an instruction graph.
;;;
;;; This function destructively deletes instructions that do not
;;; satisfy TEST from GRAPH.
;;;
;;; The function TEST must return true for instructions with the numbers
;;; of successors other than one, otherwise the behavior is undefined.

(defun filter-graph (graph test)
  (let ((visited (make-hash-table :test 'eq)))
    (labels ((visit-instruction (instruction)
               (if (funcall test instruction)
                   (progn
                     (unless (gethash instruction visited)
                       (setf (gethash instruction visited) t)
                       (setf (cfg:successors instruction)
                             (mapcar #'visit-instruction (cfg:successors instruction))))
                     instruction)
                   (visit-instruction (cfg:successor instruction)))))
      (setf (cfg:initial-instruction graph)
            (visit-instruction (cfg:initial-instruction graph)))
      (cfg:clear-cache graph)
      graph)))
