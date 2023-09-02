(in-package :fg-utils)

(defun join-to-string (&rest args)
  (format nil "~{~a~}" args))

(defun join-to-symbol (&rest args)
  (->> args
    (apply #'join-to-string)
    intern))

(defmacro with-list-collection (var &body forms)
  "An anaphoric macro that binds a list with the name from VAR and
a function named COLLECT in the lexical scope to add items in order.
Example:
  (with-list-collection myvar
    (collect 1)
    (collect 2))

Returns the variable VAR"
  (let ((tail (gensym)))
    `(let (,var ,tail)
       (flet ((collect (item)
                (let ((item (list item)))
                  (if ,var
                      (rplacd ,tail (setq ,tail item))
                      (setq ,var (setq ,tail item))))))
         ,@forms
         ,var))))

(defmacro until (condition &body forms)
  `(do () (,condition)
     ,@forms))

(defmacro while (condition &body forms)
  `(until (not ,condition)
     ,@forms))

(defmacro defcurryfun (name args &body body)
  (declare (ignore name))
  (with-gensyms (curryfn partial given)
    (let ((argslen (length args)))
      `(let (,given)
         (labels ((,curryfn ,args ,@body)
                  (,partial (&rest args)
                    (setq ,given (append ,given args))
                    (if (< (length ,given) ,argslen)
                        (lambda (&rest args)
                          (apply #',partial args))
                        (apply #',curryfn ,given))))
           (lambda (&rest args) (apply #',partial args)))))))
