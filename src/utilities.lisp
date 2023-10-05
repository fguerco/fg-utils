(in-package :fg-utils)

(defun singlep (list)
  (and (consp list)
       (listp (car list))
       (not (cdr list))))

(defun pop-single (list)
  (if (singlep list)
      (pop-single (car list))
      list))

(defmacro force-list (place)
  `(unless (listp ,place)
     (setf ,place (list ,place))))

(defun join-to-string (&rest args)
  (format nil "~{~a~}" args))

(defun join-to-symbol (&rest args)
  (->> args
    (apply #'join-to-string)
    intern))

(defmacro until (condition &body forms)
  `(do () (,condition)
     ,@forms))

(defmacro while (condition &body forms)
  `(until (not ,condition)
     ,@forms))

(defmacro nlet (name bindings &body body)
  (let ((argn (mapcar #'car bindings))
        (argv (mapcar #'cadr bindings)))
    `(labels ((,name ,argn ,@body))
       (,name ,@argv))))

(defalias letrec nlet)

(defun partial (fn &rest initial-args)
  (lambda (&rest args)
    (apply fn (append initial-args args))))
