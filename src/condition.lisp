(in-package :world2world)

(define-condition message-not-found-error (error)
  ((code :initarg :code
         :reader code))
  (:report (lambda (condition stream)
             (format stream "Message not found. code=~a"
                     (code condition)))))

(defun message-not-found-error (code)
  (error 'message-not-found-error :code code))

(define-condition expression-not-found-error (error)
  ((message-code :initarg :message-code
                 :reader message-code))
  (:report (lambda (condition stream)
             (format stream "Expression not found. message-code=~a"
                     (message-code condition)))))

(defun expression-not-found-error (message-code)
  (error 'expression-not-found-error :message-code message-code))
