(in-package :fg-utils)

(defmacro %lambda (args &body body)
  `(lambda ,(if args `(&optional ,@args))
     ,(if (null args) '(declare) `(declare (ignorable ,@args)))
     ,@body))

(defun enable-short-lambda ()
  (labels ((symb (n)
             (join-to-symbol "$" n))
           (hash-brackets (st ch arg)
             (declare (ignore ch))
             (let ((body (read-delimited-list #\] st))
                   (args (if arg (mapseq #'symb 1 arg))))
               `(%lambda ,args ,@body))))
    (set-dispatch-macro-character #\# #\[ #'hash-brackets)
    (set-macro-character #\] (get-macro-character #\)))))

(defun disable-short-lambda ()
  (set-dispatch-macro-character #\# #\[ nil)
  (set-macro-character #\] nil))

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
                      (setf (cdr ,tail) (setq ,tail item))
                      (setq ,var (setq ,tail item))))))
         ,@forms
         ,var))))
