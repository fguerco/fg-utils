(in-package :fg-utils)

(defmacro define-arrow-function (name arg1 expr)
  `(defmacro ,name (,arg1 &body forms)
     (reduce (lambda (prev it)
               (force-list it)
               ,expr)
             forms :initial-value value)))

(define-arrow-function -> value (list* (car it) prev (cdr it)))
(define-arrow-function ->> value `(,@it ,prev))
(define-arrow-function as-> (var value) (subst prev var it))
