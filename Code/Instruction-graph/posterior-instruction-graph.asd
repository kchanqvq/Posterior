(cl:in-package #:asdf-user)

(defsystem "posterior-instruction-graph"
  :depends-on ("alexandria"
               "posterior-utilities")
  :serial t
  :components
  ((:file "packages")
   (:file "instruction")
   (:file "data")
   (:file "graph")
   (:file "cache")
   (:file "predecessors")
   (:file "definitions")
   (:file "uses")))
