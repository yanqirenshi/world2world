(in-package :world2world)


(defgeneric communication (message to-you &rest values) 
  (:documentation "")
  (:method ((message keyword) (to-you world) &rest values)
    (let ((control-string (get-control-string message to-you)))
      (if values
	  (apply #'format (append `(t ,control-string) values))
	  control-string))))


(defmacro c* (message to-you &rest values) 
  `(communication ,message ,to-you ,@values))


(defmacro error* (message to-you &rest values) 
  `(error (c* ,message ,to-you) ,@values))


(defmacro format* (message to-you &rest values) 
  `(communication ,message ,to-you ,@values))


(defmacro print* (message to-you &rest values) 
  `(communication ,message ,to-you ,@values))



;; ex)
;; (let ((user (make-instance 'world :language :ja)))
;;   (add-message :msg1 :ja "~a, ~a")
;;   (c* :msg1 user 1 2))




