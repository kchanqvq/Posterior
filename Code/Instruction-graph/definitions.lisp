(cl:in-package #:posterior-instruction-graph)

(defun definitions (instruction graph)
  (util:preimage instruction
                 (ensure-cache 'predecessors graph
                               (util:relation-preimage-for-graph
                                graph #'successors #'outputs))))

(defun single-definition (instruction graph)
  (let ((definitions (definitions instruction graph)))
    (when (= (length definitions) 1)
      (first definitions))))
