// Auto-generated. Do not edit!

// (in-package segment.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class OnLineState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.decv_id = null;
      this.decv_state = null;
    }
    else {
      if (initObj.hasOwnProperty('decv_id')) {
        this.decv_id = initObj.decv_id
      }
      else {
        this.decv_id = 0;
      }
      if (initObj.hasOwnProperty('decv_state')) {
        this.decv_state = initObj.decv_state
      }
      else {
        this.decv_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OnLineState
    // Serialize message field [decv_id]
    bufferOffset = _serializer.int32(obj.decv_id, buffer, bufferOffset);
    // Serialize message field [decv_state]
    bufferOffset = _serializer.int32(obj.decv_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OnLineState
    let len;
    let data = new OnLineState(null);
    // Deserialize message field [decv_id]
    data.decv_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [decv_state]
    data.decv_state = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segment/OnLineState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '269526fcf5c8a42805d9b626dbe6c55d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32  decv_id
    int32  decv_state
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OnLineState(null);
    if (msg.decv_id !== undefined) {
      resolved.decv_id = msg.decv_id;
    }
    else {
      resolved.decv_id = 0
    }

    if (msg.decv_state !== undefined) {
      resolved.decv_state = msg.decv_state;
    }
    else {
      resolved.decv_state = 0
    }

    return resolved;
    }
};

module.exports = OnLineState;
