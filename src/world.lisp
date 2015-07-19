(in-package :world2world)

(defun make-world (language &key (description ""))
  (unless (keywordp language) (error "Code is not keyword. lang=~a" language))
  (make-instance 'world :language language
                        :description description))
