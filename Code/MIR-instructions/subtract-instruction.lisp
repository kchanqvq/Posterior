(cl:in-package #:posterior-mir-instructions)

(defclass subtract-instruction
    (cfg:instruction
     cfg:one-successor-mixin
     binary-operation-mixin
     one-output-mixin)
  ())
