(in-package :fg-utils/test)

(define-test doseq
  (is = 10
      (let ((s 0))
        (doseq (x 1 4) (incf s x))
        s))

  (is equal "4321"
      (with-output-to-string (s)
        (doseq (x 4 1)
          (princ x s))))

  (is equal "1357911"
      (with-output-to-string (s)
        (doseq (x 1 11 2)
          (princ x s))))

  (is equal "159"
      (with-output-to-string (s)
        (doseq (x 1 10 4)
          (princ x s))))

  (is equal "1062"
      (with-output-to-string (s)
        (doseq (x 10 1 4)
          (princ x s)))))

(define-test seq
  (is equal '(1 2 3 4 5) (seq 1 5))
  (is equal '(1 3 5 7 9) (seq 1 10 2))
  (is equal '(1 1.5 2.0 2.5 3.0) (seq 1 3 0.5))
  (is equal '(3 2 1 0 -1 -2 -3) (seq 3 -3))
  (is equal '(30 20 10 0) (seq 30 0 10)))

(define-test mapseq
  (is equal '(2 4 6 8 10) (mapseq (lambda (x) (* x 2)) 1 5))
  (is equal '(1/2 1/5 1/8) (mapseq #'/ 2 10 3))
  (is equal '(-10 -5 0) (mapseq #'- 10 0 5)))

(define-test mapseqn
  (is equal '(1 2 3 4 5 6 7 8 9 10) (mapseqn #'list 1 10))
  (is equal '(1 3 5 7 9) (mapseqn (lambda (x)
                                    (if (oddp x) (list x)))
                                  1 10)))
  
