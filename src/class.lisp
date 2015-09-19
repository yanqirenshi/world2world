(in-package :world2world)

(defclass message ()
  ((code :documentation ""
         :accessor code
         :initarg :code
         :initform nil)
   (default :documentation ""
            :accessor default
            :initarg :default
            :initform nil)
   (worlds :documentation ""
           :accessor worlds
           :initarg :worlds
           :initform (make-hash-table))))


(defclass world ()
  ((code :documentation ""
         :accessor code
         :initarg :code
         :initform nil)
   (description :documentation ""
                :accessor description
                :initarg :description
                :initform "")))


(defclass expression ()
  ((controller :documentation ""
               :accessor controller
               :initarg :controller
               :initform nil)
   (description :documentation ""
                :accessor description
                :initarg :description
                :initform "")))
