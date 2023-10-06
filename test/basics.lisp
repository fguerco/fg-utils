(in-package :fg-utils/test)

(define-test singlep
  (false (singlep 10))
  (false (singlep '(10)))
  (false (singlep '(10 20)))
  (false (singlep '((10) (20))))
  (true (singlep '((10)))))

(define-test pop-single
  (is = 1 (pop-single 1))
  (is equal '(1) (pop-single '(1)))
  (is equal '(1) (pop-single '((1))))
  (is equal '(1) (pop-single '(((1))))))


(define-test force-list
  (macrolet ((test (in expected)
               `(let ((subject ,in))
                  (force-list subject)
                  (is equal ,expected subject))))

    (test 1 '(1))
    (test '(1) '(1))
    (test nil nil)))

(define-test nlet
  (let ((x (nlet fn ((n 3))
             (if (= n 1) 1
                 (+ n (fn (1- n)))))))
    (is = 6 x)))
