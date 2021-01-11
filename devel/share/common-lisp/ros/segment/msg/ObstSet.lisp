; Auto-generated. Do not edit!


(cl:in-package segment-msg)


;//! \htmlinclude ObstSet.msg.html

(cl:defclass <ObstSet> (roslisp-msg-protocol:ros-message)
  ((obsts
    :reader obsts
    :initarg :obsts
    :type (cl:vector segment-msg:ObstPointCloud)
   :initform (cl:make-array 0 :element-type 'segment-msg:ObstPointCloud :initial-element (cl:make-instance 'segment-msg:ObstPointCloud))))
)

(cl:defclass ObstSet (<ObstSet>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstSet>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstSet)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name segment-msg:<ObstSet> is deprecated: use segment-msg:ObstSet instead.")))

(cl:ensure-generic-function 'obsts-val :lambda-list '(m))
(cl:defmethod obsts-val ((m <ObstSet>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader segment-msg:obsts-val is deprecated.  Use segment-msg:obsts instead.")
  (obsts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstSet>) ostream)
  "Serializes a message object of type '<ObstSet>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obsts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obsts))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstSet>) istream)
  "Deserializes a message object of type '<ObstSet>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obsts) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obsts)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'segment-msg:ObstPointCloud))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstSet>)))
  "Returns string type for a message object of type '<ObstSet>"
  "segment/ObstSet")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstSet)))
  "Returns string type for a message object of type 'ObstSet"
  "segment/ObstSet")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstSet>)))
  "Returns md5sum for a message object of type '<ObstSet>"
  "6dccf9553cd681203dcea38a70f25c51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstSet)))
  "Returns md5sum for a message object of type 'ObstSet"
  "6dccf9553cd681203dcea38a70f25c51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstSet>)))
  "Returns full string definition for message of type '<ObstSet>"
  (cl:format cl:nil "ObstPointCloud[]  obsts~%================================================================================~%MSG: segment/ObstPointCloud~%Header           header~%PointXYZI[]      points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: segment/PointXYZI~%float32 x~%float32 y~%float32 z~%float32 intensity~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstSet)))
  "Returns full string definition for message of type 'ObstSet"
  (cl:format cl:nil "ObstPointCloud[]  obsts~%================================================================================~%MSG: segment/ObstPointCloud~%Header           header~%PointXYZI[]      points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: segment/PointXYZI~%float32 x~%float32 y~%float32 z~%float32 intensity~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstSet>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obsts) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstSet>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstSet
    (cl:cons ':obsts (obsts msg))
))
