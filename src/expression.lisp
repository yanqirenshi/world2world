(in-package :world2world)

;;;;;
;;;;; Expression
;;;;;
(defun get-expression* (package message-code world)
  (let ((message (get-message* package message-code)))
    (assert message)
    (or (gethash world (worlds message))
        (gethash (primary-world message) (worlds message)))))

(defun ensure-message (package message-code world)
  (let ((message (get-message* package message-code)))
    (or message
        (setf (get-message* package message-code)
              (make-instance 'message
                             :code message-code
                             :primary-world world)))))

(defun (setf get-expression*) (expression package message-code world)
  (let ((message (ensure-message package message-code world)))
    (setf (gethash world (worlds message))
          expression)))
