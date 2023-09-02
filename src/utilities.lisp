(in-package :fg-utils)

(defun join-to-string (&rest args)
  (with-output-to-string (out)
    (dolist (x args) (princ x out))))

(defun join-to-symbol (&rest args)
  (->> args
    (apply #'join-to-string)
    intern))

(defmacro with-list-collection (var &body forms)
  "Creates a list and a function in the lexical scope to push items in order.
The function name is composed of the symbol provided in VAR plus \"-PUSH\"
Example:
  (with-list-collection myvar
    (myvar-push 1)
    (myvar-push 2))"
  (let ((tail (gensym))
        (var-push (join-to-symbol var "-PUSH")))
    `(let (,var ,tail)
       (flet ((,var-push (x)
                (let ((x (list x)))
                  (if ,var
                      (rplacd ,tail x)
                      (setf ,var x))
                  (setf ,tail x))))
         ,@forms))))

(defmacro until (condition &body forms)
  `(do () (,condition)
     ,@forms))

(defmacro while (condition &body forms)
  `(until (not ,condition)
     ,@forms))
