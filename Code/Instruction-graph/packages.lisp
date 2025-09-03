(cl:in-package #:common-lisp-user)

(defpackage #:posterior-instruction-graph
  (:use #:common-lisp)
  (:local-nicknames (#:utilities #:posterior-utilities))
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
   #:basic-block
   #:leader
   #:trailer
   #:compute-basic-blocks))
