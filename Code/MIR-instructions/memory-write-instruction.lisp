(cl:in-package #:posterior-mir-instructions)

;;; This instruction writes an item into a memory location.  It takes
;;; two inputs.  The first input is the address of a location in
;;; memory.  The second input is the datum to be stored in that
;;; location.

(defclass memory-write-instruction
    (cfg:instruction
     cfg:one-successor-mixin
     binary-operation-mixin)
  ())

;; TODO: allow annotating precise abstract heap information on the
;; input register
(defmethod absheap:side-effect-writes ((instruction memory-write-instruction))
  (list absheap:*world*))
