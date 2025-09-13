(cl:in-package #:posterior-mir-instructions)

;;; This instruction has as many inputs as there are arguments at the
;;; call site.  Each input is either a virtual register, or a literal.
;;; It has as many outputs as the number of values that is expected at
;;; the call site.  Each output is a virtual register.
(defclass call-instruction (cfg:instruction)
  ((%inputs :initarg :inputs :reader cfg:inputs)
   (%outputs :initarg :outputs :reader cfg:outputs)))

(defmethod bb:make-initargs ((instruction call-instruction))
  (list* :inputs `(list ,@(mapcar #'bb:ensure-datum-binding (cfg:inputs instruction)))
         :outputs `(list ,@(mapcar #'bb:ensure-datum-binding (cfg:outputs instruction)))
         (call-next-method)))

;;; This instruction has as many inputs as there are values to be
;;; returned from a function call.
(defclass return-instruction (cfg:instruction cfg:zero-successors-mixin)
  ((%inputs :initarg :inputs :reader cfg:inputs)))

(defmethod bb:make-initargs ((instruction return-instruction))
  (list* :inputs `(list ,@(mapcar #'bb:ensure-datum-binding (cfg:inputs instruction)))
         (call-next-method)))

(defmethod absheap:side-effect-writes ((instruction call-instruction))
  (list absheap:*world*))
