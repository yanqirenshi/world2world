(in-package :cl-user)
(defpackage world2world
  (:use :cl)
  (:nicknames :w2w)
  (:export #:world
           #:default-world
           ;; class
           #:message
           #:world
           #:expression
           ;; class slot
           #:code
           #:default
           #:description
           #:controller
           ;; w2w
           #:world-atq
           #:add-expression
           #:get-expression
           #:communication
           #:c*
           #:error*
           #:format*))
(in-package :world2world)


;;;
;;; utility
;;;
(defun asserts (&rest symbols)
  (mapcar #'(lambda (symbol)
              (assert symbol))
          symbols))
