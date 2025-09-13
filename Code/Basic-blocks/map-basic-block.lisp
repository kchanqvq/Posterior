(cl:in-package #:posterior-basic-blocks)

;;; Call FUNCTION on each instruction in BASIC-BLOCK and return nil.
(defun traverse-basic-block (function basic-block)
  (loop for instruction = (leader basic-block)
          then (cfg:successor instruction)
        do (funcall function instruction)
        until (eq instruction (trailer basic-block))))

;;; Call FUNCTION on each instruction in BASIC-BLOCK.  Collect the
;;; primary return values of FUNCTION into a list and return it.
(defun map-basic-block (function basic-block)
  (loop for instruction = (leader basic-block)
          then (cfg:successor instruction)
        collect (funcall function instruction)
        until (eq instruction (trailer basic-block))))
