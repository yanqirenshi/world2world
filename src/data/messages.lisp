(in-package :world2world)

(defvar *message-data*
  '(nil
    ;; example
    (:code :not-supported-type
     :values ((:language :hiroshima
               :controller "このタイプには対応しとらんけぇ タイプ=~a"
               :description "")
              (:language :en
               :controller "Not supported type. type=~a"
               :description "")))
    ;; template. please copy use.
    (:code nil
     :values ((:language :hiroshima
               :controller ""
               :description "")
              (:language :en
               :controller ""
               :description "")))))
