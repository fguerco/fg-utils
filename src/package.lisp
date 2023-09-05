(defpackage :fg-utils
  (:nicknames :fg)
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
           #:collect
           #:while
           #:until
           #:doalist
           #:mapalist
           #:mapalistn
           #:mapplist
           #:mapplistn
           #:->
           #:->>
           #:as->))
