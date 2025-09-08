(cl:in-package #:posterior-instruction-graph)

(defun predecessors (instruction graph)
  (util:preimage instruction
                 (ensure-cache 'predecessors graph
                               (util:relation-preimage-for-graph
                                graph #'successors #'successors))))
