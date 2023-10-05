(defpackage :fg-utils
  (:nicknames :fg)
  (:use :cl)
  (:import-from :alexandria #:with-gensyms #:ensure-list)
  (:export #:letrec
           #:nlet
           #:partial
           #:filter
           #:select
           #:reject
           #:force-list
           #:seq
           #:doseq
           #:mapseq
           #:mapseqn
           #:singlep
           #:pop-single
           #:join-to-string
           #:join-to-symbol
           #:with-list-collection
           #:enable-short-lambda
           #:disable-short-lambda
           #:collect
           #:while
           #:until
           #:doalist
           #:mapalist
           #:mapalistn
           #:doplist
           #:mapplist
           #:mapplistn
           #:defcurryfun
           #:->
           #:->>
           #:as->))
