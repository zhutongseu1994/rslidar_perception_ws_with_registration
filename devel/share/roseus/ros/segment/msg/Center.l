;; Auto-generated. Do not edit!


(when (boundp 'segment::Center)
  (if (not (find-package "SEGMENT"))
    (make-package "SEGMENT"))
  (shadow 'Center (find-package "SEGMENT")))
(unless (find-package "SEGMENT::CENTER")
  (make-package "SEGMENT::CENTER"))

(in-package "ROS")
;;//! \htmlinclude Center.msg.html


(defclass segment::Center
  :super ros::object
  :slots (_pos ))

(defmethod segment::Center
  (:init
   (&key
    ((:pos __pos) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _pos __pos)
   self)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:serialization-length
   ()
   (+
    ;; float32[3] _pos
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[3] _pos
     (dotimes (i 3)
       (sys::poke (elt _pos i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[3] _pos
   (dotimes (i (length _pos))
     (setf (elt _pos i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get segment::Center :md5sum-) "223306f6c142640d35d04c4629b6586f")
(setf (get segment::Center :datatype-) "segment/Center")
(setf (get segment::Center :definition-)
      "float32[3] pos
")



(provide :segment/Center "223306f6c142640d35d04c4629b6586f")


