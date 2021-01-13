#ifndef _ICP_REGISTRATION_H_
#define _ICP_REGISTRATION_H_

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
        int getRegistrationFlag(void);
        int addPointCloud(CloudT::Ptr local_source, CloudT::Ptr local_target, CloudT::Ptr global_source);
        Eigen::Matrix4f getLocalTransformMatrix();
        Eigen::Matrix4f getGlobaltransformMatrix();
        void IcpRegistrationInit(skywell::Param *param);

    public:
        pthread_rwlock_t thread_rwlock;

    private:
        void registerPointCloudsUsingICP(CloudT::Ptr &source_cloud_ptr,
                                         CloudT::Ptr &target_cloud_ptr,
                                         CloudT::Ptr &result_cloud_ptr,
                                         Eigen::Matrix4f &pair_transform);

        void removeNan(pcl::PointCloud<pcl::PointXYZI>::Ptr &in,
                       pcl::PointCloud<pcl::PointXYZI>::Ptr &out);

        void removeClosePoints(double minx, double miny, double maxx, double maxy,
                               const pcl::PointCloud<pcl::PointXYZI>::Ptr in,
                               const pcl::PointCloud<pcl::PointXYZI>::Ptr out);

        void alignPointCloudsUsingICP(pcl::PointCloud<pcl::PointXYZI>::Ptr &source_cloud_ptr,
                                      pcl::PointCloud<pcl::PointXYZI>::Ptr &target_cloud_ptr,
                                      Eigen::Matrix4f &final_transform);

    private:
        skywell::Param *param_;
        int register_flag_;

        Eigen::Matrix4f rslidar_transform_ = Eigen::Matrix4f::Identity();
        Eigen::Matrix4f lslidar_transform_ = Eigen::Matrix4f::Identity();

        Eigen::Matrix4f rslidar_transform_instead_ = Eigen::Matrix4f::Identity();
        Eigen::Matrix4f lslidar_transform_instead_ = Eigen::Matrix4f::Identity();

        Eigen::Matrix4f last_rslidar_transform_ = Eigen::Matrix4f::Identity();
        Eigen::Matrix4f last_lslidar_transform_ = Eigen::Matrix4f::Identity();

        CloudT::Ptr rslidar_source_ptr_ = boost::make_shared<CloudT>();
        CloudT::Ptr rslidar_target_ptr_ = boost::make_shared<CloudT>();
        CloudT::Ptr lslidar_source_ptr_ = boost::make_shared<CloudT>();
    };
} // namespace skywell

#endif
