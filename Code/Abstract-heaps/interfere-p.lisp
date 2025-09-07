(cl:in-package #:posterior-abstract-heaps)

;;; Test if side effects of two instruction may interfere

(defgeneric interfere-p (instruction-1 instruction-2))

(defun compute-interfere-p (reads-1 writes-1 reads-2 writes-2)
  (or (loop for read-1 in reads-1
              thereis (loop for write-2 in writes-2
                              thereis (alias-p read-1 write-2)))
      (loop for write-1 in writes-1
              thereis (loop for read-2 in reads-2
                            thereis (alias-p write-1 read-2)))
      (loop for write-1 in writes-1
            thereis (loop for write-2 in writes-2
                            thereis (alias-p write-1 write-2)))))

(defmethod interfere-p (instruction-1 instruction-2)
  (compute-interfere-p
   (side-effect-reads instruction-1)
   (side-effect-writes instruction-1)
   (side-effect-reads instruction-2)
   (side-effect-writes instruction-2)))
