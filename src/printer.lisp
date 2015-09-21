(in-package :world2world)

(defun get-package-list (&key (messages *message*))
  (alexandria:hash-table-keys messages))

(defun get-package-name-list (&key (messages *message*))
  (mapcar #'package-name
          (get-package-list :messages messages)))

(defun get-max-length-of-package-name (&key (messages *message*))
  (first (sort (mapcar #'length
                       (get-package-name-list :messages messages))
               #'>)))

(defun print-packages (&key (messages *message*) (stream t))
  (let* ((len (get-max-length-of-package-name :messages messages))
         (fmt (concatenate 'string "| ~" (if len (princ-to-string len) "") "a | ~a ~%")))
    (format stream fmt "package" "count")
    (format stream fmt (make-string len :initial-element #\=) (make-string 10 :initial-element #\=))
    (maphash #'(lambda (k v)
                 (format stream fmt (package-name k) (hash-table-count v)))
             messages)))

(defun print-package (&key (package *package*)(messages *message*) (stream t))
  (maphash #'(lambda (k v)
               (format stream "| ~a | ~a | ~a ~%"
                       k
                       (code (primary-world v))
                       (mapcar #'(lambda (world) (code world))
                               (alexandria:hash-table-keys (worlds v)))))
           (get-package-ht package :messages messages)))
