(cl:in-package #:common-lisp-user)

(defpackage #:posterior-utilities
  (:use #:common-lisp)
  (:export
   #:depth-first-search-preorder
   #:depth-first-search-postorder
   #:count-nodes
   #:compute-predecessors
   #:predecessors
   #:preimage
   #:function-preimage
   #:relation-preimage))
