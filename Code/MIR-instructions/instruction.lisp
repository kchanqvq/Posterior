(cl:in-package #:posterior-mir-instructions)

(defclass unary-operation-mixin ()
  ((%input :initarg :input :reader input)))

(defmethod inputs ((instruction unary-operation-mixin))
  (list (input instruction)))

(defgeneric input1 (instruction))

(defgeneric input2 (instruction))

(defclass binary-operation-mixin ()
  ((%input1 :initarg :input1 :reader input1)
   (%input2 :initarg :input2 :reader input2)))

(defmethod inputs ((instruction binary-operation-mixin))
  (list (input1 instruction) (input2 instruction)))

(defgeneric output (instruction))

(defclass one-output-mixin ()
  ((%output :initarg :output :reader output)))

(defmethod outputs ((instruction one-output-mixin))
  (list (output instruction)))

(defgeneric output1 (instruction))

(defgeneric output2 (instruction))

(defclass two-outputs-mixin ()
  ((%output1 :initarg :output1 :reader output1)
   (%output2 :initarg :output2 :reader output2)))

(defmethod outputs ((instruction two-outputs-mixin))
  (list (output1 instruction) (output2 instruction)))

(defclass commutative-mixin () ())
