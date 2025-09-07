(cl:in-package #:common-lisp-user)

(defpackage #:posterior-instruction-selection
  (:use #:common-lisp)
  (:import-from #:alexandria
                #:curry)
  (:local-nicknames (#:util #:posterior-utilities)
                    (#:cfg #:posterior-instruction-graph)
                    (#:transform #:posterior-graph-transformations)
                    (#:absheap #:posterior-abstract-heaps))
  (:export #:translate-graph
           #:compute-translation
           #:greedy-select-client))
