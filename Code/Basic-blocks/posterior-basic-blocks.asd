(cl:in-package #:asdf-user)

(defsystem "posterior-basic-blocks"
  :depends-on ("alexandria"
               "posterior-utilities"
               "posterior-instruction-graph")
  :serial t
  :components
  ((:file "packages")
   (:file "basic-block")
   (:file "compute-basic-blocks")
   (:file "repair-trailer-successors")
   (:file "map-basic-block")
   (:file "make-basic-block")
   (:file "block-program")
   (:file "block-program-form")
   (:file "print-object")))
