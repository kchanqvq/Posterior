(cl:in-package #:asdf-user)

(defsystem "posterior-instruction-selection"
  :serial t
  :depends-on ("posterior-utilities"
               "posterior-instruction-graph"
               "posterior-graph-transformations"
               "posterior-abstract-heaps")
  :components
  ((:file "packages")
   (:file "translate-graph")
   (:file "compute-translation")
   (:file "greedy-select")))
