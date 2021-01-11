;; Auto-generated. Do not edit!


(when (boundp 'segment::Object)
  (if (not (find-package "SEGMENT"))
    (make-package "SEGMENT"))
  (shadow 'Object (find-package "SEGMENT")))
(unless (find-package "SEGMENT::OBJECT")
  (make-package "SEGMENT::OBJECT"))

(in-package "ROS")
;;//! \htmlinclude Object.msg.html


(defclass segment::Object
  :super ros::object
  :slots (_id _center _width _height _depth _speedx _speedy _k _rotate ))

(defmethod segment::Object
  (:init
   (&key
    ((:id __id) 0)
    ((:center __center) (instance segment::Center :init))
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:depth __depth) 0.0)
    ((:speedx __speedx) 0.0)
    ((:speedy __speedy) 0.0)
    ((:k __k) 0.0)
    ((:rotate __rotate) (instance segment::Rotate :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _center __center)
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _depth (float __depth))
   (setq _speedx (float __speedx))
   (setq _speedy (float __speedy))
   (setq _k (float __k))
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
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:speedx
   (&optional __speedx)
   (if __speedx (setq _speedx __speedx)) _speedx)
  (:speedy
   (&optional __speedy)
   (if __speedy (setq _speedy __speedy)) _speedy)
  (:k
   (&optional __k)
   (if __k (setq _k __k)) _k)
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
    ;; segment/Center _center
    (send _center :serialization-length)
    ;; float32 _width
    4
    ;; float32 _height
    4
    ;; float32 _depth
    4
    ;; float32 _speedx
    4
    ;; float32 _speedy
    4
    ;; float32 _k
    4
    ;; segment/Rotate _rotate
    (send _rotate :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; segment/Center _center
       (send _center :serialize s)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speedx
       (sys::poke _speedx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speedy
       (sys::poke _speedy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _k
       (sys::poke _k (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; segment/Rotate _rotate
       (send _rotate :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; segment/Center _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _depth
     (setq _depth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speedx
     (setq _speedx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speedy
     (setq _speedy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _k
     (setq _k (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; segment/Rotate _rotate
     (send _rotate :deserialize buf ptr-) (incf ptr- (send _rotate :serialization-length))
   ;;
   self)
  )

(setf (get segment::Object :md5sum-) "cc1c62817e5c1f9abba5f583e5d62982")
(setf (get segment::Object :datatype-) "segment/Object")
(setf (get segment::Object :definition-)
      "int32  id
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



(provide :segment/Object "cc1c62817e5c1f9abba5f583e5d62982")


