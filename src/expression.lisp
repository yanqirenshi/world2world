(in-package :world2world)

;;;;;
;;;;; Expression
;;;;;
(defun get-expression* (package message-code world &key (messages *message*))
  (let ((message (get-message* package message-code :messages messages)))
    (assert message)
    (or (gethash world (worlds message))
        (gethash (primary-world message) (worlds message)))))

(defun ensure-message (package message-code world &key (messages *message*))
  (let ((message (get-message* package message-code :messages messages)))
    (or message
        (setf (get-message* package message-code :messages messages)
              (make-instance 'message
                             :code message-code
                             :primary-world world)))))

(defun (setf get-expression*) (expression package message-code world &key (messages *message*))
  (let ((message (ensure-message package message-code world :messages messages)))
    (setf (gethash world (worlds message))
          expression)))
