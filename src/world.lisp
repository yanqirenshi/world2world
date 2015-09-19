(in-package :world2world)

;;;;;
;;;;; World
;;;;;
(defvar *worlds* (make-hash-table))

(defun world-at (code)
  (assert (keywordp code))
  (let ((world (gethash code *worlds*)))
    (or world
        (setf (gethash code *worlds*)
              (make-instance 'world :code code)))))


;;;;;
;;;;; Default World
;;;;;
(defvar *world* nil)

(defun default-world () *world*)

(defun (setf default-world) (value)
  (setf *world*
        (cond ((keywordp value) (world-at value))
              (t value))))
