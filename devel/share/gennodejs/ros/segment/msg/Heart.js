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

class Heart {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.process_id = null;
      this.process_name = null;
    }
    else {
      if (initObj.hasOwnProperty('process_id')) {
        this.process_id = initObj.process_id
      }
      else {
        this.process_id = 0;
      }
      if (initObj.hasOwnProperty('process_name')) {
        this.process_name = initObj.process_name
      }
      else {
        this.process_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Heart
    // Serialize message field [process_id]
    bufferOffset = _serializer.int32(obj.process_id, buffer, bufferOffset);
    // Serialize message field [process_name]
    bufferOffset = _serializer.string(obj.process_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Heart
    let len;
    let data = new Heart(null);
    // Deserialize message field [process_id]
    data.process_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [process_name]
    data.process_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.process_name.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'segment/Heart';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '718b78ec4cfdf2ec3139a2f37b006d8e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32  process_id
    string process_name
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Heart(null);
    if (msg.process_id !== undefined) {
      resolved.process_id = msg.process_id;
    }
    else {
      resolved.process_id = 0
    }

    if (msg.process_name !== undefined) {
      resolved.process_name = msg.process_name;
    }
    else {
      resolved.process_name = ''
    }

    return resolved;
    }
};

module.exports = Heart;
