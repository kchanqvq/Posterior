(cl:in-package #:common-lisp-user)

(defpackage #:posterior-graph-transformations/test
  (:use #:common-lisp)
  (:local-nicknames (#:util #:posterior-utilities)
                    (#:cfg #:posterior-instruction-graph)
                    (#:bb #:posterior-basic-blocks)
                    (#:transform #:posterior-graph-transformations))
  (:import-from #:alexandria #:compose)
  (:export #:filter-graph
           #:placeholder
           #:index
           #:rewrite-graph))

(fiveam:def-suite :posterior-graph-transformations/test)
