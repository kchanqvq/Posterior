(cl:in-package #:posterior-mir-instructions)

;;; This instruction is used to introduce a new virtual register.  It
;;; must dominate every instruction that references or assigns to the
;;; virtual register being introduced.  The initial value can be a
;;; literal or an existing virtual register.

(defclass new-virtual-register-instruction
    (instruction
     one-successor-mixin
     unary-operation-mixin
     one-output-mixin)
  ())
