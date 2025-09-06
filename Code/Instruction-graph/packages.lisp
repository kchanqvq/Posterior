(cl:in-package #:common-lisp-user)

(defpackage #:posterior-instruction-graph
  (:use #:common-lisp)
  (:export
   #:instruction
   #:successors
   #:inputs
   #:outputs
   #:zero-successors-mixin
   #:successor
   #:one-successor-mixin
   #:successor1
   #:successor2
   #:two-successors-mixin
   #:datum
   #:filter-graph))
