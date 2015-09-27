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

(defun get-message* (package code &key (messages *message*))
  (gethash code (get-package-ht package :messages messages)))

(defun (setf get-message*) (message package code &key (messages *message*))
  (setf (gethash code (get-package-ht package :messages messages))
        (if (eq (code message) code)
            message
            (error "ちがうもん入れたらイケんけぇ。"))))
