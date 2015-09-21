(in-package :world2world)

(defun add-expression (message-code world-code controller &key (description "") (package *package*))
  (setf (get-expression* package message-code (world-at world-code))
        (make-instance 'expression
                       :controller controller
                       :description description)))

(defun get-expression (message-code &key (world (default-world)) (package *package*))
  (get-expression* package message-code world))

(defun add-messages (message-list)
  (let* ((message (car message-list)))
    (when message
      (dolist (expression (getf message :values))
        (add-expression (getf message :code)
                        (or (getf expression :world)
                            (getf expression :language))
                        (getf expression :controller)
                        :description (getf expression :description)))
      (add-messages (cdr message-list)))))


;;;;;
;;;;; Communication
;;;;;
(defgeneric communication (message to-you &rest values)
  (:documentation "")
  (:method ((message-code symbol) (to-you symbol) &rest values)
    (apply #'communication
           message-code (world-at to-you)
           values))
  (:method ((message-code symbol) (to-you world) &rest values)
    (let ((expression (expression *package* message-code to-you)))
      (if values
          (apply #'format t (controller expression) values)
          (controller expression)))))


(defmacro c* (message-code &rest values)
  (assert *world*)
  `(communication ,message-code *world* ,@values))


(defun format* (stream message-code &rest values)
  (assert *world*)
  (let ((expression (get-expression message-code :package *package* :world *world*)))
    (assert expression)
    (apply #'format stream (controller expression) values)))


(defun error* (message-code &rest values)
  (assert *world*)
  (let ((expression (get-expression message-code :package *package* :world *world*)))
    (assert expression)
    (apply #'error (controller expression) values)))
