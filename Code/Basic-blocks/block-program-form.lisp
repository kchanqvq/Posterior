(cl:in-package #:posterior-basic-blocks)

;;; Return a list of forms which evaluates to additional initargs used
;;; by BLOCK-PROGRAM to create an object similar to OBJECT.

(defgeneric make-initargs (object))

(defmethod make-initargs ((object t))
  '())

(defun class-name-and-initargs (object)
  (list* (class-name (class-of object)) (make-initargs object)))

(defvar *datum-names*)

;;; Return a symbol which will be bound to an object similar to DATUM
;;; when the forms returned by a surrounding MAKE-INITARGS call are
;;; evaluated. Must only be used inside the dynamic extents of
;;; MAKE-INITARGS methods.

(defun ensure-datum-binding (datum)
  (ensure-gethash datum *datum-names* (make-gensym '#:datum)))

;;; Return a BLOCK-PROGRAM form which evaluates to a instruction graph
;;; similar to INSTRUCTION-GRAPH.

(defun block-program-form (instruction-graph)
  (let ((*gensym-counter* 0)
        (*datum-names* (make-hash-table :test 'eq))
        (entry-block (compute-basic-blocks instruction-graph))
        (block-names (make-hash-table :test 'eq))
        (block-forms '()))
    (util:depth-first-search-preorder
     (lambda (basic-block)
       (setf (gethash basic-block block-names) (make-gensym '#:label)))
     entry-block #'successors)
    (util:depth-first-search-preorder
     (lambda (basic-block)
       (push `(,(gethash basic-block block-names)
               ,(mapcar (rcurry #'gethash block-names)
                        (successors basic-block))
               ,@(map-basic-block #'class-name-and-initargs basic-block))
             block-forms))
     entry-block #'successors)
    `(block-program
         ,(class-name-and-initargs instruction-graph)
         ,(loop for datum being the hash-key of *datum-names*
                  using (hash-value datum-name)
                collect `(,datum-name ,(class-name-and-initargs datum)))
       ,@(nreverse block-forms))))
