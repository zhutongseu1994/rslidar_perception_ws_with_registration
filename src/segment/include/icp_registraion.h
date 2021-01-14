/***********************************************************
 * @copyright Copyright (C), 2019-, skywell-mobility Tech. Co., Ltd.
 * @author ZhuTong(zhutong@skywell-mobility.com)
 * @version 1.0
 * @date 2021-01-14
 * @brief 点云实时配准头文件
 ***********************************************************/
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
        /***********************************************************
        * @brief 线程执行函数
        * @return int 
        ***********************************************************/
        int Process(void);

        /***********************************************************
         * @brief 获得配准状态
         * @return int 
        ***********************************************************/
        int getRegistrationFlag(void);

        /***********************************************************
         * @brief 有主雷达情况下添加配准的点云
         * @param[in]  local_source     补盲雷达源点云
         * @param[in]  local_target     补盲雷达目标点云
         * @param[in]  global_source    主雷达源点云
         * @return int 
        ***********************************************************/
        int addPointCloud(CloudT::Ptr local_source, CloudT::Ptr local_target, CloudT::Ptr global_source);

        /***********************************************************
         * @brief 无主雷达情况下添加配准的点云
         * @param[in]  local_source     补盲雷达源点云
         * @param[in]  local_target     补盲雷达目标点云
         * @return int 
        ***********************************************************/
        int addPointCloud(CloudT::Ptr local_source, CloudT::Ptr local_target);

        /***********************************************************
         * @brief 获得补盲雷达配准旋转矩阵
         * @return 旋转矩阵
        ***********************************************************/
        Eigen::Matrix4f getLocalTransformMatrix();

        /***********************************************************
         * @brief 获得主雷达配准旋转矩阵
         * @return 旋转矩阵 
        ***********************************************************/
        Eigen::Matrix4f getGlobaltransformMatrix();

        void IcpRegistrationInit(skywell::Param *param);

    public:
        pthread_rwlock_t thread_rwlock;

    private:
        /***********************************************************
         * @brief 点云配准准备操作(截取区域)及配准
         * @param[in]  source_cloud_ptr 配准源点云
         * @param[in]  target_cloud_ptr 配准目标点云
         * @param[out]  result_cloud_ptr 配准后的点云
         * @param[out]  pair_transform   旋转矩阵
        ***********************************************************/
        void registerPointCloudsUsingICP(CloudT::Ptr &source_cloud_ptr,
                                         CloudT::Ptr &target_cloud_ptr,
                                         CloudT::Ptr &result_cloud_ptr,
                                         Eigen::Matrix4f &pair_transform);

        /***********************************************************
         * @brief 去除nan点
         * @param[in]  in               输入点云指针
         * @param[out]  out              输出点云指针
        ***********************************************************/
        void removeNan(pcl::PointCloud<pcl::PointXYZI>::Ptr &in,
                       pcl::PointCloud<pcl::PointXYZI>::Ptr &out);

        /***********************************************************
         * @brief 截取区域点云
         * @param[in]  minx             截取区域最小x坐标
         * @param[in]  miny             截取区域最大x坐标
         * @param[in]  maxx             截取区域最小y坐标
         * @param[in]  maxy             截取区域最大y坐标
         * @param[in]  in               输入点云
         * @param[out] out              输出点云
        ***********************************************************/
        void removeClosePoints(double minx, double miny, double maxx, double maxy,
                               const pcl::PointCloud<pcl::PointXYZI>::Ptr in,
                               const pcl::PointCloud<pcl::PointXYZI>::Ptr out);

        /***********************************************************
         * @brief ICP配准算法
         * @param[in]  source_cloud_ptr 源点云
         * @param[in]  target_cloud_ptr 目标点云
         * @param[out]  final_transform  旋转矩阵
        ***********************************************************/
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
