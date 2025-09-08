(cl:in-package #:posterior-instruction-graph)

(defun get-cache (key graph)
  (gethash key (cache graph)))

(defmacro ensure-cache (key graph value)
  `(alexandria:ensure-gethash ,key (cache ,graph) ,value))

(defun clear-cache (graph)
  (clrhash (cache graph )))
