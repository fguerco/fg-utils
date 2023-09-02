(in-package :fg-utils)

(defmacro defalias (alias function)
  `(setf (symbol-function ',alias) #',function))

(defalias filter remove-if-not)
(defalias select remove-if-not)
(defalias reject remove-if)
(defalias fold reduce)
