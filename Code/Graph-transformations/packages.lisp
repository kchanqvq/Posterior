(cl:in-package #:common-lisp-user)

(defpackage #:posterior-graph-transformations
  (:use #:common-lisp)
  (:import-from #:alexandria
                #:rcurry
                #:mappend
                #:ensure-gethash
                #:hash-table-keys)
  (:local-nicknames (#:util #:posterior-utilities)
                    (#:cfg #:posterior-instruction-graph))
  (:export #:filter-graph))
