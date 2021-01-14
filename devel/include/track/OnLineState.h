// Generated by gencpp from file track/OnLineState.msg
// DO NOT EDIT!


#ifndef TRACK_MESSAGE_ONLINESTATE_H
#define TRACK_MESSAGE_ONLINESTATE_H


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
struct OnLineState_
{
  typedef OnLineState_<ContainerAllocator> Type;

  OnLineState_()
    : decv_id(0)
    , decv_state(0)  {
    }
  OnLineState_(const ContainerAllocator& _alloc)
    : decv_id(0)
    , decv_state(0)  {
  (void)_alloc;
    }



   typedef int32_t _decv_id_type;
  _decv_id_type decv_id;

   typedef int32_t _decv_state_type;
  _decv_state_type decv_state;





  typedef boost::shared_ptr< ::track::OnLineState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::track::OnLineState_<ContainerAllocator> const> ConstPtr;

}; // struct OnLineState_

typedef ::track::OnLineState_<std::allocator<void> > OnLineState;

typedef boost::shared_ptr< ::track::OnLineState > OnLineStatePtr;
typedef boost::shared_ptr< ::track::OnLineState const> OnLineStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::track::OnLineState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::track::OnLineState_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace track

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'track': ['/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/track/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::track::OnLineState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::track::OnLineState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::track::OnLineState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::track::OnLineState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::track::OnLineState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::track::OnLineState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::track::OnLineState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "269526fcf5c8a42805d9b626dbe6c55d";
  }

  static const char* value(const ::track::OnLineState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x269526fcf5c8a428ULL;
  static const uint64_t static_value2 = 0x05d9b626dbe6c55dULL;
};

template<class ContainerAllocator>
struct DataType< ::track::OnLineState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "track/OnLineState";
  }

  static const char* value(const ::track::OnLineState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::track::OnLineState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32  decv_id\n\
int32  decv_state\n\
";
  }

  static const char* value(const ::track::OnLineState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::track::OnLineState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.decv_id);
      stream.next(m.decv_state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct OnLineState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::track::OnLineState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::track::OnLineState_<ContainerAllocator>& v)
  {
    s << indent << "decv_id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.decv_id);
    s << indent << "decv_state: ";
    Printer<int32_t>::stream(s, indent + "  ", v.decv_state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TRACK_MESSAGE_ONLINESTATE_H
