(in-package :cl-user)
(defpackage world2world-test
  (:use :cl
   :world2world
        :prove))
(in-package :world2world-test)


(plan nil)


(plan 7)

;;;;;
;;;;; world
;;;;;
(subtest "make-world"
  (let* ((language :test-lang)
         (description :description)
         (world (make-world language :description description)))
    (ok world)

    (is language (language world))
    (is description (description world) :test 'equalp)

    (subtest "can raise error"
      (is-error (make-world "test-language" :description description)
                'error
                "with language isn't keyword."))))

;;;;;
;;;;; Message
;;;;;
(subtest "make-message"
  (let* ((code :test-code)
         (language :test-lang)
         (controller "test a=~a, b=~b")
         (description "test-description")
         (message (make-message code language controller :description description)))
    (ok message)
    (is code (code message))
    (is language (language message))
    (is controller (controller message) :test 'equalp)
    (is description (description message) :test 'equalp)

    (subtest "can raise error"
      (is-error (make-message "test-code" language controller :description description)
                'error
                "with code isn't keyword.")
      (is-error (make-message code "test-language" controller :description description)
                'error
                "with language isn't keyword."))))

(subtest "add-message"
  (let* ((code :test-code)
         (language :test-lang)
         (controller "test a=~a, b=~b")
         (description "test-description")
         (message (make-message code language controller :description description)))
    (multiple-value-bind (ret-message ret-code ret-language)
        (add-message message)
      (is ret-message message)
      (is ret-code code)
      (is ret-language language))

    (subtest "can raise error"
      (is-error (add-message nil)
                'error
                "with language is null"))))

(subtest "get-message"
  (let* ((code1 :test-code1)
         (code2 :test-code2)
         (language1 :test-lang1)
         (language2 :test-lang2)
         (controller "test a=~a, b=~b")
         (message (make-message code1 language1 controller))
         (world1 (make-world language1))
         (world2 (make-world language2)))
    (add-message message)
    (let ((ret-message (get-message code1 world1)))
      (ok ret-message)
      (when ret-message
        (is ret-message message))
      (ok (null (get-message code1 world2)))
      (ok (null (get-message code2 world1)))
      (ok (null (get-message code2 world2))))))


;;;;;
;;;;; communication
;;;;;
(subtest "c*"
  (pass "Skip test of c*."))

(subtest "format*"
  (let* ((code :test-code)
         (language :test-lang)
         (controller "test a=~a, b=~a")
         (message (make-message code language controller)))
    (setf w2w::*world* (make-world language))
    (add-message message)

    (is (format* nil code 1 2) "test a=1, b=2" :test 'string=)))

(subtest "error*"
  (let* ((code :test-code)
         (language :test-lang)
         (controller "test a=~a, b=~a")
         (message (make-message code language controller)))
    (setf w2w::*world* (make-world language))
    (add-message message)

    (is-error (error* code 1 2)
              'simple-error)))
(finalize)
