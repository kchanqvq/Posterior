(cl:in-package #:posterior-mir-instructions)

(defclass subtract-instruction
    (instruction
     one-successor-mixin
     binary-operation-mixin
     one-output-mixin)
  ())
