; Auto-generated. Do not edit!


(cl:in-package segment-msg)


;//! \htmlinclude Cluster.msg.html

(cl:defclass <Cluster> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (object
    :reader object
    :initarg :object
    :type (cl:vector segment-msg:Object)
   :initform (cl:make-array 0 :element-type 'segment-msg:Object :initial-element (cl:make-instance 'segment-msg:Object))))
)

(cl:defclass Cluster (<Cluster>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Cluster>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Cluster)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name segment-msg:<Cluster> is deprecated: use segment-msg:Cluster instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Cluster>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segment-msg:header-val is deprecated.  Use segment-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'object-val :lambda-list '(m))
(cl:defmethod object-val ((m <Cluster>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segment-msg:object-val is deprecated.  Use segment-msg:object instead.")
  (object m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Cluster>) ostream)
  "Serializes a message object of type '<Cluster>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'object))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'object))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Cluster>) istream)
  "Deserializes a message object of type '<Cluster>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'object) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'object)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'segment-msg:Object))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Cluster>)))
  "Returns string type for a message object of type '<Cluster>"
  "segment/Cluster")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cluster)))
  "Returns string type for a message object of type 'Cluster"
  "segment/Cluster")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Cluster>)))
  "Returns md5sum for a message object of type '<Cluster>"
  "0df4098de0532e6c85cb8bfaa96c32d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Cluster)))
  "Returns md5sum for a message object of type 'Cluster"
  "0df4098de0532e6c85cb8bfaa96c32d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Cluster>)))
  "Returns full string definition for message of type '<Cluster>"
  (cl:format cl:nil "Header           header~%Object[]           object~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: segment/Object~%int32  id~%Center center~%float32 width~%float32 height~%float32 depth~%float32 speedx~%float32 speedy~%float32 k~%Rotate  rotate~%================================================================================~%MSG: segment/Center~%float32[3] pos~%================================================================================~%MSG: segment/Rotate~%float32 x~%float32 y~%float32 z~%float32 w~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Cluster)))
  "Returns full string definition for message of type 'Cluster"
  (cl:format cl:nil "Header           header~%Object[]           object~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: segment/Object~%int32  id~%Center center~%float32 width~%float32 height~%float32 depth~%float32 speedx~%float32 speedy~%float32 k~%Rotate  rotate~%================================================================================~%MSG: segment/Center~%float32[3] pos~%================================================================================~%MSG: segment/Rotate~%float32 x~%float32 y~%float32 z~%float32 w~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Cluster>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'object) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Cluster>))
  "Converts a ROS message object to a list"
  (cl:list 'Cluster
    (cl:cons ':header (header msg))
    (cl:cons ':object (object msg))
))
