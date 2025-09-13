(cl:in-package #:posterior-basic-blocks)

(defgeneric leader (basic-block))

(defgeneric trailer (basic-block))

(defgeneric successors (basic-block))

(defclass basic-block ()
  ((%leader :initarg :leader :accessor leader)
   (%trailer :initarg :trailer :accessor trailer)
   (%successors :initarg :successor :accessor successors)))
