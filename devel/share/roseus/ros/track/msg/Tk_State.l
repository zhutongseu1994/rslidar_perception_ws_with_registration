;; Auto-generated. Do not edit!


(when (boundp 'track::Tk_State)
  (if (not (find-package "TRACK"))
    (make-package "TRACK"))
  (shadow 'Tk_State (find-package "TRACK")))
(unless (find-package "TRACK::TK_STATE")
  (make-package "TRACK::TK_STATE"))

(in-package "ROS")
;;//! \htmlinclude Tk_State.msg.html


(defclass track::Tk_State
  :super ros::object
  :slots (_time_stamp_1 _roll _pitch _yaw _longitude _latitude _X _Y _wheel_angle _velocity _velocity_x _velocity_y ))

(defmethod track::Tk_State
  (:init
   (&key
    ((:time_stamp_1 __time_stamp_1) 0)
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:longitude __longitude) 0.0)
    ((:latitude __latitude) 0.0)
    ((:X __X) 0.0)
    ((:Y __Y) 0.0)
    ((:wheel_angle __wheel_angle) 0)
    ((:velocity __velocity) 0)
    ((:velocity_x __velocity_x) 0.0)
    ((:velocity_y __velocity_y) 0.0)
    )
   (send-super :init)
   (setq _time_stamp_1 (round __time_stamp_1))
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _longitude (float __longitude))
   (setq _latitude (float __latitude))
   (setq _X (float __X))
   (setq _Y (float __Y))
   (setq _wheel_angle (round __wheel_angle))
   (setq _velocity (round __velocity))
   (setq _velocity_x (float __velocity_x))
   (setq _velocity_y (float __velocity_y))
   self)
  (:time_stamp_1
   (&optional __time_stamp_1)
   (if __time_stamp_1 (setq _time_stamp_1 __time_stamp_1)) _time_stamp_1)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:X
   (&optional __X)
   (if __X (setq _X __X)) _X)
  (:Y
   (&optional __Y)
   (if __Y (setq _Y __Y)) _Y)
  (:wheel_angle
   (&optional __wheel_angle)
   (if __wheel_angle (setq _wheel_angle __wheel_angle)) _wheel_angle)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:velocity_x
   (&optional __velocity_x)
   (if __velocity_x (setq _velocity_x __velocity_x)) _velocity_x)
  (:velocity_y
   (&optional __velocity_y)
   (if __velocity_y (setq _velocity_y __velocity_y)) _velocity_y)
  (:serialization-length
   ()
   (+
    ;; int64 _time_stamp_1
    8
    ;; float32 _roll
    4
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ;; float64 _longitude
    8
    ;; float64 _latitude
    8
    ;; float32 _X
    4
    ;; float32 _Y
    4
    ;; int32 _wheel_angle
    4
    ;; int32 _velocity
    4
    ;; float32 _velocity_x
    4
    ;; float32 _velocity_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _time_stamp_1
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _time_stamp_1 (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _time_stamp_1) (= (length (_time_stamp_1 . bv)) 2)) ;; bignum
              (write-long (ash (elt (_time_stamp_1 . bv) 0) 0) s)
              (write-long (ash (elt (_time_stamp_1 . bv) 1) -1) s))
             ((and (class _time_stamp_1) (= (length (_time_stamp_1 . bv)) 1)) ;; big1
              (write-long (elt (_time_stamp_1 . bv) 0) s)
              (write-long (if (>= _time_stamp_1 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _time_stamp_1 s)(write-long (if (>= _time_stamp_1 0) 0 #xffffffff) s)))
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _X
       (sys::poke _X (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Y
       (sys::poke _Y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _wheel_angle
       (write-long _wheel_angle s)
     ;; int32 _velocity
       (write-long _velocity s)
     ;; float32 _velocity_x
       (sys::poke _velocity_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _velocity_y
       (sys::poke _velocity_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _time_stamp_1
#+(or :alpha :irix6 :x86_64)
      (setf _time_stamp_1 (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _time_stamp_1 (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _X
     (setq _X (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Y
     (setq _Y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _wheel_angle
     (setq _wheel_angle (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _velocity
     (setq _velocity (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _velocity_x
     (setq _velocity_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _velocity_y
     (setq _velocity_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get track::Tk_State :md5sum-) "42e44858c0db0a8de1fd497f35b6051e")
(setf (get track::Tk_State :datatype-) "track/Tk_State")
(setf (get track::Tk_State :definition-)
      "int64 time_stamp_1
float32 roll
float32 pitch
float32 yaw   
float64 longitude
float64 latitude
#float32 height
float32 X
float32 Y 
#int32 time_stamp_2
int32 wheel_angle
int32 velocity
float32 velocity_x
float32 velocity_y


")



(provide :track/Tk_State "42e44858c0db0a8de1fd497f35b6051e")


