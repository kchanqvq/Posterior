(in-package #:posterior-graph-transformations/test)

(fiveam:in-suite :posterior-graph-transformations/test)

(fiveam:def-test rewrite-graph.1 ()
  (flet ((make-graph ()
           (bb:block-program (cfg:graph) ()
             (l1 (l2)
                 (dummy-instruction :value 4 :inputs () :outputs ()))
             (l2 (l2)
                 (dummy-instruction :value 3 :inputs () :outputs ())
                 (dummy-instruction :value 6 :inputs () :outputs ())
                 (dummy-instruction :value 5 :inputs () :outputs ())
                 (dummy-instruction :value 8 :inputs () :outputs ())
                 (dummy-instruction :value 10 :inputs () :outputs ()))))
         (make-it-double (instruction)
           (bb:leader
            (bb:make-basic-block
             (make-instance 'dummy-instruction
                            :value (value instruction)
                            :inputs (cfg:inputs instruction)
                            :outputs (cfg:outputs instruction))
             (make-instance 'dummy-instruction
                            :value (value instruction)
                            :inputs (cfg:inputs instruction)
                            :outputs (cfg:outputs instruction))
             (make-instance 'transform:placeholder :index 0)))))
    (fiveam:is (= 4 (util:count-nodes
                     (cfg:initial-instruction
                      (transform:rewrite-graph (make-graph) (compose #'oddp #'value)
                                               #'make-it-double))
                     #'cfg:successors)))
    (fiveam:is (= 8 (util:count-nodes
                     (cfg:initial-instruction
                      (transform:rewrite-graph (make-graph) (compose #'evenp #'value)
                                               #'make-it-double))
                     #'cfg:successors)))))
