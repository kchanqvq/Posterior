(cl:in-package #:asdf-user)

(defsystem "posterior-mir-instructions"
  :serial t
  :components
  ((:file "packages")
   (:file "data")
   (:file "instruction")
   (:file "new-virtual-register-instruction")
   (:file "add-instruction")
   (:file "subtract-instruction")
   (:file "multiply-instruction")
   (:file "divide-instruction")
   (:file "comparison-instructions")
   (:file "bitwise-instructions")
   (:file "shift-instructions")
   (:file "memory-read-instruction")
   (:file "memory-write-instruction")
   (:file "function-invocation-instructions")))
