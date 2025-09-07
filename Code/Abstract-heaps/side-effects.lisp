(cl:in-package #:posterior-abstract-heaps)

(defgeneric side-effect-reads (instruction))

(defgeneric side-effect-writes (instruction))

(defmethod side-effect-reads ((instruction t))
  '())

(defmethod side-effect-writes ((instruction t))
  '())
