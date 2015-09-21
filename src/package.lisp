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
           #:world-at
           #:add-expression
           #:get-expression
           #:add-messages
           #:communication
           #:c*
           #:error*
           #:format*
           ;; printer
           #:print-packages
           #:print-package))
(in-package :world2world)


;;;
;;; utility
;;;
(defun asserts (&rest symbols)
  (mapcar #'(lambda (symbol)
              (assert symbol))
          symbols))
