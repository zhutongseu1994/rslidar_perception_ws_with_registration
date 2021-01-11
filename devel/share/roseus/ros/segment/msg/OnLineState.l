;; Auto-generated. Do not edit!


(when (boundp 'segment::OnLineState)
  (if (not (find-package "SEGMENT"))
    (make-package "SEGMENT"))
  (shadow 'OnLineState (find-package "SEGMENT")))
(unless (find-package "SEGMENT::ONLINESTATE")
  (make-package "SEGMENT::ONLINESTATE"))

(in-package "ROS")
;;//! \htmlinclude OnLineState.msg.html


(defclass segment::OnLineState
  :super ros::object
  :slots (_decv_id _decv_state ))

(defmethod segment::OnLineState
  (:init
   (&key
    ((:decv_id __decv_id) 0)
    ((:decv_state __decv_state) 0)
    )
   (send-super :init)
   (setq _decv_id (round __decv_id))
   (setq _decv_state (round __decv_state))
   self)
  (:decv_id
   (&optional __decv_id)
   (if __decv_id (setq _decv_id __decv_id)) _decv_id)
  (:decv_state
   (&optional __decv_state)
   (if __decv_state (setq _decv_state __decv_state)) _decv_state)
  (:serialization-length
   ()
   (+
    ;; int32 _decv_id
    4
    ;; int32 _decv_state
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _decv_id
       (write-long _decv_id s)
     ;; int32 _decv_state
       (write-long _decv_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _decv_id
     (setq _decv_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _decv_state
     (setq _decv_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get segment::OnLineState :md5sum-) "269526fcf5c8a42805d9b626dbe6c55d")
(setf (get segment::OnLineState :datatype-) "segment/OnLineState")
(setf (get segment::OnLineState :definition-)
      "int32  decv_id
int32  decv_state
")



(provide :segment/OnLineState "269526fcf5c8a42805d9b626dbe6c55d")


