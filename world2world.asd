#|
  This file is a part of world2world project.
  Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)
|#

#|
  Author: Satoshi Iwasaki (yanqirenshi@gmail.com)
|#

(in-package :cl-user)
(defpackage world2world-asd
  (:use :cl :asdf))
(in-package :world2world-asd)

(defsystem world2world
  :version "0.1"
  :author "Satoshi Iwasaki"
  :license "LLGPL"
  :depends-on (:alexandria
               :log4cl)
  :components ((:module "src"
                :components
                ((:file "world2world"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op world2world-test))))
