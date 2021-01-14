/***********************************************************
 * @copyright Copyright (C), 2019-, skywell-mobility Tech. Co., Ltd.
 * @author ZhuTong(zhutong@skywell-mobility.com)
 * @version 1.0
 * @date 2021-01-14
 * @brief 点云实时配准
 ***********************************************************/
#include "icp_registraion.h"

namespace skywell
{
    IcpRegistration::IcpRegistration()
    {
        register_flag_ = 0;
        pthread_rwlock_init(&thread_rwlock, NULL);
    }

    IcpRegistration::~IcpRegistration()
    {
        pthread_rwlock_destroy(&thread_rwlock);
    }

    void IcpRegistration::IcpRegistrationInit(skywell::Param *param)
    {
        param_ = param;
    }

    /***********************************************************
     * @brief 有主雷达情况下添加配准的点云
     * @param[in]  local_source     补盲雷达源点云
     * @param[in]  local_target     补盲雷达目标点云
     * @param[in]  global_source    主雷达源点云
     * @return int 
    ***********************************************************/
    int IcpRegistration::addPointCloud(CloudT::Ptr local_source, CloudT::Ptr local_target, CloudT::Ptr global_source)
    {
        if (GetRunFlag() != 2)
        {
            rslidar_source_ptr_ = local_source;
            rslidar_target_ptr_ = local_target;
            lslidar_source_ptr_ = global_source;
            ThreadStart();
        }
        return 0;
    }

    /***********************************************************
     * @brief 无主雷达情况下添加配准的点云
     * @param[in]  local_source     补盲雷达源点云
     * @param[in]  local_target     补盲雷达目标点云
     * @return int 
     ***********************************************************/
    int IcpRegistration::addPointCloud(CloudT::Ptr local_source, CloudT::Ptr local_target)
    {
        if (GetRunFlag() != 2)
        {
            rslidar_source_ptr_ = local_source;
            rslidar_target_ptr_ = local_target;
            ThreadStart();
        }
        return 0;
    }

    /***********************************************************
     * @brief 点云配准准备操作(截取区域)及配准
     * @param[in]  source_cloud_ptr 配准源点云
     * @param[in]  target_cloud_ptr 配准目标点云
     * @param[out]  result_cloud_ptr 配准后的点云
     * @param[out]  pair_transform   旋转矩阵
    ***********************************************************/
    void IcpRegistration::registerPointCloudsUsingICP(CloudT::Ptr &source_cloud_ptr,
                                                      CloudT::Ptr &target_cloud_ptr,
                                                      CloudT::Ptr &result_cloud_ptr,
                                                      Eigen::Matrix4f &pair_transform)
    {
        // 去除nan点
        pcl::PointCloud<pcl::PointXYZI>::Ptr _source_remove_nan_ptr = boost::make_shared<CloudT>();
        removeNan(source_cloud_ptr, _source_remove_nan_ptr);
        //截取一部分源点云进行配准
        CloudT::Ptr _clip_region_source_cloud_ptr = boost::make_shared<CloudT>();
        removeClosePoints(param_->clip_region_min_x, param_->clip_region_min_y, param_->clip_region_max_x,
                          param_->clip_region_max_y, _source_remove_nan_ptr, _clip_region_source_cloud_ptr);

        // 去除nan点
        pcl::PointCloud<pcl::PointXYZI>::Ptr _target_remove_nan_ptr = boost::make_shared<CloudT>();
        removeNan(target_cloud_ptr, _target_remove_nan_ptr);
        //截取一部分目标点云进行配准
        CloudT::Ptr _clip_region_target_cloud_ptr = boost::make_shared<CloudT>();
        removeClosePoints(param_->clip_region_min_x, param_->clip_region_min_y, param_->clip_region_max_x,
                          param_->clip_region_max_y, _target_remove_nan_ptr, _clip_region_target_cloud_ptr);

        alignPointCloudsUsingICP(_clip_region_source_cloud_ptr, _clip_region_target_cloud_ptr, pair_transform);

        //把目标点云转换回源框架
        pcl::transformPointCloud(*target_cloud_ptr, *result_cloud_ptr, pair_transform);

        //添加源点云到转换目标
        *result_cloud_ptr += *source_cloud_ptr;
    }

    /***********************************************************
     * @brief 去除nan点
     * @param[in]  in               输入点云指针
     * @param[out]  out              输出点云指针
    ***********************************************************/
    void IcpRegistration::removeNan(pcl::PointCloud<pcl::PointXYZI>::Ptr &in, pcl::PointCloud<pcl::PointXYZI>::Ptr &out)
    {
        std::vector<int> _indices;
        pcl::removeNaNFromPointCloud(*in, *out, _indices);
    }

    /***********************************************************
     * @brief 截取区域点云
     * @param[in]  minx             截取区域最小x坐标
     * @param[in]  miny             截取区域最大x坐标
     * @param[in]  maxx             截取区域最小y坐标
     * @param[in]  maxy             截取区域最大y坐标
     * @param[in]  in               输入点云
     * @param[out] out              输出点云
    ***********************************************************/
    void IcpRegistration::removeClosePoints(double minx, double miny, double maxx, double maxy,
                                            const pcl::PointCloud<pcl::PointXYZI>::Ptr in,
                                            const pcl::PointCloud<pcl::PointXYZI>::Ptr out)
    {
        skywell::CropBoxFilter _crop;
        _crop.setMinP(minx, miny, -100.0);
        _crop.setMaxP(maxx, maxy, 100.0);
        _crop.setNegative(true);
        _crop.filter(in, out);
    }

