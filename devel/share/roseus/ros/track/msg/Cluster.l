;; Auto-generated. Do not edit!


(when (boundp 'track::Cluster)
  (if (not (find-package "TRACK"))
    (make-package "TRACK"))
  (shadow 'Cluster (find-package "TRACK")))
(unless (find-package "TRACK::CLUSTER")
  (make-package "TRACK::CLUSTER"))

(in-package "ROS")
;;//! \htmlinclude Cluster.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass track::Cluster
  :super ros::object
  :slots (_header _object ))

(defmethod track::Cluster
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:object __object) (let (r) (dotimes (i 0) (push (instance track::Object :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _object __object)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:object
   (&rest __object)
   (if (keywordp (car __object))
       (send* _object __object)
     (progn
       (if __object (setq _object (car __object)))
       _object)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; track/Object[] _object
    (apply #'+ (send-all _object :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; track/Object[] _object
     (write-long (length _object) s)
     (dolist (elem _object)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; track/Object[] _object
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object (let (r) (dotimes (i n) (push (instance track::Object :init) r)) r))
     (dolist (elem- _object)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get track::Cluster :md5sum-) "caa5c8e9c573fee9956145ca244932b2")
(setf (get track::Cluster :datatype-) "track/Cluster")
(setf (get track::Cluster :definition-)
      "Header           header
Object[]           object

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: track/Object
int32  id
Center center
float32 length
float32 width 
float32 height

float32 speedx
float32 speedy

float32 slope
float32 weights
Rotate  rotate
================================================================================
MSG: track/Center
float32[3] pos
================================================================================
MSG: track/Rotate
float32 x
float32 y
float32 z
float32 w
")



(provide :track/Cluster "caa5c8e9c573fee9956145ca244932b2")


