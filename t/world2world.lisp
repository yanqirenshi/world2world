(in-package :cl-user)
(defpackage world2world-test
  (:use :cl
   :world2world
        :prove))
(in-package :world2world-test)


(plan 1)

(subtest "Normal test"
  (ok (add-expression :msg1 :hiroshima "これはテストじゃけぇね。値は ~a よ。")
      "add expression of hiroshima.")

  (ok (add-expression :msg1 :en "This is test. value is ~a.")
      "add expression of english.")

  (ok (setf (default-world) :hiroshima)
      "set hiroshima")

  (is (format* nil :msg1 1) "これはテストじゃけぇね。値は 1 よ。"
      "format* for hiroshima")

  (ok (setf (default-world) :en)
      "set english")

  (is (format* nil :msg1 1) "This is test. value is 1."
      "format* for english")

  (ok (setf (default-world) :ja)
      "set japanese")

  (is (format* nil :msg1 1) "これはテストじゃけぇね。値は 1 よ。"
      "format* for japanese"))

(finalize)
