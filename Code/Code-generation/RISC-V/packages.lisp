(in-package #:common-lisp-user)

(defpackage #:posterior-code-generation-risc-v
  (:use #:common-lisp)
  (:local-nicknames (#:cfg #:posterior-instruction-graph)
                    (#:mir #:posterior-mir-instructions)
                    (#:isel #:posterior-instruction-selection))
  (:import-from #:posterior-graph-transformations
                #:placeholder)
  (:export))
