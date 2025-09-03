(cl:in-package #:asdf-user)

(defsystem "posterior-instruction-graph"
  :depends-on ("posterior-utilities")
  :serial t
  :components
  ((:file "packages")
   (:file "instruction")
   (:file "compute-basic-blocks")))
