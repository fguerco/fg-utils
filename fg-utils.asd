(defsystem :fg-utils
  :name "Some utilities for my day-to-day programming"
  :version "1.0.0"
  :author "Felipe Guerço Oliveira <felipeguerco@gmail.com>"
  :license "MIT"
  :depends-on (:alexandria)
  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "aliases")
                             (:file "arrows")
                             (:file "sequences")
                             (:file "utilities"))))

  :in-order-to ((test-op (test-op :fg-utils/test))))

(defsystem :fg-utils/test
  :depends-on (:fg-utils :parachute)
  :components ((:module "test"
                :serial t))
  :perform (test-op (op c)
                    (symbol-call :parachute :test :utilities-test)))
