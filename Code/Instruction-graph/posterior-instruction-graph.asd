(cl:in-package #:asdf-user)

(defsystem "posterior-instruction-graph"
  :serial t
  :components
  ((:file "packages")
   (:file "instruction")
   (:file "data")
   (:file "filter-graph")))
