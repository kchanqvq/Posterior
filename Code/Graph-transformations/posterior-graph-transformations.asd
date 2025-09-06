(cl:in-package #:asdf-user)

(defsystem "posterior-graph-transformations"
  :serial t
  :depends-on ("alexandria"
               "posterior-utilities"
               "posterior-instruction-graph")
  :components
  ((:file "packages")
   (:file "filter-graph")))
