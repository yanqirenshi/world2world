(in-package :world2world)

;;;;;
;;;;; Expression
;;;;;
(defun get-expression* (package message-code world)
  (let ((msg (get-message* package message-code)))
    (if msg
        (gethash world (worlds msg))
        ;; TODO: use message's default
        nil)))

(defun ensure-message (package message-code world)
  (let ((message (get-message* package message-code)))
    (or message
        (setf (get-message* package message-code)
              (make-instance 'message
                             :code message-code
                             :default world)))))

(defun (setf get-expression*) (expression package message-code world)
  (setf (gethash world (worlds (ensure-message package message-code world)))
        expression))