    /***********************************************************
     * @brief ICP配准算法
     * @param[in]  source_cloud_ptr 源点云
     * @param[in]  target_cloud_ptr 目标点云
     * @param[out]  final_transform  旋转矩阵
    ***********************************************************/
    void IcpRegistration::alignPointCloudsUsingICP(pcl::PointCloud<pcl::PointXYZI>::Ptr &source_cloud_ptr,
                                                   pcl::PointCloud<pcl::PointXYZI>::Ptr &target_cloud_ptr,
                                                   Eigen::Matrix4f &final_transform)
    {
        pcl::IterativeClosestPointNonLinear<PointT, PointT>::Ptr _icp_ptr =
            boost::make_shared<pcl::IterativeClosestPointNonLinear<PointT, PointT>>();

        _icp_ptr->setTransformationEpsilon(param_->icp_transformation_epsilon);
        _icp_ptr->setMaxCorrespondenceDistance(param_->icp_max_correspondence_distance);
        _icp_ptr->setMaximumIterations(param_->icp_max_iterations);
        _icp_ptr->setEuclideanFitnessEpsilon(param_->icp_euclidean_fitness_epsilon);
        _icp_ptr->setInputCloud(source_cloud_ptr);
        _icp_ptr->setInputTarget(target_cloud_ptr);

        Eigen::Matrix4f _ti = Eigen::Matrix4f::Identity(), _prev, _target_to_source;
        pcl::PointCloud<pcl::PointXYZI>::Ptr _reg_result = source_cloud_ptr;
        for (int i = 0; i < param_->icp_optimized_iterations; ++i)
        {
            source_cloud_ptr = _reg_result;
            _icp_ptr->setInputCloud(source_cloud_ptr);
            _icp_ptr->align(*_reg_result);
            //在每一个迭代之间累积转换
            _ti = _icp_ptr->getFinalTransformation() * _ti;
            //如果这次转换和之前转换之间的差异小于阈值
            //则通过减小最大对应距离来改善程序
            if (fabs((_icp_ptr->getLastIncrementalTransformation() - _prev).sum()) < _icp_ptr->getTransformationEpsilon())
            {
                _icp_ptr->setMaxCorrespondenceDistance(_icp_ptr->getMaxCorrespondenceDistance() - 0.001);
            }
            _prev = _icp_ptr->getLastIncrementalTransformation();
        }
        // 得到目标点云到源点云的变换
        _target_to_source = _ti.inverse();
        final_transform = _target_to_source;
    }

    /***********************************************************
     * @brief 获得配准状态
     * @return int 
    ***********************************************************/
    int IcpRegistration::getRegistrationFlag(void)
    {
        int _r;
        //pthread_rwlock_rdlock(&thread_rwlock);
        _r = register_flag_;
        //pthread_rwlock_unlock(&thread_rwlock);
        return _r;
    }

    /***********************************************************
     * @brief 线程执行函数
     * @return int 
    ***********************************************************/
    int IcpRegistration::Process(void)
    {
        param_->loadcfg();

        CloudT::Ptr _rslidar_result_cloud_ptr = boost::make_shared<CloudT>();
        CloudT::Ptr _lslidar_result_cloud_ptr = boost::make_shared<CloudT>();

        //左补盲和右补盲雷达配准
        register_flag_ = 0;

        registerPointCloudsUsingICP(rslidar_source_ptr_, rslidar_target_ptr_, _rslidar_result_cloud_ptr, rslidar_transform_);
        cout << "rslidar_transform_in_icp_thread:\n"
             << rslidar_transform_.matrix() << endl;
        pthread_rwlock_trywrlock(&thread_rwlock);
        rslidar_transform_instead_ = rslidar_transform_;
        pthread_rwlock_unlock(&thread_rwlock);
        if (param_->need_global_registration)
        {
            registerPointCloudsUsingICP(lslidar_source_ptr_, _rslidar_result_cloud_ptr, _lslidar_result_cloud_ptr, lslidar_transform_);
            cout << "lslidar_transform_in_icp_thread:\n"
                 << lslidar_transform_.matrix() << endl;

            pthread_rwlock_trywrlock(&thread_rwlock);
            lslidar_transform_instead_ = lslidar_transform_;
            pthread_rwlock_unlock(&thread_rwlock);
        }
        register_flag_ = 1;
        return -99;
    }

    /***********************************************************
     * @brief 获得补盲雷达配准旋转矩阵
     * @return 旋转矩阵
    ***********************************************************/
    Eigen::Matrix4f IcpRegistration::getLocalTransformMatrix()
    {
        Eigen::Matrix4f _rslidar_transform_for_read;
        bool _need_last_transform = true;
        pthread_rwlock_tryrdlock(&thread_rwlock);
        _need_last_transform = false;
        _rslidar_transform_for_read = rslidar_transform_instead_;
        pthread_rwlock_unlock(&thread_rwlock);

        if (_need_last_transform)
        {
            _rslidar_transform_for_read = last_rslidar_transform_;
        }
        else
        {
            last_rslidar_transform_ = _rslidar_transform_for_read;
        }

        return _rslidar_transform_for_read;
    }

    /***********************************************************
     * @brief 获得主雷达配准旋转矩阵
     * @return 旋转矩阵 
    ***********************************************************/
    Eigen::Matrix4f IcpRegistration::getGlobaltransformMatrix()
    {
        Eigen::Matrix4f _lslidar_transform_for_read;
        bool _need_last_transform = true;
        pthread_rwlock_tryrdlock(&thread_rwlock);
        _need_last_transform = false;
        _lslidar_transform_for_read = lslidar_transform_instead_;
        pthread_rwlock_unlock(&thread_rwlock);

        if (_need_last_transform)
        {
            _lslidar_transform_for_read = last_lslidar_transform_;
        }
        else
        {
            last_lslidar_transform_ = _lslidar_transform_for_read;
        }

        return _lslidar_transform_for_read;
    }

} // namespace skywell