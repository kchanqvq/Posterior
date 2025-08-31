(cl:in-package #:posterior-mir-instructions)

(defclass add-instruction
    (instruction
     one-successor-mixin
     binary-operation-mixin
     commutative-mixin
     one-output-mixin)
  ())
