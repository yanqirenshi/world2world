(in-package :world2world)

;;;;;
;;;;; Message
;;;;;
(defvar *message* (make-hash-table))

(defun get-package-ht (package &key (messages *message*))
  (let ((ht (gethash package messages)))
    (or ht
        (setf (gethash package *message*)
              (make-hash-table)))))

(defun get-message* (package code)
  (let ((message (gethash code (get-package-ht package))))
    message))

(defun (setf get-message*) (message package code)
  (setf (gethash code (get-package-ht package))
        (if (eq (code message) code)
            message
            (error "ちがうもん入れたらイケんけぇ。"))))

