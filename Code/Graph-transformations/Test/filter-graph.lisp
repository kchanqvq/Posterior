(in-package #:posterior-graph-transformations/test)

(fiveam:in-suite :posterior-graph-transformations/test)

(defclass dummy-instruction (cfg:instruction cfg:one-successor-mixin)
  ((%value :initarg :value :reader value)))

(defmethod bb:make-initargs ((instruction dummy-instruction))
  (list* :value `',(value instruction) (call-next-method)))

(fiveam:def-test filter-graph.1 ()
  (flet ((make-graph ()
           (bb:block-program (cfg:graph) ()
             (l1 (l2)
                 (dummy-instruction :value 4))
             (l2 (l2)
                 (dummy-instruction :value 3)
                 (dummy-instruction :value 2)
                 (dummy-instruction :value 5)
                 (dummy-instruction :value 2)
                 (dummy-instruction :value 2)))))
    (fiveam:is (= 2 (util:count-nodes
                     (cfg:initial-instruction
                      (transform:filter-graph (make-graph) (compose #'oddp #'value)))
                     #'cfg:successors)))
    (fiveam:is (= 4 (util:count-nodes
                     (cfg:initial-instruction
                      (transform:filter-graph (make-graph) (compose #'evenp #'value)))
                     #'cfg:successors)))))
