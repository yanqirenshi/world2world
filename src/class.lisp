(in-package :world2world)

(defclass world ()
  ((language :documentation ""
             :accessor language
             :initarg :language
             :initform :hiroshima)
   (description :documentation ""
                :accessor description
                :initarg :description
                :initform :hiroshima)))

(defclass message ()
  ((code :documentation ""
         :accessor code
         :initarg :code
         :initform :hiroshima)
   (language :documentation ""
             :accessor language
             :initarg :language
             :initform :hiroshima)
   (controler :documentation ""
              :accessor controler
              :initarg :controler
              :initform :hiroshima)
   (description :documentation ""
                :accessor description
                :initarg :description
                :initform :hiroshima)))

