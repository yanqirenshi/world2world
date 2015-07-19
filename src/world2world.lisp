(in-package :world2world)

(defgeneric communication (message to-you &rest values)
  (:documentation "")
  (:method ((message-code symbol) (to-you world) &rest values)
    (let ((control-string (get-message message-code to-you)))
      (if values
          (apply #'format (append `(t ,control-string) values))
          control-string))))

(defmacro c* (message-code &rest values)
  `(communication ,message-code *world* ,@values))


(defmacro error* (message-code &rest values)
  `(error (get-message ,message-code *world*) ,@values))


(defmacro format* (stream message-code &rest values)
  `(format ,stream (get-message ,message-code *world*) ,@values))
