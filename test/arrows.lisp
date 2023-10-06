(in-package :fg-utils/test)

(define-test ->
  (is = 3 (-> 1 1+ 1+))
  (is = 1/4 (-> 2 (* 2) /))
  (is = 3 (-> '(1 2 3) (elt 2)))
  (is equal
      '(1 2 3 4)
      (-> (list 1 4 2 3) (sort #'<)))
  (is string= "abcDEF" (-> "abcdef"
                     (string-upcase :start 3))))

(define-test ->>
  (is equal '(1/2 1/3 1/4)
      (->> '(1 2 3)
        (mapcar #'1+)
        (mapcar #'/)))
  (is = 10
      (->> '(0 1 2 3)
        (mapcar #'1+)
        (reduce #'+))))

(define-test as->
  (is = 6 (as-> (x 1) (+ 2 x 3)))
  (is = 1/20 (as-> (x 10) (* 2 x) (/ x)))
  (is equal '(5 3 1)
      (as-> ($ "12345")
        (map 'list #'digit-char-p $)
        (filter #'oddp $)
        (sort $ #'>))))
  
  
