
(cl:in-package :asdf)

(defsystem "cpg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cpg_pos" :depends-on ("_package_cpg_pos"))
    (:file "_package_cpg_pos" :depends-on ("_package"))
  ))