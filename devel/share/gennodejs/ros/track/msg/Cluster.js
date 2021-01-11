// Auto-generated. Do not edit!

// (in-package track.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Object = require('./Object.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Cluster {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.object = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('object')) {
        this.object = initObj.object
      }
      else {
        this.object = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Cluster
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [object]
    // Serialize the length for message field [object]
    bufferOffset = _serializer.uint32(obj.object.length, buffer, bufferOffset);
    obj.object.forEach((val) => {
      bufferOffset = Object.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Cluster
    let len;
    let data = new Cluster(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [object]
    // Deserialize array length for message field [object]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.object = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.object[i] = Object.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 60 * object.object.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'track/Cluster';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'caa5c8e9c573fee9956145ca244932b2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header           header
    Object[]           object
    
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
    MSG: track/Object
    int32  id
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Cluster(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.object !== undefined) {
      resolved.object = new Array(msg.object.length);
      for (let i = 0; i < resolved.object.length; ++i) {
        resolved.object[i] = Object.Resolve(msg.object[i]);
      }
    }
    else {
      resolved.object = []
    }

    return resolved;
    }
};

module.exports = Cluster;
