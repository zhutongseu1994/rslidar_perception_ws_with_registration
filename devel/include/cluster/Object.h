// Generated by gencpp from file cluster/Object.msg
// DO NOT EDIT!


#ifndef CLUSTER_MESSAGE_OBJECT_H
#define CLUSTER_MESSAGE_OBJECT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <cluster/Center.h>
#include <cluster/Rotate.h>

namespace cluster
{
template <class ContainerAllocator>
struct Object_
{
  typedef Object_<ContainerAllocator> Type;

  Object_()
    : id(0)
    , center()
    , width(0.0)
    , height(0.0)
    , depth(0.0)
    , speedx(0.0)
    , speedy(0.0)
    , k(0.0)
    , rotate()  {
    }
  Object_(const ContainerAllocator& _alloc)
    : id(0)
    , center(_alloc)
    , width(0.0)
    , height(0.0)
    , depth(0.0)
    , speedx(0.0)
    , speedy(0.0)
    , k(0.0)
    , rotate(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _id_type;
  _id_type id;

   typedef  ::cluster::Center_<ContainerAllocator>  _center_type;
  _center_type center;

   typedef float _width_type;
  _width_type width;

   typedef float _height_type;
  _height_type height;

   typedef float _depth_type;
  _depth_type depth;

   typedef float _speedx_type;
  _speedx_type speedx;

   typedef float _speedy_type;
  _speedy_type speedy;

   typedef float _k_type;
  _k_type k;

   typedef  ::cluster::Rotate_<ContainerAllocator>  _rotate_type;
  _rotate_type rotate;





  typedef boost::shared_ptr< ::cluster::Object_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cluster::Object_<ContainerAllocator> const> ConstPtr;

}; // struct Object_

typedef ::cluster::Object_<std::allocator<void> > Object;

typedef boost::shared_ptr< ::cluster::Object > ObjectPtr;
typedef boost::shared_ptr< ::cluster::Object const> ObjectConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cluster::Object_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cluster::Object_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace cluster

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'cluster': ['/home/sky1/program/rslidar_perception_ws_with_registration_V2.1.5/src/cluster/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::cluster::Object_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cluster::Object_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cluster::Object_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cluster::Object_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cluster::Object_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cluster::Object_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cluster::Object_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cc1c62817e5c1f9abba5f583e5d62982";
  }

  static const char* value(const ::cluster::Object_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcc1c62817e5c1f9aULL;
  static const uint64_t static_value2 = 0xbba5f583e5d62982ULL;
};

template<class ContainerAllocator>
struct DataType< ::cluster::Object_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cluster/Object";
  }

  static const char* value(const ::cluster::Object_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cluster::Object_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32  id\n\
Center center\n\
float32 width\n\
float32 height\n\
float32 depth\n\
float32 speedx\n\
float32 speedy\n\
float32 k\n\
Rotate  rotate\n\
================================================================================\n\
MSG: cluster/Center\n\
float32[3] pos\n\
================================================================================\n\
MSG: cluster/Rotate\n\
float32 x\n\
float32 y\n\
float32 z\n\
float32 w\n\
";
  }

  static const char* value(const ::cluster::Object_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cluster::Object_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.center);
      stream.next(m.width);
      stream.next(m.height);
      stream.next(m.depth);
      stream.next(m.speedx);
      stream.next(m.speedy);
      stream.next(m.k);
      stream.next(m.rotate);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Object_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cluster::Object_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cluster::Object_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.id);
    s << indent << "center: ";
    s << std::endl;
    Printer< ::cluster::Center_<ContainerAllocator> >::stream(s, indent + "  ", v.center);
    s << indent << "width: ";
    Printer<float>::stream(s, indent + "  ", v.width);
    s << indent << "height: ";
    Printer<float>::stream(s, indent + "  ", v.height);
    s << indent << "depth: ";
    Printer<float>::stream(s, indent + "  ", v.depth);
    s << indent << "speedx: ";
    Printer<float>::stream(s, indent + "  ", v.speedx);
    s << indent << "speedy: ";
    Printer<float>::stream(s, indent + "  ", v.speedy);
    s << indent << "k: ";
    Printer<float>::stream(s, indent + "  ", v.k);
    s << indent << "rotate: ";
    s << std::endl;
    Printer< ::cluster::Rotate_<ContainerAllocator> >::stream(s, indent + "  ", v.rotate);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CLUSTER_MESSAGE_OBJECT_H
