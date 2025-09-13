(cl:in-package #:common-lisp-user)

(defpackage #:posterior-basic-blocks
  (:use #:common-lisp)
  (:local-nicknames (#:util #:posterior-utilities)
                    (#:cfg #:posterior-instruction-graph))
  (:import-from #:alexandria
                #:rcurry
                #:maphash-values
                #:ensure-gethash
                #:make-gensym)
  (:export
   #:basic-block
   #:leader
   #:trailer
   #:compute-basic-blocks
   #:repair-trailer-successors
   #:map-basic-block
   #:traverse-basic-block
   #:make-basic-block
   #:block-program
   #:make-initargs
   #:ensure-datum-binding
   #:block-program-form))
