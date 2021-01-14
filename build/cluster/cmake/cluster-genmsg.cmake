# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cluster: 8 messages, 0 services")

set(MSG_I_FLAGS "-Icluster:/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cluster_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg" NAME_WE)
add_custom_target(_cluster_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cluster" "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg" ""
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg" NAME_WE)
add_custom_target(_cluster_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cluster" "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg" ""
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg" NAME_WE)
add_custom_target(_cluster_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cluster" "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg" ""
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg" NAME_WE)
add_custom_target(_cluster_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cluster" "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg" "cluster/Center:cluster/Object:std_msgs/Header:cluster/Rotate"
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg" NAME_WE)
add_custom_target(_cluster_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cluster" "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg" "cluster/PointXYZI:cluster/ObstPointCloud:std_msgs/Header"
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg" NAME_WE)
add_custom_target(_cluster_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cluster" "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg" ""
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg" NAME_WE)
add_custom_target(_cluster_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cluster" "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg" "cluster/PointXYZI:std_msgs/Header"
)

get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg" NAME_WE)
add_custom_target(_cluster_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cluster" "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg" "cluster/Center:cluster/Rotate"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
)
_generate_msg_cpp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
)
_generate_msg_cpp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
)
_generate_msg_cpp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
)
_generate_msg_cpp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
)
_generate_msg_cpp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
)
_generate_msg_cpp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
)
_generate_msg_cpp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
)

### Generating Services

### Generating Module File
_generate_module_cpp(cluster
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cluster_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cluster_generate_messages cluster_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg" NAME_WE)
add_dependencies(cluster_generate_messages_cpp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg" NAME_WE)
add_dependencies(cluster_generate_messages_cpp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg" NAME_WE)
add_dependencies(cluster_generate_messages_cpp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg" NAME_WE)
add_dependencies(cluster_generate_messages_cpp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg" NAME_WE)
add_dependencies(cluster_generate_messages_cpp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg" NAME_WE)
add_dependencies(cluster_generate_messages_cpp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(cluster_generate_messages_cpp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg" NAME_WE)
add_dependencies(cluster_generate_messages_cpp _cluster_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cluster_gencpp)
add_dependencies(cluster_gencpp cluster_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cluster_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
)
_generate_msg_eus(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
)
_generate_msg_eus(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
)
_generate_msg_eus(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
)
_generate_msg_eus(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
)
_generate_msg_eus(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
)
_generate_msg_eus(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
)
_generate_msg_eus(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
)

### Generating Services

### Generating Module File
_generate_module_eus(cluster
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(cluster_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(cluster_generate_messages cluster_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg" NAME_WE)
add_dependencies(cluster_generate_messages_eus _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg" NAME_WE)
add_dependencies(cluster_generate_messages_eus _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg" NAME_WE)
add_dependencies(cluster_generate_messages_eus _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg" NAME_WE)
add_dependencies(cluster_generate_messages_eus _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg" NAME_WE)
add_dependencies(cluster_generate_messages_eus _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg" NAME_WE)
add_dependencies(cluster_generate_messages_eus _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(cluster_generate_messages_eus _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg" NAME_WE)
add_dependencies(cluster_generate_messages_eus _cluster_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cluster_geneus)
add_dependencies(cluster_geneus cluster_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cluster_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
)
_generate_msg_lisp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
)
_generate_msg_lisp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
)
_generate_msg_lisp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
)
_generate_msg_lisp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
)
_generate_msg_lisp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
)
_generate_msg_lisp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
)
_generate_msg_lisp(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
)

### Generating Services

### Generating Module File
_generate_module_lisp(cluster
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cluster_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cluster_generate_messages cluster_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg" NAME_WE)
add_dependencies(cluster_generate_messages_lisp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg" NAME_WE)
add_dependencies(cluster_generate_messages_lisp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg" NAME_WE)
add_dependencies(cluster_generate_messages_lisp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg" NAME_WE)
add_dependencies(cluster_generate_messages_lisp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg" NAME_WE)
add_dependencies(cluster_generate_messages_lisp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg" NAME_WE)
add_dependencies(cluster_generate_messages_lisp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(cluster_generate_messages_lisp _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg" NAME_WE)
add_dependencies(cluster_generate_messages_lisp _cluster_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cluster_genlisp)
add_dependencies(cluster_genlisp cluster_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cluster_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
)
_generate_msg_nodejs(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
)
_generate_msg_nodejs(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
)
_generate_msg_nodejs(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
)
_generate_msg_nodejs(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
)
_generate_msg_nodejs(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
)
_generate_msg_nodejs(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
)
_generate_msg_nodejs(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
)

### Generating Services

### Generating Module File
_generate_module_nodejs(cluster
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(cluster_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(cluster_generate_messages cluster_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg" NAME_WE)
add_dependencies(cluster_generate_messages_nodejs _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg" NAME_WE)
add_dependencies(cluster_generate_messages_nodejs _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg" NAME_WE)
add_dependencies(cluster_generate_messages_nodejs _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg" NAME_WE)
add_dependencies(cluster_generate_messages_nodejs _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg" NAME_WE)
add_dependencies(cluster_generate_messages_nodejs _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg" NAME_WE)
add_dependencies(cluster_generate_messages_nodejs _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(cluster_generate_messages_nodejs _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg" NAME_WE)
add_dependencies(cluster_generate_messages_nodejs _cluster_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cluster_gennodejs)
add_dependencies(cluster_gennodejs cluster_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cluster_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
)
_generate_msg_py(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
)
_generate_msg_py(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
)
_generate_msg_py(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
)
_generate_msg_py(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
)
_generate_msg_py(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
)
_generate_msg_py(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
)
_generate_msg_py(cluster
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg"
  "${MSG_I_FLAGS}"
  "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg;/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
)

### Generating Services

### Generating Module File
_generate_module_py(cluster
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cluster_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cluster_generate_messages cluster_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Center.msg" NAME_WE)
add_dependencies(cluster_generate_messages_py _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/PointXYZI.msg" NAME_WE)
add_dependencies(cluster_generate_messages_py _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Heart.msg" NAME_WE)
add_dependencies(cluster_generate_messages_py _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Cluster.msg" NAME_WE)
add_dependencies(cluster_generate_messages_py _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstSet.msg" NAME_WE)
add_dependencies(cluster_generate_messages_py _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Rotate.msg" NAME_WE)
add_dependencies(cluster_generate_messages_py _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/ObstPointCloud.msg" NAME_WE)
add_dependencies(cluster_generate_messages_py _cluster_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/sky1/Desktop/rslidar_perception_ws_with_registration_1114_V3/src/cluster/msg/Object.msg" NAME_WE)
add_dependencies(cluster_generate_messages_py _cluster_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cluster_genpy)
add_dependencies(cluster_genpy cluster_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cluster_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cluster
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(cluster_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cluster
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(cluster_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cluster
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(cluster_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cluster
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(cluster_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cluster
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(cluster_generate_messages_py std_msgs_generate_messages_py)
endif()
