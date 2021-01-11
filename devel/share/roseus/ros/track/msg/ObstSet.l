;; Auto-generated. Do not edit!


(when (boundp 'track::ObstSet)
  (if (not (find-package "TRACK"))
    (make-package "TRACK"))
  (shadow 'ObstSet (find-package "TRACK")))
(unless (find-package "TRACK::OBSTSET")
  (make-package "TRACK::OBSTSET"))

(in-package "ROS")
;;//! \htmlinclude ObstSet.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass track::ObstSet
  :super ros::object
  :slots (_header _obsts ))

(defmethod track::ObstSet
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:obsts __obsts) (let (r) (dotimes (i 0) (push (instance track::ObstPointCloud :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _obsts __obsts)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:obsts
   (&rest __obsts)
   (if (keywordp (car __obsts))
       (send* _obsts __obsts)
     (progn
       (if __obsts (setq _obsts (car __obsts)))
       _obsts)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; track/ObstPointCloud[] _obsts
    (apply #'+ (send-all _obsts :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; track/ObstPointCloud[] _obsts
     (write-long (length _obsts) s)
     (dolist (elem _obsts)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; track/ObstPointCloud[] _obsts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obsts (let (r) (dotimes (i n) (push (instance track::ObstPointCloud :init) r)) r))
     (dolist (elem- _obsts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get track::ObstSet :md5sum-) "cd21e1cd6431341c4a3463e8eb5df073")
(setf (get track::ObstSet :datatype-) "track/ObstSet")
(setf (get track::ObstSet :definition-)
      "Header           header
ObstPointCloud[]  obsts
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
MSG: track/ObstPointCloud
Header           header
PointXYZI[]      points
================================================================================
MSG: track/PointXYZI
float32 x
float32 y
float32 z
float32 intensity
")



(provide :track/ObstSet "cd21e1cd6431341c4a3463e8eb5df073")


