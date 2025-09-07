(cl:in-package #:common-lisp-user)

(defpackage #:posterior-abstract-heaps
  (:use #:common-lisp)
  (:export
   #:abstract-heap
   #:parent
   #:side-effect-reads
   #:side-effect-writes
   #:alias-p
   #:interfere-p
   #:*world*))
