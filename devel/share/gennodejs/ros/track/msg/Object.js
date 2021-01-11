// Auto-generated. Do not edit!

// (in-package track.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Center = require('./Center.js');
let Rotate = require('./Rotate.js');

//-----------------------------------------------------------

class Object {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.center = null;
      this.length = null;
      this.width = null;
      this.height = null;
      this.speedx = null;
      this.speedy = null;
      this.slope = null;
      this.weights = null;
      this.rotate = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new Center();
      }
      if (initObj.hasOwnProperty('length')) {
        this.length = initObj.length
      }
      else {
        this.length = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('speedx')) {
        this.speedx = initObj.speedx
      }
      else {
        this.speedx = 0.0;
      }
      if (initObj.hasOwnProperty('speedy')) {
        this.speedy = initObj.speedy
      }
      else {
        this.speedy = 0.0;
      }
      if (initObj.hasOwnProperty('slope')) {
        this.slope = initObj.slope
      }
      else {
        this.slope = 0.0;
      }
      if (initObj.hasOwnProperty('weights')) {
        this.weights = initObj.weights
      }
      else {
        this.weights = 0.0;
      }
      if (initObj.hasOwnProperty('rotate')) {
        this.rotate = initObj.rotate
      }
      else {
        this.rotate = new Rotate();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Object
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [center]
    bufferOffset = Center.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [length]
    bufferOffset = _serializer.float32(obj.length, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [speedx]
    bufferOffset = _serializer.float32(obj.speedx, buffer, bufferOffset);
    // Serialize message field [speedy]
    bufferOffset = _serializer.float32(obj.speedy, buffer, bufferOffset);
    // Serialize message field [slope]
    bufferOffset = _serializer.float32(obj.slope, buffer, bufferOffset);
    // Serialize message field [weights]
    bufferOffset = _serializer.float32(obj.weights, buffer, bufferOffset);
    // Serialize message field [rotate]
    bufferOffset = Rotate.serialize(obj.rotate, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Object
    let len;
    let data = new Object(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [center]
    data.center = Center.deserialize(buffer, bufferOffset);
    // Deserialize message field [length]
    data.length = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speedx]
    data.speedx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speedy]
    data.speedy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [slope]
    data.slope = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [weights]
    data.weights = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rotate]
    data.rotate = Rotate.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 60;
  }

  static datatype() {
    // Returns string type for a message object
    return 'track/Object';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '57f4ef02c648ff1d44cba8fe8606a123';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Object(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.center !== undefined) {
      resolved.center = Center.Resolve(msg.center)
    }
    else {
      resolved.center = new Center()
    }

    if (msg.length !== undefined) {
      resolved.length = msg.length;
    }
    else {
      resolved.length = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.speedx !== undefined) {
      resolved.speedx = msg.speedx;
    }
    else {
      resolved.speedx = 0.0
    }

    if (msg.speedy !== undefined) {
      resolved.speedy = msg.speedy;
    }
    else {
      resolved.speedy = 0.0
    }

    if (msg.slope !== undefined) {
      resolved.slope = msg.slope;
    }
    else {
      resolved.slope = 0.0
    }

    if (msg.weights !== undefined) {
      resolved.weights = msg.weights;
    }
    else {
      resolved.weights = 0.0
    }

    if (msg.rotate !== undefined) {
      resolved.rotate = Rotate.Resolve(msg.rotate)
    }
    else {
      resolved.rotate = new Rotate()
    }

    return resolved;
    }
};

module.exports = Object;
