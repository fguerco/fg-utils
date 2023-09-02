(in-package :fg-utils)

(defmacro doseq ((var start end &optional (step 1)) &body forms)
  "Execute FORMS inside a sequence from START to END by STEP
Examples:
  (doseq (x 1 10) (princ x)) => 12345678910
  (doseq (x 10 1 -1) (princ x)) => 10987654321
  (doseq (x 1 10 4) (princ x)) => 159
  (doseq (x 10 1 -4) (princ x)) => 1062"
  (with-gensyms (startvar endvar stepvar)
    `(loop
       with ,startvar = ,start and ,endvar = ,end and ,stepvar = ,step
       for ,var = ,startvar then (+ ,var ,stepvar)
       until (funcall (if (plusp ,stepvar) #'> #'<) ,var ,endvar)
       do ,@forms)))

(defun seq (start end &optional (step 1))
  "Returns a sequence with a range from start to end. Use a negative step
to generate a sequence backwards"
  (let (result)
    (doseq (x start end step) (push x result))
    (nreverse result)))

(defun mapseq (fn start end &optional (step 1))
  "Returns a list of applying FN to successive elements in the
sequence defined"
  (let (list)
    (doseq (x start end step)
      (push (funcall fn x) list))
    (nreverse list)))
