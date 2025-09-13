(cl:in-package #:posterior-mir-instructions)

(defclass unary-operation-mixin ()
  ((%input :initarg :input :reader input)))

(defmethod cfg:inputs ((instruction unary-operation-mixin))
  (list (input instruction)))

(defmethod bb:make-initargs ((instruction unary-operation-mixin))
  (list* :input (bb:ensure-datum-binding (input instruction)) (call-next-method)))

(defgeneric input1 (instruction))

(defgeneric input2 (instruction))

(defclass binary-operation-mixin ()
  ((%input1 :initarg :input1 :reader input1)
   (%input2 :initarg :input2 :reader input2)))

(defmethod cfg:inputs ((instruction binary-operation-mixin))
  (list (input1 instruction) (input2 instruction)))

(defmethod bb:make-initargs ((instruction binary-operation-mixin))
  (list* :input1 (bb:ensure-datum-binding (input1 instruction))
         :input2 (bb:ensure-datum-binding (input2 instruction))
         (call-next-method)))

(defgeneric output (instruction))

(defclass one-output-mixin ()
  ((%output :initarg :output :reader output)))

(defmethod cfg:outputs ((instruction one-output-mixin))
  (list (output instruction)))

(defmethod bb:make-initargs ((instruction one-output-mixin))
  (list* :output (bb:ensure-datum-binding (output instruction)) (call-next-method)))

(defgeneric output1 (instruction))

(defgeneric output2 (instruction))

(defclass two-outputs-mixin ()
  ((%output1 :initarg :output1 :reader output1)
   (%output2 :initarg :output2 :reader output2)))

(defmethod cfg:outputs ((instruction two-outputs-mixin))
  (list (output1 instruction) (output2 instruction)))

(defmethod bb:make-initargs ((instruction two-outputs-mixin))
  (list* :output1 (bb:ensure-datum-binding (output1 instruction))
         :output2 (bb:ensure-datum-binding (output2 instruction))
         (call-next-method)))

(defclass commutative-mixin () ())
