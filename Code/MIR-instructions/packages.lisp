(cl:in-package #:common-lisp-user)

(defpackage #:posterior-mir-instructions
  (:use #:common-lisp)
  (:import-from #:posterior-instruction-graph
                #:instruction
                #:successors
                #:inputs
                #:outputs
                #:zero-successors-mixin
                #:successor
                #:one-successor-mixin
                #:successor1
                #:successor2
                #:two-successors-mixin)
  (:export
   #:instruction
   #:datum
   #:literal #:value
   #:virtual-register #:size
   #:integer-virtual-register
   #:floating-point-virtual-register
   #:successors
   #:one-successor-mixin #:successor
   #:two-successors-mixin
   #:successor1 #:successor2
   #:inputs
   #:binary-operation-mixin #:input
   #:unary-operation-mixin #:input1 #:input2
   #:outputs
   #:one-output-mixin #:output
   #:commutative-mixin
   #:new-virtual-register-instruction
   #:add-instruction #:augend #:addend #:sum
   #:subtract-instruction #:minuend #:subtrahend #:difference
   #:multiply-instruction #:multiplicand #:multiplier #:product
   #:divide-instruction #:divisor #:dividend #:quotient #:remainder
   #:comparison-mixin #:comparand #:comparator
   #:signed-less-instruction
   #:signed-not-greater-instruction
   #:unsigned-less-instruction
   #:unsigned-not-greater-instruction
   #:equal-instruction
   #:binary-bitwise-instruction
   #:bitwise-and-instruction
   #:bitwise-or-instruction
   #:bitwise-exclusive-or-instruction
   #:bitwise-not-instruction
   #:memory-read-instruction #:base-address #:offset #:datum
   #:memory-write-instruction))
