# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "segment: 9 messages, 0 services")

set(MSG_I_FLAGS "-Isegment:/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(segment_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg" NAME_WE)
add_custom_target(_segment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segment" "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg" ""
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg" NAME_WE)
add_custom_target(_segment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segment" "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg" ""
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg" NAME_WE)
add_custom_target(_segment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segment" "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg" "segment/Rotate:std_msgs/Header:segment/Object:segment/Center"
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg" NAME_WE)
add_custom_target(_segment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segment" "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg" ""
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg" NAME_WE)
add_custom_target(_segment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segment" "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg" "segment/PointXYZI:std_msgs/Header"
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg" NAME_WE)
add_custom_target(_segment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segment" "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg" ""
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg" NAME_WE)
add_custom_target(_segment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segment" "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg" ""
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg" NAME_WE)
add_custom_target(_segment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segment" "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg" "segment/Rotate:segment/Center"
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg" NAME_WE)
add_custom_target(_segment_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "segment" "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg" "segment/PointXYZI:std_msgs/Header:segment/ObstPointCloud"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
)
_generate_msg_cpp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
)
_generate_msg_cpp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
)
_generate_msg_cpp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
)
_generate_msg_cpp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
)
_generate_msg_cpp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
)
_generate_msg_cpp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
)
_generate_msg_cpp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
)
_generate_msg_cpp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
)

### Generating Services

### Generating Module File
_generate_module_cpp(segment
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(segment_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(segment_generate_messages segment_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg" NAME_WE)
add_dependencies(segment_generate_messages_cpp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg" NAME_WE)
add_dependencies(segment_generate_messages_cpp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg" NAME_WE)
add_dependencies(segment_generate_messages_cpp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg" NAME_WE)
add_dependencies(segment_generate_messages_cpp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(segment_generate_messages_cpp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg" NAME_WE)
add_dependencies(segment_generate_messages_cpp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg" NAME_WE)
add_dependencies(segment_generate_messages_cpp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg" NAME_WE)
add_dependencies(segment_generate_messages_cpp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg" NAME_WE)
add_dependencies(segment_generate_messages_cpp _segment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segment_gencpp)
add_dependencies(segment_gencpp segment_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segment_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
)
_generate_msg_eus(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
)
_generate_msg_eus(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
)
_generate_msg_eus(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
)
_generate_msg_eus(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
)
_generate_msg_eus(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
)
_generate_msg_eus(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
)
_generate_msg_eus(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
)
_generate_msg_eus(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
)

### Generating Services

### Generating Module File
_generate_module_eus(segment
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(segment_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(segment_generate_messages segment_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg" NAME_WE)
add_dependencies(segment_generate_messages_eus _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg" NAME_WE)
add_dependencies(segment_generate_messages_eus _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg" NAME_WE)
add_dependencies(segment_generate_messages_eus _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg" NAME_WE)
add_dependencies(segment_generate_messages_eus _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(segment_generate_messages_eus _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg" NAME_WE)
add_dependencies(segment_generate_messages_eus _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg" NAME_WE)
add_dependencies(segment_generate_messages_eus _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg" NAME_WE)
add_dependencies(segment_generate_messages_eus _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg" NAME_WE)
add_dependencies(segment_generate_messages_eus _segment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segment_geneus)
add_dependencies(segment_geneus segment_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segment_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
)
_generate_msg_lisp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
)
_generate_msg_lisp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
)
_generate_msg_lisp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
)
_generate_msg_lisp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
)
_generate_msg_lisp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
)
_generate_msg_lisp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
)
_generate_msg_lisp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
)
_generate_msg_lisp(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
)

### Generating Services

### Generating Module File
_generate_module_lisp(segment
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(segment_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(segment_generate_messages segment_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg" NAME_WE)
add_dependencies(segment_generate_messages_lisp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg" NAME_WE)
add_dependencies(segment_generate_messages_lisp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg" NAME_WE)
add_dependencies(segment_generate_messages_lisp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg" NAME_WE)
add_dependencies(segment_generate_messages_lisp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(segment_generate_messages_lisp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg" NAME_WE)
add_dependencies(segment_generate_messages_lisp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg" NAME_WE)
add_dependencies(segment_generate_messages_lisp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg" NAME_WE)
add_dependencies(segment_generate_messages_lisp _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg" NAME_WE)
add_dependencies(segment_generate_messages_lisp _segment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segment_genlisp)
add_dependencies(segment_genlisp segment_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segment_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
)
_generate_msg_nodejs(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
)
_generate_msg_nodejs(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
)
_generate_msg_nodejs(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
)
_generate_msg_nodejs(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
)
_generate_msg_nodejs(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
)
_generate_msg_nodejs(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
)
_generate_msg_nodejs(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
)
_generate_msg_nodejs(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
)

### Generating Services

### Generating Module File
_generate_module_nodejs(segment
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(segment_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(segment_generate_messages segment_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg" NAME_WE)
add_dependencies(segment_generate_messages_nodejs _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg" NAME_WE)
add_dependencies(segment_generate_messages_nodejs _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg" NAME_WE)
add_dependencies(segment_generate_messages_nodejs _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg" NAME_WE)
add_dependencies(segment_generate_messages_nodejs _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(segment_generate_messages_nodejs _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg" NAME_WE)
add_dependencies(segment_generate_messages_nodejs _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg" NAME_WE)
add_dependencies(segment_generate_messages_nodejs _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg" NAME_WE)
add_dependencies(segment_generate_messages_nodejs _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg" NAME_WE)
add_dependencies(segment_generate_messages_nodejs _segment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segment_gennodejs)
add_dependencies(segment_gennodejs segment_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segment_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
)
_generate_msg_py(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
)
_generate_msg_py(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
)
_generate_msg_py(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
)
_generate_msg_py(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
)
_generate_msg_py(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
)
_generate_msg_py(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
)
_generate_msg_py(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
)
_generate_msg_py(segment
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg;/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
)

### Generating Services

### Generating Module File
_generate_module_py(segment
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(segment_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(segment_generate_messages segment_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/PointXYZI.msg" NAME_WE)
add_dependencies(segment_generate_messages_py _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/OnLineState.msg" NAME_WE)
add_dependencies(segment_generate_messages_py _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Cluster.msg" NAME_WE)
add_dependencies(segment_generate_messages_py _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Rotate.msg" NAME_WE)
add_dependencies(segment_generate_messages_py _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(segment_generate_messages_py _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Center.msg" NAME_WE)
add_dependencies(segment_generate_messages_py _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Heart.msg" NAME_WE)
add_dependencies(segment_generate_messages_py _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/Object.msg" NAME_WE)
add_dependencies(segment_generate_messages_py _segment_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_0106_V1/src/segment/msg/ObstSet.msg" NAME_WE)
add_dependencies(segment_generate_messages_py _segment_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(segment_genpy)
add_dependencies(segment_genpy segment_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS segment_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/segment
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(segment_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/segment
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(segment_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/segment
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(segment_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/segment
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(segment_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/segment
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(segment_generate_messages_py std_msgs_generate_messages_py)
endif()
