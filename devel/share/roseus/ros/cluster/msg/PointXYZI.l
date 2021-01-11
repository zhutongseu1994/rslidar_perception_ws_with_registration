;; Auto-generated. Do not edit!


(when (boundp 'cluster::PointXYZI)
  (if (not (find-package "CLUSTER"))
    (make-package "CLUSTER"))
  (shadow 'PointXYZI (find-package "CLUSTER")))
(unless (find-package "CLUSTER::POINTXYZI")
  (make-package "CLUSTER::POINTXYZI"))

(in-package "ROS")
;;//! \htmlinclude PointXYZI.msg.html


(defclass cluster::PointXYZI
  :super ros::object
  :slots (_x _y _z _intensity ))

(defmethod cluster::PointXYZI
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:intensity __intensity) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _intensity (float __intensity))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:intensity
   (&optional __intensity)
   (if __intensity (setq _intensity __intensity)) _intensity)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _intensity
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _intensity
       (sys::poke _intensity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _intensity
     (setq _intensity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get cluster::PointXYZI :md5sum-) "e3893f0253ed1d070c8e1f3f175960c5")
(setf (get cluster::PointXYZI :datatype-) "cluster/PointXYZI")
(setf (get cluster::PointXYZI :definition-)
      "float32 x
float32 y
float32 z
float32 intensity
")



(provide :cluster/PointXYZI "e3893f0253ed1d070c8e1f3f175960c5")


