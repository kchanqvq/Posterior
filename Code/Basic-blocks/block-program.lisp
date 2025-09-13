(cl:in-package #:posterior-basic-blocks)

;;; Basic block based syntax for instruction graph.
;;;
;;; Syntax:
;;;
;;; DATUM-BINDINGS := (DATUM-NAME (DATUM-CLASS-NAME DATUM-INITARGS*))*
;;;
;;; BLOCKS := (BLOCK-NAME (SUCCESSORS-BLOCK-NAME*) INSTRUCTION-SPEC*)
;;;
;;; INSTRUCTION-SPEC := (INSTRUCTION-CLASS-NAME INSTRUCTION-INITARGS*)
;;;
;;; Create and return an instruction graph instance of the class
;;; denoted by GRAPH-CLASS-NAME.  GRAPH-INITARGS can be used to pass
;;; additional initialization arguments to the instruction graph
;;; instance.
;;;
;;; The instruction nodes contained in the instruction graph is
;;; created according to BLOCKS.
;;;
;;; Each DATUM-NAME established in DATUM-BINDINGS is bound to the
;;; corresponding datum instance when evaluating INSTRUCTION-INITARGS.
;;;
;;; DATUM-INITARGS and INSTRUCTION-INITARGS are evaluated.

(defmacro block-program ((graph-class-name &rest graph-initargs)
                         (&rest datum-bindings) &body blocks)
  (let ((block-names (mapcar #'car blocks)))
    `(let (,@(loop for (block-name) in blocks
                   collect `(,block-name (make-instance 'cfg:instruction)))
           ,@(loop for (datum-name (class-name . initargs)) in datum-bindings
                   collect `(,datum-name (make-instance ',class-name ,@initargs))))
       ,@(loop for (name successors . instructions) in blocks
               for instruction-forms
                 = (loop for first = t then nil
                         for (class-name . initargs) in instructions
                         if first
                           collect `(change-class ,name ',class-name ,@initargs)
                         else
                           collect `(make-instance ',class-name ,@initargs))
               collect
               `(setf (cfg:successors (trailer (make-basic-block ,@instruction-forms)))
                      (list ,@successors)))
       (make-instance ',graph-class-name :initial-instruction ,(first block-names) ,@graph-initargs))))
