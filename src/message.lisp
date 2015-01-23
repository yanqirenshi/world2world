(in-package :world2world)

;;; <now>
;;; {:code
;;;        {:lang string}}
;;;
;;;
;;;
;;; <goal>
;;; {:code
;;;        {:lang ;; define class ?
;;;               {:code        symbol
;;;                :language    symbol
;;;                :controler   string or function
;;;		   :description string}}}
(defconstant *message* (make-hash-table)) 


(defun get-messages (code) 
  (asserts code)
  (gethash code *message*))


(defun get-message (code lang)
  (asserts code lang)
  (let ((messages (get-messages code)))
    (when messages 
      (gethash lang messages))))  


(defun add-message (code lang control-string)
  (cond ((null (languagep lang)) (error "Illegal language. lang=~a" lang))
	((not  (keywordp code))  (error "Code is not keyword. code=~a" lang))
	((null (gethash code *message*))
	 (setf (gethash code *message*) (make-hash-table))))
  (let ((messages (get-messages code)))
    (setf (gethash lang messages) control-string)))


(defgeneric get-control-string (message lang-or-wold)
  (:documentation "あれ？ これ get-message じゃない？")
  (:method ((message keyword) (world world))
    (get-control-string message (language world)))
  (:method ((message keyword) (lang keyword))
    (let ((ht (gethash message *message*)))
      (when ht (gethash lang ht)))))
