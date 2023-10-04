(in-package :fg-utils)

(defmacro defalias (alias source)
  (symbol-macrolet ((definition (if (macro-function source)
                                    'macro-function
                                    'symbol-function)))
    `(setf (,definition ',alias) (,definition ',source))))

(defalias filter remove-if-not)
(defalias select remove-if-not)
(defalias reject remove-if)
(defalias fold reduce)
