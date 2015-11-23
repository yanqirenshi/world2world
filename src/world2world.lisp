#|

*messages* を利用することを前提としたオペレータ郡です。

通常はこれを利用してください。

カスタマイズしたい場合はこれと同じような関数を時前のアプリに実装してください。

|#
(in-package :world2world)

;;;;;
;;;;; Add Message/Expression
;;;;;
(defun add-expression (message-code world-code controller &key (description "") (package *package*))
  (setf (get-expression* package message-code (world-at world-code))
        (make-instance 'expression
                       :controller controller
                       :description description)))

(defun get-expression (message-code &key (world (default-world)) (package *package*))
  (get-expression* package message-code world))

(defun add-message-validation-core (message)
  (let ((code (find :code message))
        (code-contents (getf message :code))
        (values (find :values message))
        (values-contents (getf message :values)))
    (cond ((null message)  "Message is empty.")
          ;; code
          ((null code) "Not found :code in message.")
          ((null code-contents) ":code contents is nil.")
          ((not (keywordp code-contents)) ":code contents is not keyword.")
          ;; values
          ((null values) "Not found :values in message.")
          ((null values-contents) ":values contents is nil.")
          ((not (listp values-contents)) ":code contents is not keyword.")
          ;; ok
          (t nil))))

(defun add-message-validation (message)
  (let ((msg (add-message-validation-core message)))
    (when msg (warn "Skip message. ~a message=~S" msg message))
    (not msg)))

(defun add-messages-core (package message-list)
  (let* ((message (car message-list)))
    (when (add-message-validation message)
      (dolist (expression (getf message :values))
        (add-expression (getf message :code)
                        (or (getf expression :world)
                            (getf expression :language))
                        (getf expression :controller)
                        :description (getf expression :description)
                        :package package))
      (add-messages-core package (cdr message-list)))))

(defun add-messages (message-list &key (with-package nil))
  (if with-package
      (dolist (item message-list)
        (when (getf item :pacakge)
          (let ((pakage (find-package (getf item :pacakge))))
            (assert pakage)
            (add-messages-core pakage (getf item :values)))))
      (add-messages-core *package* message-list)))



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
    (unless expression (expression-not-found-error message-code))
    (apply #'format stream (controller expression) values)))


(defun error* (message-code &rest values)
  (assert *world*)
  (let ((expression (get-expression message-code :package *package* :world *world*)))
    (unless expression (expression-not-found-error message-code))
    (apply #'error (controller expression) values)))
