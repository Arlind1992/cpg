
(cl:in-package :asdf)

(defsystem "cpg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ModifyParameters" :depends-on ("_package_ModifyParameters"))
    (:file "_package_ModifyParameters" :depends-on ("_package"))
  ))