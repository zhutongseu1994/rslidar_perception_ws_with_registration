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

    // 去除nan点
    void IcpRegistration::removeNan(pcl::PointCloud<pcl::PointXYZI>::Ptr &in, pcl::PointCloud<pcl::PointXYZI>::Ptr &out)
    {
        std::vector<int> _indices;
        pcl::removeNaNFromPointCloud(*in, *out, _indices);
    }

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
            if (fabs((_icp_ptr->getLastIncrementalTransformation() - prev).sum()) < _icp_ptr->getTransformationEpsilon())
            {
                _icp_ptr->setMaxCorrespondenceDistance(_icp_ptr->getMaxCorrespondenceDistance() - 0.001);
            }
            _prev = _icp_ptr->getLastIncrementalTransformation();
        }
        // 得到目标点云到源点云的变换
        _target_to_source = _ti.inverse();
        final_transform = _target_to_source;
    }

    int IcpRegistration::getRegistrationFlag(void)
    {
        int _r;
        //pthread_rwlock_rdlock(&thread_rwlock);
        _r = register_flag_;
        //pthread_rwlock_unlock(&thread_rwlock);
        return _r;
    }

    int IcpRegistration::Process(void)
    {
        param_->loadcfg();

        CloudT::Ptr _rslidar_result_cloud_ptr = boost::make_shared<CloudT>();
        CloudT::Ptr _lslidar_result_cloud_ptr = boost::make_shared<CloudT>();

        //左补盲和右补盲雷达配准
        register_flag_ = 0;

        icp_register_point_clouds(rslidar_source_ptr_, rslidar_target_ptr_, _rslidar_result_cloud_ptr, rslidar_transform_);
        cout << "rslidar_transform_in_icp_thread:\n"
             << rslidar_transform_.matrix() << endl;
        pthread_rwlock_trywrlock(&thread_rwlock);
        rslidar_transform_instead_ = rslidar_transform_;
        pthread_rwlock_unlock(&thread_rwlock);
        if (param_->need_global_registration)
        {
            icp_register_point_clouds(lslidar_source_ptr_, _rslidar_result_cloud_ptr, _lslidar_result_cloud_ptr, lslidar_transform_);
            cout << "lslidar_transform_in_icp_thread:\n"
                 << lslidar_transform_.matrix() << endl;

            pthread_rwlock_trywrlock(&thread_rwlock);
            lslidar_transform_instead_ = lslidar_transform_;
            pthread_rwlock_unlock(&thread_rwlock);
        }
        register_flag_ = 1;
        return -99;
    }

    Eigen::Matrix4f IcpRegistration::getLocalTransformMatrix()
    {
        Eigen::Matrix4f _rslidar_transform_for_read;
        bool _need_last_transform = true;
        pthread_rwlock_tryrdlock(&thread_rwlock);
        _need_last_transform = false;
        _rslidar_transform_for_read = rslidar_transform_instead_;
        pthread_rwlock_unlock(&thread_rwlock);

        if(_need_last_transform)
        {
            _rslidar_transform_for_read = last_rslidar_transform_;
        }
        else
        {
            last_rslidar_transform_ = _rslidar_transform_for_read;
        }

        return _rslidar_transform_for_read;
    }

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