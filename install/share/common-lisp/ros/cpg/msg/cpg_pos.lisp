; Auto-generated. Do not edit!


(cl:in-package cpg-msg)


;//! \htmlinclude cpg_pos.msg.html

(cl:defclass <cpg_pos> (roslisp-msg-protocol:ros-message)
  ((cpg_x_joint_angles
    :reader cpg_x_joint_angles
    :initarg :cpg_x_joint_angles
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (cpg_y_joint_angles
    :reader cpg_y_joint_angles
    :initarg :cpg_y_joint_angles
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass cpg_pos (<cpg_pos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cpg_pos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cpg_pos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cpg-msg:<cpg_pos> is deprecated: use cpg-msg:cpg_pos instead.")))

(cl:ensure-generic-function 'cpg_x_joint_angles-val :lambda-list '(m))
(cl:defmethod cpg_x_joint_angles-val ((m <cpg_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cpg-msg:cpg_x_joint_angles-val is deprecated.  Use cpg-msg:cpg_x_joint_angles instead.")
  (cpg_x_joint_angles m))

(cl:ensure-generic-function 'cpg_y_joint_angles-val :lambda-list '(m))
(cl:defmethod cpg_y_joint_angles-val ((m <cpg_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cpg-msg:cpg_y_joint_angles-val is deprecated.  Use cpg-msg:cpg_y_joint_angles instead.")
  (cpg_y_joint_angles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cpg_pos>) ostream)
  "Serializes a message object of type '<cpg_pos>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cpg_x_joint_angles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'cpg_x_joint_angles))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cpg_y_joint_angles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'cpg_y_joint_angles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cpg_pos>) istream)
  "Deserializes a message object of type '<cpg_pos>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cpg_x_joint_angles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cpg_x_joint_angles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cpg_y_joint_angles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cpg_y_joint_angles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cpg_pos>)))
  "Returns string type for a message object of type '<cpg_pos>"
  "cpg/cpg_pos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cpg_pos)))
  "Returns string type for a message object of type 'cpg_pos"
  "cpg/cpg_pos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cpg_pos>)))
  "Returns md5sum for a message object of type '<cpg_pos>"
  "2fff63fc5abef0741cd1ffa24a1ff65e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cpg_pos)))
  "Returns md5sum for a message object of type 'cpg_pos"
  "2fff63fc5abef0741cd1ffa24a1ff65e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cpg_pos>)))
  "Returns full string definition for message of type '<cpg_pos>"
  (cl:format cl:nil "float64[] cpg_x_joint_angles~%float64[] cpg_y_joint_angles~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cpg_pos)))
  "Returns full string definition for message of type 'cpg_pos"
  (cl:format cl:nil "float64[] cpg_x_joint_angles~%float64[] cpg_y_joint_angles~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cpg_pos>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cpg_x_joint_angles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cpg_y_joint_angles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cpg_pos>))
  "Converts a ROS message object to a list"
  (cl:list 'cpg_pos
    (cl:cons ':cpg_x_joint_angles (cpg_x_joint_angles msg))
    (cl:cons ':cpg_y_joint_angles (cpg_y_joint_angles msg))
))
