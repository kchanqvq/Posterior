(cl:in-package #:posterior-abstract-heaps)

(defgeneric parent (abstract-heap))

(defclass abstract-heap ()
  ((%parent :initarg :parent :reader parent)))
