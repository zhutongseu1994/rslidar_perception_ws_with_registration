;; Auto-generated. Do not edit!


(when (boundp 'segment::Cluster)
  (if (not (find-package "SEGMENT"))
    (make-package "SEGMENT"))
  (shadow 'Cluster (find-package "SEGMENT")))
(unless (find-package "SEGMENT::CLUSTER")
  (make-package "SEGMENT::CLUSTER"))

(in-package "ROS")
;;//! \htmlinclude Cluster.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass segment::Cluster
  :super ros::object
  :slots (_header _object ))

(defmethod segment::Cluster
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:object __object) (let (r) (dotimes (i 0) (push (instance segment::Object :init) r)) r))
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
    ;; segment/Object[] _object
    (apply #'+ (send-all _object :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; segment/Object[] _object
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
   ;; segment/Object[] _object
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _object (let (r) (dotimes (i n) (push (instance segment::Object :init) r)) r))
     (dolist (elem- _object)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get segment::Cluster :md5sum-) "0df4098de0532e6c85cb8bfaa96c32d9")
(setf (get segment::Cluster :datatype-) "segment/Cluster")
(setf (get segment::Cluster :definition-)
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
MSG: segment/Object
int32  id
Center center
float32 width
float32 height
float32 depth
float32 speedx
float32 speedy
float32 k
Rotate  rotate
================================================================================
MSG: segment/Center
float32[3] pos
================================================================================
MSG: segment/Rotate
float32 x
float32 y
float32 z
float32 w
")



(provide :segment/Cluster "0df4098de0532e6c85cb8bfaa96c32d9")


