// Generated by gencpp from file track/Center.msg
// DO NOT EDIT!


#ifndef TRACK_MESSAGE_CENTER_H
#define TRACK_MESSAGE_CENTER_H


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
struct Center_
{
  typedef Center_<ContainerAllocator> Type;

  Center_()
    : pos()  {
      pos.assign(0.0);
  }
  Center_(const ContainerAllocator& _alloc)
    : pos()  {
  (void)_alloc;
      pos.assign(0.0);
  }



   typedef boost::array<float, 3>  _pos_type;
  _pos_type pos;





  typedef boost::shared_ptr< ::track::Center_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::track::Center_<ContainerAllocator> const> ConstPtr;

}; // struct Center_

typedef ::track::Center_<std::allocator<void> > Center;

typedef boost::shared_ptr< ::track::Center > CenterPtr;
typedef boost::shared_ptr< ::track::Center const> CenterConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::track::Center_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::track::Center_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::track::Center_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::track::Center_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::track::Center_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::track::Center_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::track::Center_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::track::Center_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::track::Center_<ContainerAllocator> >
{
  static const char* value()
  {
    return "223306f6c142640d35d04c4629b6586f";
  }

  static const char* value(const ::track::Center_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x223306f6c142640dULL;
  static const uint64_t static_value2 = 0x35d04c4629b6586fULL;
};

template<class ContainerAllocator>
struct DataType< ::track::Center_<ContainerAllocator> >
{
  static const char* value()
  {
    return "track/Center";
  }

  static const char* value(const ::track::Center_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::track::Center_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[3] pos\n\
";
  }

  static const char* value(const ::track::Center_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::track::Center_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pos);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Center_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::track::Center_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::track::Center_<ContainerAllocator>& v)
  {
    s << indent << "pos[]" << std::endl;
    for (size_t i = 0; i < v.pos.size(); ++i)
    {
      s << indent << "  pos[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.pos[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TRACK_MESSAGE_CENTER_H
