(in-package :world2world)


(defvar *default-world* (make-instance 'world :language :ja))


(defgeneric communication (message to-you &rest values)
  (:documentation "")
  (:method ((message symbol) (to-you world) &rest values)
    (let ((control-string (get-control-string message to-you)))
      (if values
          (apply #'format (append `(t ,control-string) values))
          control-string))))


(defmacro c* (message &rest values)
  `(communication ,message *default-world* ,@values))


(defmacro error* (message &rest values)
  `(error (get-control-string ,message *default-world*) ,@values))


(defmacro format* (stream message &rest values)
  `(format ,stream (get-control-string ,message *default-world*) ,@values))


;; (defmacro print* (message to-you &rest values)
;;  `(communication ,message ,to-you ,@values))







