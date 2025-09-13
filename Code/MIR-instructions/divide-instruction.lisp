(cl:in-package #:posterior-mir-instructions)

(defclass divide-instruction
    (cfg:instruction
     cfg:one-successor-mixin
     binary-operation-mixin
     two-outputs-mixin)
  ())
