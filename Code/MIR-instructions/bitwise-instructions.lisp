(cl:in-package #:posterior-mir-instructions)

(defclass binary-bitwise-instruction
    (cfg:instruction
     cfg:one-successor-mixin
     binary-operation-mixin
     commutative-mixin
     one-output-mixin)
  ())

(defclass bitwise-and-instruction (binary-bitwise-instruction)
  ())

(defclass bitwise-or-instruction (binary-bitwise-instruction)
  ())

(defclass bitwise-exclusive-or-instruction (binary-bitwise-instruction)
  ())

(defclass bitwise-not-instruction (instruction one-successor-mixin)
  ())
