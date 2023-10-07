(in-package :fg-utils/test)

(define-test doalist
  (is equal "A=1,B=2,C=3,"
      (with-output-to-string (s)
        (doalist (k v '((a . 1) (b . 2) (c . 3)))
          (format s "~a=~a," k v)))))

(define-test mapalist
  (is equal '("A=1" "B=2" "C=3")
      (mapalist (lambda (k v)
                  (format nil "~a=~a" k v))
                '((a . 1) (b . 2) (c . 3)))))

(define-test mapalistn
  (is equal '("B=2")
      (mapalistn (lambda (k v)
                  (when (evenp v)
                    (list (format nil "~a=~a" k v))))
                 '((a . 1) (b . 2) (c . 3)))))

(define-test doplist
  (is equal "A=1,B=2,C=3,"
      (with-output-to-string (s)
        (doplist (k v '(:a 1 :b 2 :c 3))
          (format s "~a=~a," k v)))))

(define-test mapplist
  (is equal '("A=1" "B=2" "C=3")
      (mapplist (lambda (k v) (format nil "~a=~a" k v))
                '(:a 1 :b 2 :c 3))))

(define-test mapplistn
  (is equal '("B=2")
      (mapplistn (lambda (k v)
                  (when (evenp v)
                    (list (format nil "~a=~a" k v))))
                 '(:a 1 :b 2 :c 3))))
