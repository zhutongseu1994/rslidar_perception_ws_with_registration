// Generated by gencpp from file track/Tk_State.msg
// DO NOT EDIT!


#ifndef TRACK_MESSAGE_TK_STATE_H
#define TRACK_MESSAGE_TK_STATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace track
{
template <class ContainerAllocator>
struct Tk_State_
{
  typedef Tk_State_<ContainerAllocator> Type;

  Tk_State_()
    : time_stamp_1(0)
    , roll(0.0)
    , pitch(0.0)
    , yaw(0.0)
    , longitude(0.0)
    , latitude(0.0)
    , X(0.0)
    , Y(0.0)
    , wheel_angle(0)
    , velocity(0)
    , velocity_x(0.0)
    , velocity_y(0.0)  {
    }
  Tk_State_(const ContainerAllocator& _alloc)
    : time_stamp_1(0)
    , roll(0.0)
    , pitch(0.0)
    , yaw(0.0)
    , longitude(0.0)
    , latitude(0.0)
    , X(0.0)
    , Y(0.0)
    , wheel_angle(0)
    , velocity(0)
    , velocity_x(0.0)
    , velocity_y(0.0)  {
  (void)_alloc;
    }



   typedef int64_t _time_stamp_1_type;
  _time_stamp_1_type time_stamp_1;

   typedef float _roll_type;
  _roll_type roll;

   typedef float _pitch_type;
  _pitch_type pitch;

   typedef float _yaw_type;
  _yaw_type yaw;

   typedef double _longitude_type;
  _longitude_type longitude;

   typedef double _latitude_type;
  _latitude_type latitude;

   typedef float _X_type;
  _X_type X;

   typedef float _Y_type;
  _Y_type Y;

   typedef int32_t _wheel_angle_type;
  _wheel_angle_type wheel_angle;

   typedef int32_t _velocity_type;
  _velocity_type velocity;

   typedef float _velocity_x_type;
  _velocity_x_type velocity_x;

   typedef float _velocity_y_type;
  _velocity_y_type velocity_y;





  typedef boost::shared_ptr< ::track::Tk_State_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::track::Tk_State_<ContainerAllocator> const> ConstPtr;

}; // struct Tk_State_

typedef ::track::Tk_State_<std::allocator<void> > Tk_State;

typedef boost::shared_ptr< ::track::Tk_State > Tk_StatePtr;
typedef boost::shared_ptr< ::track::Tk_State const> Tk_StateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::track::Tk_State_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::track::Tk_State_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace track

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'track': ['/home/sky1/program/rslidar_perception_ws_with_registration_V2.1.5/src/track/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::track::Tk_State_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::track::Tk_State_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::track::Tk_State_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::track::Tk_State_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::track::Tk_State_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::track::Tk_State_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::track::Tk_State_<ContainerAllocator> >
{
  static const char* value()
  {
    return "42e44858c0db0a8de1fd497f35b6051e";
  }

  static const char* value(const ::track::Tk_State_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x42e44858c0db0a8dULL;
  static const uint64_t static_value2 = 0xe1fd497f35b6051eULL;
};

template<class ContainerAllocator>
struct DataType< ::track::Tk_State_<ContainerAllocator> >
{
  static const char* value()
  {
    return "track/Tk_State";
  }

  static const char* value(const ::track::Tk_State_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::track::Tk_State_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 time_stamp_1\n\
float32 roll\n\
float32 pitch\n\
float32 yaw   \n\
float64 longitude\n\
float64 latitude\n\
#float32 height\n\
float32 X\n\
float32 Y \n\
#int32 time_stamp_2\n\
int32 wheel_angle\n\
int32 velocity\n\
float32 velocity_x\n\
float32 velocity_y\n\
\n\
";
  }

  static const char* value(const ::track::Tk_State_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::track::Tk_State_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.time_stamp_1);
      stream.next(m.roll);
      stream.next(m.pitch);
      stream.next(m.yaw);
      stream.next(m.longitude);
      stream.next(m.latitude);
      stream.next(m.X);
      stream.next(m.Y);
      stream.next(m.wheel_angle);
      stream.next(m.velocity);
      stream.next(m.velocity_x);
      stream.next(m.velocity_y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Tk_State_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::track::Tk_State_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::track::Tk_State_<ContainerAllocator>& v)
  {
    s << indent << "time_stamp_1: ";
    Printer<int64_t>::stream(s, indent + "  ", v.time_stamp_1);
    s << indent << "roll: ";
    Printer<float>::stream(s, indent + "  ", v.roll);
    s << indent << "pitch: ";
    Printer<float>::stream(s, indent + "  ", v.pitch);
    s << indent << "yaw: ";
    Printer<float>::stream(s, indent + "  ", v.yaw);
    s << indent << "longitude: ";
    Printer<double>::stream(s, indent + "  ", v.longitude);
    s << indent << "latitude: ";
    Printer<double>::stream(s, indent + "  ", v.latitude);
    s << indent << "X: ";
    Printer<float>::stream(s, indent + "  ", v.X);
    s << indent << "Y: ";
    Printer<float>::stream(s, indent + "  ", v.Y);
    s << indent << "wheel_angle: ";
    Printer<int32_t>::stream(s, indent + "  ", v.wheel_angle);
    s << indent << "velocity: ";
    Printer<int32_t>::stream(s, indent + "  ", v.velocity);
    s << indent << "velocity_x: ";
    Printer<float>::stream(s, indent + "  ", v.velocity_x);
    s << indent << "velocity_y: ";
    Printer<float>::stream(s, indent + "  ", v.velocity_y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TRACK_MESSAGE_TK_STATE_H
