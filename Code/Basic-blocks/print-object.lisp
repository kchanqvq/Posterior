(cl:in-package #:posterior-basic-blocks)

(defmethod print-object ((object cfg:graph) stream)
  (write-string "#." stream)
  (write (block-program-form object) :stream stream))
