(cl:in-package #:posterior-mir-instructions)

;;; These instructions branch according to comparing their two inputs.
;;; They have two successors.  Control transfers to the first successor
;;; if result of the comparison is false, and to the second successor
;;; if result of the comparison is true.

(defclass comparison-mixin
    (cfg:instruction
     cfg:two-successors-mixin
     binary-operation-mixin)
  ())

(defclass signed-less-instruction (comparison-mixin)
  ())

(defclass signed-not-greater-instruction (comparison-mixin)
  ())

(defclass unsigned-less-instruction (comparison-mixin)
  ())

(defclass unsigned-not-greater-instruction (comparison-mixin)
  ())

(defclass equal-instruction (comparison-mixin)
  ())
