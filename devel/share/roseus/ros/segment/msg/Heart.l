;; Auto-generated. Do not edit!


(when (boundp 'segment::Heart)
  (if (not (find-package "SEGMENT"))
    (make-package "SEGMENT"))
  (shadow 'Heart (find-package "SEGMENT")))
(unless (find-package "SEGMENT::HEART")
  (make-package "SEGMENT::HEART"))

(in-package "ROS")
;;//! \htmlinclude Heart.msg.html


(defclass segment::Heart
  :super ros::object
  :slots (_process_id _process_name ))

(defmethod segment::Heart
  (:init
   (&key
    ((:process_id __process_id) 0)
    ((:process_name __process_name) "")
    )
   (send-super :init)
   (setq _process_id (round __process_id))
   (setq _process_name (string __process_name))
   self)
  (:process_id
   (&optional __process_id)
   (if __process_id (setq _process_id __process_id)) _process_id)
  (:process_name
   (&optional __process_name)
   (if __process_name (setq _process_name __process_name)) _process_name)
  (:serialization-length
   ()
   (+
    ;; int32 _process_id
    4
    ;; string _process_name
    4 (length _process_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _process_id
       (write-long _process_id s)
     ;; string _process_name
       (write-long (length _process_name) s) (princ _process_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _process_id
     (setq _process_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _process_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _process_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get segment::Heart :md5sum-) "718b78ec4cfdf2ec3139a2f37b006d8e")
(setf (get segment::Heart :datatype-) "segment/Heart")
(setf (get segment::Heart :definition-)
      "int32  process_id
string process_name
")



(provide :segment/Heart "718b78ec4cfdf2ec3139a2f37b006d8e")


