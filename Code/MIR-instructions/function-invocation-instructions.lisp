(cl:in-package #:posterior-mir-instructions)

;;; This instruction has as many inputs as there are arguments at the
;;; call site.  Each input is either a virtual register, or a literal.
;;; It has as many outputs as the number of values that is expected at
;;; the call site.  Each output is a virtual register.
(defclass call-instruction (instruction)
  ((%inputs :initarg :inputs :reader inputs)
   (%outputs :initarg :outputs :reader outputs)))

;;; This instruction has as many inputs as there are values to be
;;; returned from a function call.
(defclass return-instruction (instruction zero-successors-mixin)
  ((%inputs :initarg :inputs :reader inputs)))

(defmethod absheap:side-effect-writes ((instruction call-instruction))
  (list absheap:*world*))
