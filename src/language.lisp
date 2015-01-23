(in-package :world2world)


(defconstant *language* (make-hash-table)) 


(defun add-language (code &optional description)
  (setf (gethash code *language*) `(:code ,code :description ,description)))


(defun get-language (code)
  (gethash code *language*))


(defun languagep (code)
  (not (null (gethash code *language*))))


(defun refresh-language (&optional (data *lang-data*))
  (maphash #'(lambda (k v) (add-language k v))
	   (alexandria:plist-hash-table data)))
