(cl:in-package #:posterior-mir-instructions)

;;; This instruction reads a memory location.  It has a single input
;;; which is the address of a location in memory.  It has a single
;;; output which is set to the contents of the memory location
;;; specified by the input.

(defclass memory-read-instruction
    (cfg:instruction
     cfg:one-successor-mixin
     unary-operation-mixin
     one-output-mixin)
  ())

;; TODO: allow annotating precise abstract heap information on the
;; input register
(defmethod absheap:side-effect-reads ((instruction memory-read-instruction))
  (list absheap:*world*))
