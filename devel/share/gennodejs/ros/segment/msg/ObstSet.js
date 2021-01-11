// Auto-generated. Do not edit!

// (in-package segment.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ObstPointCloud = require('./ObstPointCloud.js');

//-----------------------------------------------------------

class ObstSet {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obsts = null;
    }
    else {
      if (initObj.hasOwnProperty('obsts')) {
        this.obsts = initObj.obsts
      }
      else {
        this.obsts = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstSet
    // Serialize message field [obsts]
    // Serialize the length for message field [obsts]
    bufferOffset = _serializer.uint32(obj.obsts.length, buffer, bufferOffset);
    obj.obsts.forEach((val) => {
      bufferOffset = ObstPointCloud.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstSet
    let len;
    let data = new ObstSet(null);
    // Deserialize message field [obsts]
    // Deserialize array length for message field [obsts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obsts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obsts[i] = ObstPointCloud.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.obsts.forEach((val) => {
      length += ObstPointCloud.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segment/ObstSet';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6dccf9553cd681203dcea38a70f25c51';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ObstPointCloud[]  obsts
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstSet(null);
    if (msg.obsts !== undefined) {
      resolved.obsts = new Array(msg.obsts.length);
      for (let i = 0; i < resolved.obsts.length; ++i) {
        resolved.obsts[i] = ObstPointCloud.Resolve(msg.obsts[i]);
      }
    }
    else {
      resolved.obsts = []
    }

    return resolved;
    }
};

module.exports = ObstSet;
