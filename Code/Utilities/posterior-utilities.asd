(cl:in-package #:asdf-user)

(defsystem "posterior-utilities"
  :serial t
  :components
  ((:file "packages")
   (:file "depth-first-search-preorder")
   (:file "depth-first-search-postorder")
   (:file "count-nodes")
   (:file "preimage")))
