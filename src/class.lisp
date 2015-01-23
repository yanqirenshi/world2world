(in-package :world2world)


(defclass world () 
  ((language :documentation ""
	     :accessor language
	     :initarg :language
	     :initform *default-language*)))


(defclass message ()
  ((code        :accessor code)
   (expresses   :accessor expresses)
   (description :accessor description)))


(defclass express ()
   ((language    :accessor language)
    (contents    :accessor contents)
    (description :accessor description)))
