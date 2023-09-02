(in-package :fg-utils)

(defmacro %arrow-lambda ((prev it) &body forms)
  `(lambda (,prev ,it)
     (let ((,it (ensure-list ,it)))
       ,@forms)))

(defmacro -> (value &body forms)
  (reduce (%arrow-lambda (prev it)
            `(,(car it) ,prev ,@(cdr it)))
          forms :initial-value value))
            
(defmacro ->> (value &body forms)
  (reduce (%arrow-lambda (prev it)
            `(,@it ,prev))
          forms :initial-value value))

(defmacro as-> ((var value) &body forms)
  (reduce (lambda (prev it)
            (subst prev var it))
          forms :initial-value value))
