(in-package :fg-utils)

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

(defun partial (fn &rest initial-args)
  (lambda (&rest args)
    (apply fn (append initial-args args))))
