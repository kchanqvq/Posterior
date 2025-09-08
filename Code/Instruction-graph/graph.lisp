(cl:in-package #:posterior-instruction-graph)

(defgeneric initial-instruction (graph))

(defgeneric (setf initial-instruction) (new-value graph))

(defgeneric cache (graph))

(defclass graph ()
  ((%initial-instruction :initarg :initial-instruction :accessor initial-instruction)
   (%cache :initform (make-hash-table) :reader cache)))
