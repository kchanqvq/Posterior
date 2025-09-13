(cl:in-package #:posterior-mir-instructions)

(defgeneric value (literal))

(defclass literal (cfg:datum)
  ((%value :initarg :value :reader value)))

(defmethod bb:make-initargs ((datum literal))
  (list* :value `',(value datum) (call-next-method)))

(defgeneric size (virtual-register))

(defclass virtual-register (cfg:datum)
  (;; This slot contains the size in bits of the virtual register.
   (%size :initarg :size :reader size)))

(defmethod bb:make-initargs ((datum virtual-register))
  (list* :size `',(size datum) (call-next-method)))

(defclass integer-virtual-register (virtual-register) ())

(defclass floating-point-virtual-register (virtual-register) ())
