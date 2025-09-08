(cl:in-package #:posterior-instruction-selection)

(defclass greedy-select-client () ())

(defmethod translate-graph ((client greedy-select-client) graph)
  (transform:rewrite-graph
   graph
   (lambda (instruction)
     (or (absheap:side-effect-writes instruction)
         (not (= 1 (length (cfg:successors instruction))))))
   (curry #'compute-translation client graph)))
