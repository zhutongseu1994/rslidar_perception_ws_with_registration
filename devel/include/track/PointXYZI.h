// Generated by gencpp from file track/PointXYZI.msg
// DO NOT EDIT!


#ifndef TRACK_MESSAGE_POINTXYZI_H
#define TRACK_MESSAGE_POINTXYZI_H


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
struct PointXYZI_
{
  typedef PointXYZI_<ContainerAllocator> Type;

  PointXYZI_()
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , intensity(0.0)  {
    }
  PointXYZI_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)
    , intensity(0.0)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _z_type;
  _z_type z;

   typedef float _intensity_type;
  _intensity_type intensity;





  typedef boost::shared_ptr< ::track::PointXYZI_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::track::PointXYZI_<ContainerAllocator> const> ConstPtr;

}; // struct PointXYZI_

typedef ::track::PointXYZI_<std::allocator<void> > PointXYZI;

typedef boost::shared_ptr< ::track::PointXYZI > PointXYZIPtr;
typedef boost::shared_ptr< ::track::PointXYZI const> PointXYZIConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::track::PointXYZI_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::track::PointXYZI_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace track

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'track': ['/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/track/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::track::PointXYZI_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::track::PointXYZI_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::track::PointXYZI_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::track::PointXYZI_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::track::PointXYZI_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::track::PointXYZI_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::track::PointXYZI_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e3893f0253ed1d070c8e1f3f175960c5";
  }

  static const char* value(const ::track::PointXYZI_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe3893f0253ed1d07ULL;
  static const uint64_t static_value2 = 0x0c8e1f3f175960c5ULL;
};

template<class ContainerAllocator>
struct DataType< ::track::PointXYZI_<ContainerAllocator> >
{
  static const char* value()
  {
    return "track/PointXYZI";
  }

  static const char* value(const ::track::PointXYZI_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::track::PointXYZI_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 x\n\
float32 y\n\
float32 z\n\
float32 intensity\n\
";
  }

  static const char* value(const ::track::PointXYZI_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::track::PointXYZI_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
      stream.next(m.intensity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PointXYZI_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::track::PointXYZI_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::track::PointXYZI_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<float>::stream(s, indent + "  ", v.z);
    s << indent << "intensity: ";
    Printer<float>::stream(s, indent + "  ", v.intensity);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TRACK_MESSAGE_POINTXYZI_H
