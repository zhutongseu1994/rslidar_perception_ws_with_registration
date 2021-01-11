;; Auto-generated. Do not edit!


(when (boundp 'segment::ObstSet)
  (if (not (find-package "SEGMENT"))
    (make-package "SEGMENT"))
  (shadow 'ObstSet (find-package "SEGMENT")))
(unless (find-package "SEGMENT::OBSTSET")
  (make-package "SEGMENT::OBSTSET"))

(in-package "ROS")
;;//! \htmlinclude ObstSet.msg.html


(defclass segment::ObstSet
  :super ros::object
  :slots (_obsts ))

(defmethod segment::ObstSet
  (:init
   (&key
    ((:obsts __obsts) (let (r) (dotimes (i 0) (push (instance segment::ObstPointCloud :init) r)) r))
    )
   (send-super :init)
   (setq _obsts __obsts)
   self)
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
    ;; segment/ObstPointCloud[] _obsts
    (apply #'+ (send-all _obsts :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; segment/ObstPointCloud[] _obsts
     (write-long (length _obsts) s)
     (dolist (elem _obsts)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; segment/ObstPointCloud[] _obsts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obsts (let (r) (dotimes (i n) (push (instance segment::ObstPointCloud :init) r)) r))
     (dolist (elem- _obsts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get segment::ObstSet :md5sum-) "6dccf9553cd681203dcea38a70f25c51")
(setf (get segment::ObstSet :datatype-) "segment/ObstSet")
(setf (get segment::ObstSet :definition-)
      "ObstPointCloud[]  obsts
================================================================================
MSG: segment/ObstPointCloud
Header           header
PointXYZI[]      points
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
MSG: segment/PointXYZI
float32 x
float32 y
float32 z
float32 intensity
")



(provide :segment/ObstSet "6dccf9553cd681203dcea38a70f25c51")


