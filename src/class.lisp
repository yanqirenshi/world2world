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
   (controller :documentation ""
               :accessor controller
               :initarg :controller
               :initform :hiroshima)
   (description :documentation ""
                :accessor description
                :initarg :description
                :initform :hiroshima)))

