(cl:in-package #:common-lisp-user)

(defpackage #:posterior-instruction-graph
  (:use #:common-lisp)
  (:local-nicknames (#:util #:posterior-utilities))
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
   #:graph
   #:initial-instruction
   #:get-cache
   #:ensure-cache
   #:clear-cache
   #:predecessors
   #:definitions
   #:single-definition
   #:uses
   #:single-use))
