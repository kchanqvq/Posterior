(cl:in-package #:asdf-user)

(defsystem "posterior-graph-transformations"
  :serial t
  :depends-on ("alexandria"
               "posterior-utilities"
               "posterior-instruction-graph")
  :components
  ((:file "packages")
   (:file "filter-graph")
   (:file "rewrite-graph"))
  :in-order-to ((test-op (test-op "posterior-graph-transformations/test"))))

(defsystem "posterior-graph-transformations/test"
  :depends-on ("alexandria"
               "posterior-graph-transformations"
               "posterior-basic-blocks"
               "fiveam")
  :components ((:module "Test"
                :serial t
                :components ((:file "packages")
                             (:file "dummy-instruction")
                             (:file "filter-graph")
                             (:file "rewrite-graph"))))
  :perform (test-op (operation component)
                    (uiop:symbol-call '#:fiveam '#:run! :posterior-graph-transformations/test)))
