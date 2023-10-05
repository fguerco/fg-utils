(in-package :fg-utils)

(defmacro %loopseq-gen (var start end step op &rest forms)
  (with-gensyms (startvar endvar stepvar compfn)
    `(let ((,startvar ,start)
           (,endvar ,end)
           (,stepvar (abs ,step))
           (,compfn #'<=))
       (when (> ,startvar ,endvar)
         (setf ,stepvar (- ,stepvar)
               ,compfn #'>=))
       (loop
         for ,var = ,startvar then (+ ,var ,stepvar)
         while (funcall ,compfn ,var ,endvar)
         ,op ,@forms))))

(defmacro doseq ((var start end &optional (step 1)) &body forms)
  "Execute FORMS inside a sequence from START to END by STEP
Examples:
  (doseq (x 1 10) (princ x)) => 12345678910
  (doseq (x 10 1 1) (princ x)) => 10987654321
  (doseq (x 1 10 4) (princ x)) => 159
  (doseq (x 10 1 4) (princ x)) => 1062"
  `(%loopseq-gen ,var ,start ,end ,step do ,@forms))

(defun seq (start end &optional (step 1))
  "Returns a sequence with a range from start to end. Use a negative step
to generate a sequence backwards"
  (%loopseq-gen x start end step collect x))

(defun mapseq (fn start end &optional (step 1))
  "Returns a list of applying FN to successive elements in the
sequence defined"
  (%loopseq-gen x start end step collect (funcall fn x)))

(defun mapseqn (fn start end &optional (step 1))
  "Returns a concatenated list of applying FN to successive elements in the
sequence defined, like mapcan"
  (%loopseq-gen x start end step nconc (funcall fn x)))
