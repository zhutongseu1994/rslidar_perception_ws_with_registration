;; Auto-generated. Do not edit!


(when (boundp 'track::Object)
  (if (not (find-package "TRACK"))
    (make-package "TRACK"))
  (shadow 'Object (find-package "TRACK")))
(unless (find-package "TRACK::OBJECT")
  (make-package "TRACK::OBJECT"))

(in-package "ROS")
;;//! \htmlinclude Object.msg.html


(defclass track::Object
  :super ros::object
  :slots (_id _center _length _width _height _speedx _speedy _slope _weights _rotate ))

(defmethod track::Object
  (:init
   (&key
    ((:id __id) 0)
    ((:center __center) (instance track::Center :init))
    ((:length __length) 0.0)
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:speedx __speedx) 0.0)
    ((:speedy __speedy) 0.0)
    ((:slope __slope) 0.0)
    ((:weights __weights) 0.0)
    ((:rotate __rotate) (instance track::Rotate :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _center __center)
   (setq _length (float __length))
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _speedx (float __speedx))
   (setq _speedy (float __speedy))
   (setq _slope (float __slope))
   (setq _weights (float __weights))
   (setq _rotate __rotate)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:length
   (&optional __length)
   (if __length (setq _length __length)) _length)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:speedx
   (&optional __speedx)
   (if __speedx (setq _speedx __speedx)) _speedx)
  (:speedy
   (&optional __speedy)
   (if __speedy (setq _speedy __speedy)) _speedy)
  (:slope
   (&optional __slope)
   (if __slope (setq _slope __slope)) _slope)
  (:weights
   (&optional __weights)
   (if __weights (setq _weights __weights)) _weights)
  (:rotate
   (&rest __rotate)
   (if (keywordp (car __rotate))
       (send* _rotate __rotate)
     (progn
       (if __rotate (setq _rotate (car __rotate)))
       _rotate)))
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; track/Center _center
    (send _center :serialization-length)
    ;; float32 _length
    4
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; float32 _speedx
    4
    ;; float32 _speedy
    4
    ;; float32 _slope
    4
    ;; float32 _weights
    4
    ;; track/Rotate _rotate
    (send _rotate :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; track/Center _center
       (send _center :serialize s)
     ;; float32 _length
       (sys::poke _length (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speedx
       (sys::poke _speedx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speedy
       (sys::poke _speedy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _slope
       (sys::poke _slope (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _weights
       (sys::poke _weights (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; track/Rotate _rotate
       (send _rotate :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; track/Center _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; float32 _length
     (setq _length (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speedx
     (setq _speedx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speedy
     (setq _speedy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _slope
     (setq _slope (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _weights
     (setq _weights (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; track/Rotate _rotate
     (send _rotate :deserialize buf ptr-) (incf ptr- (send _rotate :serialization-length))
   ;;
   self)
  )

(setf (get track::Object :md5sum-) "57f4ef02c648ff1d44cba8fe8606a123")
(setf (get track::Object :datatype-) "track/Object")
(setf (get track::Object :definition-)
      "int32  id
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



(provide :track/Object "57f4ef02c648ff1d44cba8fe8606a123")


