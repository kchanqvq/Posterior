(cl:in-package #:posterior-mir-instructions)

(defclass divide-instruction
    (instruction
     one-successor-mixin
     binary-operation-mixin
     two-outputs-mixin)
  ())
