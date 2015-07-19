(in-package :world2world)

(defun get-messages (code)
  (asserts code)
  (gethash code *message*))

(defun get-message (code world)
  (asserts code world)
  (let ((messages (get-messages code))
        (lang (language world)))
    (when messages
      (gethash lang messages))))

(defun make-message (code language controler &key (description ""))
  (cond ((null (keywordp language)) (error "Code is not keyword. lang=~a" language))
        ((not  (keywordp code)) (error "Code is not keyword. code=~a" code)))
  (make-instance 'message
                 :code code
                 :language language
                 :controler controler
                 :description description))

(defun duplicatep (duplicate)
  (member duplicate '(:ignore :warning :errror)))

(defun add-message (message &key (duplicate :warning))
  (asserts message duplicate)
  (unless (duplicatep duplicate)
    (error "こんとなん許しとらんけぇ。duplicate=~a" duplicate))
  (let ((code (code message))
        (lang (language message)))
    ;; TODO: use duplicate
    (cond ((null (gethash code *message*))
           (setf (gethash code *message*) (make-hash-table))))
    (let ((messages (get-messages code)))
      (setf (gethash lang messages) message))
    (values message code lang)))
