(defpackage :fg-utils
  (:use :cl :alexandria)
  (:export #:filter
           #:select
           #:reject
           #:seq
           #:doseq
           #:mapseq
           #:join-to-string
           #:join-to-symbol
           #:with-list-collection
           #:while
           #:until
           #:->
           #:->>
           #:as->))
