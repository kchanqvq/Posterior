(cl:in-package #:posterior-instruction-graph)

(defgeneric initial-instruction (graph))

(defgeneric cache (graph))

(defclass graph ()
  ((%initial-instruction :initarg :initial-instruction :reader initial-instruction)
   (%cache :initform (make-hash-table) :reader cache)))
