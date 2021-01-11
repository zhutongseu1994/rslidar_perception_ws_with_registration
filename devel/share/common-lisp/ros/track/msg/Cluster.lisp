; Auto-generated. Do not edit!


(cl:in-package track-msg)


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
    :type (cl:vector track-msg:Object)
   :initform (cl:make-array 0 :element-type 'track-msg:Object :initial-element (cl:make-instance 'track-msg:Object))))
)

(cl:defclass Cluster (<Cluster>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Cluster>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Cluster)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name track-msg:<Cluster> is deprecated: use track-msg:Cluster instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Cluster>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader track-msg:header-val is deprecated.  Use track-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'object-val :lambda-list '(m))
(cl:defmethod object-val ((m <Cluster>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader track-msg:object-val is deprecated.  Use track-msg:object instead.")
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
    (cl:setf (cl:aref vals i) (cl:make-instance 'track-msg:Object))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Cluster>)))
  "Returns string type for a message object of type '<Cluster>"
  "track/Cluster")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cluster)))
  "Returns string type for a message object of type 'Cluster"
  "track/Cluster")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Cluster>)))
  "Returns md5sum for a message object of type '<Cluster>"
  "caa5c8e9c573fee9956145ca244932b2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Cluster)))
  "Returns md5sum for a message object of type 'Cluster"
  "caa5c8e9c573fee9956145ca244932b2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Cluster>)))
  "Returns full string definition for message of type '<Cluster>"
  (cl:format cl:nil "Header           header
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Cluster)))
  "Returns full string definition for message of type 'Cluster"
  (cl:format cl:nil "Header           header
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