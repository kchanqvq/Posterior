(in-package #:posterior-graph-transformations/test)

(fiveam:in-suite :posterior-graph-transformations/test)

(fiveam:def-test filter-graph.1 ()
  (flet ((make-graph ()
           (bb:block-program (cfg:graph) ()
             (l1 (l2)
                 (dummy-instruction :value 4 :inputs () :outputs ()))
             (l2 (l2)
                 (dummy-instruction :value 3 :inputs () :outputs ())
                 (dummy-instruction :value 6 :inputs () :outputs ())
                 (dummy-instruction :value 5 :inputs () :outputs ())
                 (dummy-instruction :value 8 :inputs () :outputs ())
                 (dummy-instruction :value 10 :inputs () :outputs ())))))
    (fiveam:is (= 2 (util:count-nodes
                     (cfg:initial-instruction
                      (transform:filter-graph (make-graph) (compose #'oddp #'value)))
                     #'cfg:successors)))
    (fiveam:is (= 4 (util:count-nodes
                     (cfg:initial-instruction
                      (transform:filter-graph (make-graph) (compose #'evenp #'value)))
                     #'cfg:successors)))))
