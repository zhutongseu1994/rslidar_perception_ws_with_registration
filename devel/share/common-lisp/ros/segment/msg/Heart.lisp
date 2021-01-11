; Auto-generated. Do not edit!


(cl:in-package segment-msg)


;//! \htmlinclude Heart.msg.html

(cl:defclass <Heart> (roslisp-msg-protocol:ros-message)
  ((process_id
    :reader process_id
    :initarg :process_id
    :type cl:integer
    :initform 0)
   (process_name
    :reader process_name
    :initarg :process_name
    :type cl:string
    :initform ""))
)

(cl:defclass Heart (<Heart>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Heart>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Heart)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name segment-msg:<Heart> is deprecated: use segment-msg:Heart instead.")))

(cl:ensure-generic-function 'process_id-val :lambda-list '(m))
(cl:defmethod process_id-val ((m <Heart>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segment-msg:process_id-val is deprecated.  Use segment-msg:process_id instead.")
  (process_id m))

(cl:ensure-generic-function 'process_name-val :lambda-list '(m))
(cl:defmethod process_name-val ((m <Heart>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segment-msg:process_name-val is deprecated.  Use segment-msg:process_name instead.")
  (process_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Heart>) ostream)
  "Serializes a message object of type '<Heart>"
  (cl:let* ((signed (cl:slot-value msg 'process_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'process_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'process_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Heart>) istream)
  "Deserializes a message object of type '<Heart>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'process_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'process_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'process_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Heart>)))
  "Returns string type for a message object of type '<Heart>"
  "segment/Heart")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Heart)))
  "Returns string type for a message object of type 'Heart"
  "segment/Heart")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Heart>)))
  "Returns md5sum for a message object of type '<Heart>"
  "718b78ec4cfdf2ec3139a2f37b006d8e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Heart)))
  "Returns md5sum for a message object of type 'Heart"
  "718b78ec4cfdf2ec3139a2f37b006d8e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Heart>)))
  "Returns full string definition for message of type '<Heart>"
  (cl:format cl:nil "int32  process_id~%string process_name~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Heart)))
  "Returns full string definition for message of type 'Heart"
  (cl:format cl:nil "int32  process_id~%string process_name~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Heart>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'process_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Heart>))
  "Converts a ROS message object to a list"
  (cl:list 'Heart
    (cl:cons ':process_id (process_id msg))
    (cl:cons ':process_name (process_name msg))
))
