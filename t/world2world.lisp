(in-package :cl-user)
(defpackage world2world-test
  (:use :cl
        :world2world
        :prove))
(in-package :world2world-test)


(plan nil)


(plan 3)

(ok (not (find 4 '(1 2 3))))
(is 4 4)
(isnt 1 #\1)


(finalize)
