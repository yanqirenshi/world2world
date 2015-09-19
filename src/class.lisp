(in-package :world2world)

(defclass message ()
  ((code :documentation ""
         :accessor code
         :initarg :code
         :initform nil)
   (primary-world :documentation ""
                  :accessor primary-world
                  :initarg :primary-world
                  :initform nil)
   (worlds :documentation ""
           :accessor worlds
           :initarg :worlds
           :initform (make-hash-table)))
  (:documentation ""))

(defclass world ()
  ((code :documentation ""
         :accessor code
         :initarg :code
         :initform nil)
   (description :documentation ""
                :accessor description
                :initarg :description
                :initform ""))
  (:documentation ""))


(defclass expression ()
  ((controller :documentation ""
               :accessor controller
               :initarg :controller
               :initform nil)
   (description :documentation ""
                :accessor description
                :initarg :description
                :initform ""))
  (:documentation ""))
