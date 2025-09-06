(cl:in-package #:posterior-instruction-graph)

(defclass instruction () ())

(defgeneric successors (instruction))

(defgeneric (setf successors) (new-value instruction))

(defgeneric inputs (instruction))

(defgeneric outputs (instruction))

(defclass zero-successors-mixin () ())

(defmethod successors ((instruction zero-successors-mixin))
  '())

(defmethod (setf successors) (new-value (instruction zero-successors-mixin))
  (assert (null new-value))
  new-value)

(defgeneric successor (instruction))

(defclass one-successor-mixin ()
  ((%successor :initarg :successor :accessor successor)))

(defmethod successors ((instruction one-successor-mixin))
  (list (successor instruction)))

(defmethod (setf successors) (new-value (instruction one-successor-mixin))
  (assert (= (length new-value) 1))
  (setf (successor instruction) (first new-value))
  new-value)

(defgeneric successor1 (instruction))

(defgeneric successor2 (instruction))

(defclass two-successors-mixin ()
  ((%successor1 :initarg :successor1 :accessor successor1)
   (%successor2 :initarg :successor2 :accessor successor2)))

(defmethod successors ((instruction two-successors-mixin))
  (list (successor1 instruction) (successor2 instruction)))

(defmethod (setf successors) (new-value (instruction two-successors-mixin))
  (assert (= (length new-value) 2))
  (setf (successor1 instruction) (first new-value)
        (successor2 instruction) (second new-value))
  new-value)
