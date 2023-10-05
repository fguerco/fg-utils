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

(defmacro nlet (name bindings &body body)
  (let ((argn (mapcar #'car bindings))
        (argv (mapcar #'cadr bindings)))
    `(labels ((,name ,argn ,@body))
       (,name ,@argv))))

(defalias letrec nlet)
