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
                             (:file "basics")
                             (:file "arrows")
                             (:file "alist-plist")
                             (:file "sequences")
                             (:file "utilities")
                             (:file "anaphoric"))))

  :in-order-to ((test-op (test-op :fg-utils/test))))

(defsystem :fg-utils/test
  :depends-on (:fg-utils :parachute)
  :components ((:module "test"
                :components ((:file "package")
                             (:file "basics")
                             (:file "arrows")
                             (:file "sequences")
                             (:file "alist-plist"))))
  :perform (test-op (op c)
                    (symbol-call :parachute :test :fg/test)))
