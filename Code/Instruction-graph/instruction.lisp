(cl:in-package #:posterior-instruction-graph)

(defclass instruction () ())

(defgeneric successors (instruction))

(defgeneric inputs (instruction))

(defgeneric outputs (instruction))

(defclass zero-successors-mixin () ())

(defmethod successors ((instruction zero-successor-mixin))
  '())

(defgeneric successor (instruction))

(defclass one-successor-mixin ()
  ((%successor :initarg :successor :reader successor)))

(defmethod successors ((instruction one-successor-mixin))
  (list (successor instruction)))

(defgeneric successor1 (instruction))

(defgeneric successor2 (instruction))

(defclass two-successors-mixin ()
  ((%successor1 :initarg :successor1 :reader successor1)
   (%successor2 :initarg :successor2 :reader successor2)))

(defmethod successors ((instruction two-successors-mixin))
  (list (successor1 instruction) (successor2 instruction)))
