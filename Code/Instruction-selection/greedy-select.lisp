(cl:in-package #:posterior-instruction-selection)

(defclass greedy-select-client () ())

(defmethod translate-graph ((client greedy-select-client) initial-instruction)
  (transform:rewrite-graph
   initial-instruction
   (util:graph-relation-preimage
    initial-instruction #'cfg:successors #'cfg:outputs)
   (lambda (instruction)
     (or (absheap:side-effect-writes instruction)
         (not (= 1 (length (cfg:successors instruction))))))
   (curry #'compute-translation client)))
