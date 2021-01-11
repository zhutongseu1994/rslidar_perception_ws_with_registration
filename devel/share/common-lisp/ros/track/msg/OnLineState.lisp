; Auto-generated. Do not edit!


(cl:in-package track-msg)


;//! \htmlinclude OnLineState.msg.html

(cl:defclass <OnLineState> (roslisp-msg-protocol:ros-message)
  ((decv_id
    :reader decv_id
    :initarg :decv_id
    :type cl:integer
    :initform 0)
   (decv_state
    :reader decv_state
    :initarg :decv_state
    :type cl:integer
    :initform 0))
)

(cl:defclass OnLineState (<OnLineState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OnLineState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OnLineState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name track-msg:<OnLineState> is deprecated: use track-msg:OnLineState instead.")))

(cl:ensure-generic-function 'decv_id-val :lambda-list '(m))
(cl:defmethod decv_id-val ((m <OnLineState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader track-msg:decv_id-val is deprecated.  Use track-msg:decv_id instead.")
  (decv_id m))

(cl:ensure-generic-function 'decv_state-val :lambda-list '(m))
(cl:defmethod decv_state-val ((m <OnLineState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader track-msg:decv_state-val is deprecated.  Use track-msg:decv_state instead.")
  (decv_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OnLineState>) ostream)
  "Serializes a message object of type '<OnLineState>"
  (cl:let* ((signed (cl:slot-value msg 'decv_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'decv_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OnLineState>) istream)
  "Deserializes a message object of type '<OnLineState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'decv_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'decv_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OnLineState>)))
  "Returns string type for a message object of type '<OnLineState>"
  "track/OnLineState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OnLineState)))
  "Returns string type for a message object of type 'OnLineState"
  "track/OnLineState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OnLineState>)))
  "Returns md5sum for a message object of type '<OnLineState>"
  "269526fcf5c8a42805d9b626dbe6c55d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OnLineState)))
  "Returns md5sum for a message object of type 'OnLineState"
  "269526fcf5c8a42805d9b626dbe6c55d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OnLineState>)))
  "Returns full string definition for message of type '<OnLineState>"
  (cl:format cl:nil "int32  decv_id~%int32  decv_state~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OnLineState)))
  "Returns full string definition for message of type 'OnLineState"
  (cl:format cl:nil "int32  decv_id~%int32  decv_state~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OnLineState>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OnLineState>))
  "Converts a ROS message object to a list"
  (cl:list 'OnLineState
    (cl:cons ':decv_id (decv_id msg))
    (cl:cons ':decv_state (decv_state msg))
))
