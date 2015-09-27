(in-package :world2world)

(defvar *printer-title-package* "Package")
(defvar *printer-title-count* "Count")

(defun get-package-list (&key (messages *message*))
  (hash-table-keys messages))

(defun get-package-name-list (&key (messages *message*))
  (mapcar #'package-name
          (get-package-list :messages messages)))

(defun get-max-length-of-package-name (&key (messages *message*))
  (let ((list (sort (mapcar #'length
                            (get-package-name-list :messages messages))
                    #'>)))
    (if list
        (first list)
        (length *printer-title-package*))))

(defun print-packages (&key (messages *message*) (stream t))
  (let* ((len (get-max-length-of-package-name :messages messages))
         (fmt (concatenate 'string "| ~" (if len (princ-to-string len) "") "a | ~a ~%")))
    (format stream fmt *printer-title-package* *printer-title-count*)
    (format stream fmt (make-string len :initial-element #\=) (make-string 10 :initial-element #\=))
    (maphash #'(lambda (k v)
                 (format stream fmt (package-name k) (hash-table-count v)))
             messages)))

(defun print-package (&key (package *package*) (messages *message*) (stream t))
  (maphash #'(lambda (k v)
               (format stream "| ~a | ~a | ~a ~%"
                       k
                       (code (primary-world v))
                       (mapcar #'(lambda (world) (code world))
                               (hash-table-keys (worlds v)))))
           (get-package-ht package :messages messages)))

;;;
;;; print-message
;;;
(defun get-max-length-of-key (ht &optional (to-string-func-list '(symbol-name code)))
  (if (null ht)
      0
      (first (sort
              (mapcar (apply #'compose #'length to-string-func-list)
                      (hash-table-keys ht))
              #'>))))

(defun print-message-expression-list (worlds &key (stream t))
  (let* ((len (get-max-length-of-key worlds))
         (fmt (concatenate 'string "| ~" (princ-to-string (+ 1 len)) "S | ~S ~%")))
    (maphash #'(lambda (k v) (format stream fmt (code k) (controller v)))
             worlds)))

(defun print-message (code &key (package *package*) (messages *message*) (stream t))
  (let ((message (get-message* package code :messages messages)))
    (unless message (error "Not found message. message=~a, package=~a, code=~a" package message code))
    (format stream "Objext = ~a~2%" message)
    (dolist (item '(code primary-world worlds))
      (format stream "| ~13a | ~a~%" item (funcall item message)))
    (format stream "~%<<expressions>~%" message)
    (print-message-expression-list (worlds message) :stream stream)))


;;;
;;; print-message
;;;
(defun print-expression (code world &key (package *package*) (messages *message*) (stream t))
  (values code world package messages stream))

