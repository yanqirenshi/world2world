#|
  This file is a part of world2world project.
  Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)
|#

(in-package :cl-user)
(defpackage world2world-test-asd
  (:use :cl :asdf))
(in-package :world2world-test-asd)

(defsystem world2world-test
  :author "Satoshi Iwasaki"
  :license "LLGPL"
  :depends-on (:world2world
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "world2world"))))

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
