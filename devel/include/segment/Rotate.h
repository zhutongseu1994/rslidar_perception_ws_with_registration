// Generated by gencpp from file segment/Rotate.msg
// DO NOT EDIT!


#ifndef SEGMENT_MESSAGE_ROTATE_H
#define SEGMENT_MESSAGE_ROTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace segment
{
template <class ContainerAllocator>
struct Rotate_
{
  typedef Rotate_<ContainerAllocator> Type;

  Rotate_()
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , w(0.0)  {
    }
  Rotate_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , w(0.0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _z_type;
  _z_type z;

   typedef float _w_type;
  _w_type w;





  typedef boost::shared_ptr< ::segment::Rotate_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::segment::Rotate_<ContainerAllocator> const> ConstPtr;

}; // struct Rotate_

typedef ::segment::Rotate_<std::allocator<void> > Rotate;

typedef boost::shared_ptr< ::segment::Rotate > RotatePtr;
typedef boost::shared_ptr< ::segment::Rotate const> RotateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::segment::Rotate_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::segment::Rotate_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace segment

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'segment': ['/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::segment::Rotate_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::segment::Rotate_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::segment::Rotate_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::segment::Rotate_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::segment::Rotate_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::segment::Rotate_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::segment::Rotate_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c3a70de85a9dd451c31fa86cab10a939";
  }

  static const char* value(const ::segment::Rotate_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc3a70de85a9dd451ULL;
  static const uint64_t static_value2 = 0xc31fa86cab10a939ULL;
};

template<class ContainerAllocator>
struct DataType< ::segment::Rotate_<ContainerAllocator> >
{
  static const char* value()
  {
    return "segment/Rotate";
  }

  static const char* value(const ::segment::Rotate_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::segment::Rotate_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x\n\
float32 y\n\
float32 z\n\
float32 w\n\
";
  }

  static const char* value(const ::segment::Rotate_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::segment::Rotate_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.w);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Rotate_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::segment::Rotate_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::segment::Rotate_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<float>::stream(s, indent + "  ", v.z);
    s << indent << "w: ";
    Printer<float>::stream(s, indent + "  ", v.w);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SEGMENT_MESSAGE_ROTATE_H
