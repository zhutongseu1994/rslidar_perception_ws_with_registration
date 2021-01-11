# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from cluster/Cluster.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import cluster.msg
import std_msgs.msg

class Cluster(genpy.Message):
  _md5sum = "0df4098de0532e6c85cb8bfaa96c32d9"
  _type = "cluster/Cluster"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header           header
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
MSG: cluster/Object
int32  id
Center center
float32 width
float32 height
float32 depth
float32 speedx
float32 speedy
float32 k
Rotate  rotate
================================================================================
MSG: cluster/Center
float32[3] pos
================================================================================
MSG: cluster/Rotate
float32 x
float32 y
float32 z
float32 w"""
  __slots__ = ['header','object']
  _slot_types = ['std_msgs/Header','cluster/Object[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,object

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Cluster, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.object is None:
        self.object = []
    else:
      self.header = std_msgs.msg.Header()
      self.object = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.object)
      buff.write(_struct_I.pack(length))
      for val1 in self.object:
        buff.write(_get_struct_i().pack(val1.id))
        _v1 = val1.center
        buff.write(_get_struct_3f().pack(*_v1.pos))
        _x = val1
        buff.write(_get_struct_6f().pack(_x.width, _x.height, _x.depth, _x.speedx, _x.speedy, _x.k))
        _v2 = val1.rotate
        _x = _v2
        buff.write(_get_struct_4f().pack(_x.x, _x.y, _x.z, _x.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.object is None:
        self.object = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.object = []
      for i in range(0, length):
        val1 = cluster.msg.Object()
        start = end
        end += 4
        (val1.id,) = _get_struct_i().unpack(str[start:end])
        _v3 = val1.center
        start = end
        end += 12
        _v3.pos = _get_struct_3f().unpack(str[start:end])
        _x = val1
        start = end
        end += 24
        (_x.width, _x.height, _x.depth, _x.speedx, _x.speedy, _x.k,) = _get_struct_6f().unpack(str[start:end])
        _v4 = val1.rotate
        _x = _v4
        start = end
        end += 16
        (_x.x, _x.y, _x.z, _x.w,) = _get_struct_4f().unpack(str[start:end])
        self.object.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.object)
      buff.write(_struct_I.pack(length))
      for val1 in self.object:
        buff.write(_get_struct_i().pack(val1.id))
        _v5 = val1.center
        buff.write(_v5.pos.tostring())
        _x = val1
        buff.write(_get_struct_6f().pack(_x.width, _x.height, _x.depth, _x.speedx, _x.speedy, _x.k))
        _v6 = val1.rotate
        _x = _v6
        buff.write(_get_struct_4f().pack(_x.x, _x.y, _x.z, _x.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.object is None:
        self.object = None
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.object = []
      for i in range(0, length):
        val1 = cluster.msg.Object()
        start = end
        end += 4
        (val1.id,) = _get_struct_i().unpack(str[start:end])
        _v7 = val1.center
        start = end
        end += 12
        _v7.pos = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=3)
        _x = val1
        start = end
        end += 24
        (_x.width, _x.height, _x.depth, _x.speedx, _x.speedy, _x.k,) = _get_struct_6f().unpack(str[start:end])
        _v8 = val1.rotate
        _x = _v8
        start = end
        end += 16
        (_x.x, _x.y, _x.z, _x.w,) = _get_struct_4f().unpack(str[start:end])
        self.object.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_i = None
def _get_struct_i():
    global _struct_i
    if _struct_i is None:
        _struct_i = struct.Struct("<i")
    return _struct_i
_struct_4f = None
def _get_struct_4f():
    global _struct_4f
    if _struct_4f is None:
        _struct_4f = struct.Struct("<4f")
    return _struct_4f
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_3f = None
def _get_struct_3f():
    global _struct_3f
    if _struct_3f is None:
        _struct_3f = struct.Struct("<3f")
    return _struct_3f
_struct_6f = None
def _get_struct_6f():
    global _struct_6f
    if _struct_6f is None:
        _struct_6f = struct.Struct("<6f")
    return _struct_6f
