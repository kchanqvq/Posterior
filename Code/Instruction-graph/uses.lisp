(cl:in-package #:posterior-instruction-graph)

(defun uses (instruction graph)
  (util:preimage instruction
                 (ensure-cache 'predecessors graph
                               (util:relation-preimage-for-graph
                                graph #'successors #'inputs))))

(defun single-use (instruction graph)
  (let ((uses (uses instruction graph)))
    (when (= (length uses) 1)
      (first uses))))
