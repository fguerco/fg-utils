(in-package :fg-utils)

(defmacro %loop-alist ((k v alist) op &body forms)
  `(loop for (,k . ,v) in ,alist
         ,op ,@forms))

(defmacro doalist ((k v alist) &body forms)
  `(%loop-alist (,k ,v ,alist) do ,@forms))

(defun mapalist (fn alist)
  (%loop-alist (k v alist) collect (funcall fn k v)))

(defun mapalistn (fn alist)
  (%loop-alist (k v alist) nconc (funcall fn k v)))


(defmacro %loop-plist ((k v plist) op &body forms)
  `(loop for (,k ,v) on ,plist by #'cddr
         ,op ,@forms))

(defun mapplist (fn plist)
  (%loop-plist (k v plist) collect (funcall fn k v)))

(defun mapplistn (fn plist)
  (%loop-plist (k v plist) nconc (funcall fn k v)))

