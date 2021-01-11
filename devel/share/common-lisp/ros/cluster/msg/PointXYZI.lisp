; Auto-generated. Do not edit!


(cl:in-package cluster-msg)


;//! \htmlinclude PointXYZI.msg.html

(cl:defclass <PointXYZI> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (intensity
    :reader intensity
    :initarg :intensity
    :type cl:float
    :initform 0.0))
)

(cl:defclass PointXYZI (<PointXYZI>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointXYZI>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointXYZI)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cluster-msg:<PointXYZI> is deprecated: use cluster-msg:PointXYZI instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <PointXYZI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cluster-msg:x-val is deprecated.  Use cluster-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <PointXYZI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cluster-msg:y-val is deprecated.  Use cluster-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <PointXYZI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cluster-msg:z-val is deprecated.  Use cluster-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'intensity-val :lambda-list '(m))
(cl:defmethod intensity-val ((m <PointXYZI>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cluster-msg:intensity-val is deprecated.  Use cluster-msg:intensity instead.")
  (intensity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointXYZI>) ostream)
  "Serializes a message object of type '<PointXYZI>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'intensity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointXYZI>) istream)
  "Deserializes a message object of type '<PointXYZI>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'intensity) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointXYZI>)))
  "Returns string type for a message object of type '<PointXYZI>"
  "cluster/PointXYZI")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointXYZI)))
  "Returns string type for a message object of type 'PointXYZI"
  "cluster/PointXYZI")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointXYZI>)))
  "Returns md5sum for a message object of type '<PointXYZI>"
  "e3893f0253ed1d070c8e1f3f175960c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointXYZI)))
  "Returns md5sum for a message object of type 'PointXYZI"
  "e3893f0253ed1d070c8e1f3f175960c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointXYZI>)))
  "Returns full string definition for message of type '<PointXYZI>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 intensity~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointXYZI)))
  "Returns full string definition for message of type 'PointXYZI"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%float32 intensity~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointXYZI>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointXYZI>))
  "Converts a ROS message object to a list"
  (cl:list 'PointXYZI
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':intensity (intensity msg))
))
