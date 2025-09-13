(cl:in-package #:posterior-basic-blocks)

(defun instruction-is-leader-p (instruction graph)
  (let ((predecessors (cfg:predecessors instruction graph)))
    (or (/= (length predecessors) 1)
        (not (typep (first predecessors) 'cfg:one-successor-mixin)))))

(defun instruction-is-trailer-p (instruction graph)
  (or (/= (length (cfg:successors instruction)) 1)
      (/= (length (cfg:predecessors (cfg:successor instruction) graph))
          1)))

(defun fill-basic-block (basic-block graph leader-to-block)
  (loop with last = (trailer basic-block)
        until (instruction-is-trailer-p last graph)
        do (setf last (cfg:successor last))
        finally (setf (trailer basic-block) last)
                (setf (successors basic-block)
                      (mapcar (rcurry #'gethash leader-to-block)
                              (cfg:successors last)))))

;;; Compute the graph of basic blocks in INSTRUCTION-GRAPH.  Return
;;; the entry basic block.
(defun compute-basic-blocks (instruction-graph)
  (let ((leader-to-block (make-hash-table :test 'eq)))
    (util:depth-first-search-preorder
     (lambda (instruction)
       (when (instruction-is-leader-p instruction instruction-graph)
         (setf (gethash instruction leader-to-block)
               (make-instance 'basic-block
                              :leader instruction
                              :trailer instruction))))
     (cfg:initial-instruction instruction-graph) #'cfg:successors)
    (maphash-values (rcurry #'fill-basic-block instruction-graph leader-to-block)
                    leader-to-block)
    (gethash (cfg:initial-instruction instruction-graph) leader-to-block)))
