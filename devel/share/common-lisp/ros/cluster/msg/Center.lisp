; Auto-generated. Do not edit!


(cl:in-package cluster-msg)


;//! \htmlinclude Center.msg.html

(cl:defclass <Center> (roslisp-msg-protocol:ros-message)
  ((pos
    :reader pos
    :initarg :pos
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Center (<Center>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Center>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Center)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cluster-msg:<Center> is deprecated: use cluster-msg:Center instead.")))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <Center>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cluster-msg:pos-val is deprecated.  Use cluster-msg:pos instead.")
  (pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Center>) ostream)
  "Serializes a message object of type '<Center>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pos))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Center>) istream)
  "Deserializes a message object of type '<Center>"
  (cl:setf (cl:slot-value msg 'pos) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'pos)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Center>)))
  "Returns string type for a message object of type '<Center>"
  "cluster/Center")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Center)))
  "Returns string type for a message object of type 'Center"
  "cluster/Center")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Center>)))
  "Returns md5sum for a message object of type '<Center>"
  "223306f6c142640d35d04c4629b6586f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Center)))
  "Returns md5sum for a message object of type 'Center"
  "223306f6c142640d35d04c4629b6586f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Center>)))
  "Returns full string definition for message of type '<Center>"
  (cl:format cl:nil "float32[3] pos~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Center)))
  "Returns full string definition for message of type 'Center"
  (cl:format cl:nil "float32[3] pos~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Center>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'pos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Center>))
  "Converts a ROS message object to a list"
  (cl:list 'Center
    (cl:cons ':pos (pos msg))
))
