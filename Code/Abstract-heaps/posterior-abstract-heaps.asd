(cl:in-package #:asdf-user)

(defsystem "posterior-abstract-heaps"
  :serial t
  :components
  ((:file "packages")
   (:file "abstract-heap")
   (:file "side-effects")
   (:file "alias-p")
   (:file "interfere-p")
   (:file "world")))
