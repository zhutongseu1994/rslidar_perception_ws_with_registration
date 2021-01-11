#ifndef _REGISTRATION_H_
#define _REGISTRATION_H_

#include <stdio.h>
#include <stdlib.h>
#include <iostream>

#include <string>

#include <pcl/point_types.h>
#include <pcl/registration/icp.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/octree/octree.h>
#include <pcl/registration/icp_nl.h>
#include <pcl/registration/ndt.h>
#include <pcl/registration/transforms.h>
#include <pcl/filters/filter.h>
#include <pcl/filters/voxel_grid.h>
#include <boost/bind.hpp>
#include <vector>
#include <map>
#include "filter.h"
#include "param.h"

#include "thread.h"

typedef pcl::PointXYZI PointT;
typedef pcl::PointCloud<PointT> CloudT;

using namespace std;

namespace skywell
{
  class IcpRegistration : public Thread
  {
  public:
    IcpRegistration();
    ~IcpRegistration();

  public:
    int Process(void);
    int GetRegisterFlag(void);
    int addPairPointCloud(CloudT::Ptr local_source, CloudT::Ptr local_target);
    Eigen::Matrix4f get_local_transform_matrix();
    Eigen::Matrix4f get_global_transform_matrix();
    void Init(skywell::Param *param);

public:
    Eigen::Matrix4f pairTransform = Eigen::Matrix4f::Identity();
    Eigen::Matrix4f globalTransform = Eigen::Matrix4f::Identity();

public:
    pthread_rwlock_t thread_rwlock;

private:
    void icp_register_point_clouds(CloudT::Ptr &source_cloud_ptr,
                                   CloudT::Ptr &target_cloud_ptr,
                                   CloudT::Ptr &result_cloud_ptr,
                                   Eigen::Matrix4f &pairTransform);

    void ndt_register_point_clouds(CloudT::Ptr &source_cloud_ptr,
                                   CloudT::Ptr &target_cloud_ptr,
                                   CloudT::Ptr &result_cloud_ptr,
                                   Eigen::Matrix4f &init_pose,
                                   Eigen::Matrix4f &pairTransform);

    // 去除nan点
    void removeNan(pcl::PointCloud<pcl::PointXYZI>::Ptr &in,
                   pcl::PointCloud<pcl::PointXYZI>::Ptr &out);

    void remove_close_pt(double minx, double miny, double maxx, double maxy,
                         const pcl::PointCloud<pcl::PointXYZI>::Ptr in,
                         const pcl::PointCloud<pcl::PointXYZI>::Ptr out);

    void icpAlignPointClouds(pcl::PointCloud<pcl::PointXYZI>::Ptr &source_cloud_ptr,
                             pcl::PointCloud<pcl::PointXYZI>::Ptr &target_cloud_ptr,
                             Eigen::Matrix4f &final_transform);

    void ndtAlignPointClouds(pcl::PointCloud<pcl::PointXYZI>::Ptr &source_cloud_ptr,
                             pcl::PointCloud<pcl::PointXYZI>::Ptr &target_cloud_ptr,
                             Eigen::Matrix4f &init_pose,
                             Eigen::Matrix4f &final_transform);

private:
    skywell::Param *m_param;
    int registerflag;
    Eigen::Matrix4f pairTransform_ = Eigen::Matrix4f::Identity();
    Eigen::Matrix4f globalTransform_ = Eigen::Matrix4f::Identity();
    CloudT::Ptr local_source_ptr = boost::make_shared<CloudT>();
    CloudT::Ptr local_target_ptr = boost::make_shared<CloudT>();
    CloudT::Ptr global_source_ptr = boost::make_shared<CloudT>();
  };
} // namespace skywell

#endif
