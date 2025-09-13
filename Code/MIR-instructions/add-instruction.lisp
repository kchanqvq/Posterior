(cl:in-package #:posterior-mir-instructions)

(defclass add-instruction
    (cfg:instruction
     cfg:one-successor-mixin
     binary-operation-mixin
     commutative-mixin
     one-output-mixin)
  ())
