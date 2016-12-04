(in-package :cl-user)
(defpackage world2world
  (:use :cl)
  (:nicknames :w2w)
  (:import-from :alexandria
                #:hash-table-keys
                #:compose)
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
           #:%format*
           #:format*
           ;; printer
           #:print-packages
           #:print-package
           #:print-message
           #:print-expression))
(in-package :world2world)


;;;
;;; utility
;;;
(defun asserts (&rest symbols)
  (mapcar #'(lambda (symbol)
              (assert symbol))
          symbols))
