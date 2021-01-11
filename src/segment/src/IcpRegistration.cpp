#include "IcpRegistration.hpp"

namespace skywell
{
    IcpRegistration::IcpRegistration()
    {
        registerflag = 0;
        pthread_rwlock_init(&thread_rwlock, NULL);
    }

    IcpRegistration::~IcpRegistration()
    {
        pthread_rwlock_destroy(&thread_rwlock);
    }

    void IcpRegistration::Init(skywell::Param *param)
    {
        m_param = param;
    }

    int IcpRegistration::Process(void)
    {
        m_param->loadcfg();

        CloudT::Ptr pair_result_cloud_ptr = boost::make_shared<CloudT>();
        CloudT::Ptr global_result_cloud_ptr = boost::make_shared<CloudT>();

        //左补盲和右补盲雷达配准
        registerflag = 0;

        icp_register_point_clouds(local_source_ptr, local_target_ptr, pair_result_cloud_ptr, pairTransform);
        cout << "pairTransform_in_icp_thread:\n"
             << pairTransform.matrix() << endl;
        pthread_rwlock_trywrlock(&thread_rwlock);
        pairTransform_ = pairTransform;
        pthread_rwlock_unlock(&thread_rwlock);

        // icp_register_point_clouds(global_source_ptr, pair_result_cloud_ptr, global_result_cloud_ptr, globalTransform);
        // cout << "globalTransform_in_icp_thread:\n"
        //      << globalTransform.matrix() << endl;

        // pthread_rwlock_trywrlock(&thread_rwlock);
        // globalTransform_ = globalTransform;
        // pthread_rwlock_unlock(&thread_rwlock);

        registerflag = 1;
        return -99;
    }

    int IcpRegistration::addPairPointCloud(CloudT::Ptr local_source, CloudT::Ptr local_target)
    {
        if (GetRunFlag() != 2)
        {
            local_source_ptr = local_source;
            local_target_ptr = local_target;
            //global_source_ptr = global_source;
            ThreadStart();
        }
        return 0;
    }

    Eigen::Matrix4f IcpRegistration::get_local_transform_matrix()
    {
        Eigen::Matrix4f _pairTransform;
        pthread_rwlock_tryrdlock(&thread_rwlock);
        _pairTransform = pairTransform_;
        pthread_rwlock_unlock(&thread_rwlock);
        return _pairTransform;
    }

    // Eigen::Matrix4f IcpRegistration::get_global_transform_matrix()
    // {
    //     Eigen::Matrix4f _globalTransform;
    //     pthread_rwlock_tryrdlock(&thread_rwlock);
    //     _globalTransform = globalTransform_;
    //     pthread_rwlock_unlock(&thread_rwlock);
    //     return _globalTransform;
    // }

    void IcpRegistration::icp_register_point_clouds(CloudT::Ptr &source_cloud_ptr,
                                                    CloudT::Ptr &target_cloud_ptr,
                                                    CloudT::Ptr &result_cloud_ptr,
                                                    Eigen::Matrix4f &pairTransform)
    {
        // 去除nan点
        pcl::PointCloud<pcl::PointXYZI>::Ptr source_remove_nan_ptr = boost::make_shared<CloudT>();
        removeNan(source_cloud_ptr, source_remove_nan_ptr);
        //截取一部分源点云进行配准
        CloudT::Ptr clip_region_source_cloud_ptr = boost::make_shared<CloudT>();
        remove_close_pt(m_param->clip_region_min_x, m_param->clip_region_min_y, m_param->clip_region_max_x, m_param->clip_region_max_y, source_remove_nan_ptr, clip_region_source_cloud_ptr);
        // 去除nan点
        pcl::PointCloud<pcl::PointXYZI>::Ptr target_remove_nan_ptr = boost::make_shared<CloudT>();
        removeNan(target_cloud_ptr, target_remove_nan_ptr);
        //截取一部分目标点云进行配准
        CloudT::Ptr clip_region_target_cloud_ptr = boost::make_shared<CloudT>();
        remove_close_pt(m_param->clip_region_min_x, m_param->clip_region_min_y, m_param->clip_region_max_x, m_param->clip_region_max_y, target_remove_nan_ptr, clip_region_target_cloud_ptr);

        icpAlignPointClouds(clip_region_source_cloud_ptr, clip_region_target_cloud_ptr, pairTransform);
        //把目标点云转换回源框架
        pcl::transformPointCloud(*target_cloud_ptr, *result_cloud_ptr, pairTransform);
        //添加源点云到转换目标
        *result_cloud_ptr += *source_cloud_ptr;
    }

    void IcpRegistration::ndt_register_point_clouds(CloudT::Ptr &source_cloud_ptr,
                                                    CloudT::Ptr &target_cloud_ptr,
                                                    CloudT::Ptr &result_cloud_ptr,
                                                    Eigen::Matrix4f &init_pose,
                                                    Eigen::Matrix4f &pairTransform)
    {
        // 去除nan点
        pcl::PointCloud<pcl::PointXYZI>::Ptr source_remove_nan_ptr = boost::make_shared<CloudT>();
        removeNan(source_cloud_ptr, source_remove_nan_ptr);
        //截取一部分源点云进行配准
        CloudT::Ptr clip_region_source_cloud_ptr = boost::make_shared<CloudT>();
        remove_close_pt(m_param->clip_region_min_x, m_param->clip_region_min_y, m_param->clip_region_max_x, m_param->clip_region_max_y, source_remove_nan_ptr, clip_region_source_cloud_ptr);
        // 去除nan点
        pcl::PointCloud<pcl::PointXYZI>::Ptr target_remove_nan_ptr = boost::make_shared<CloudT>();
        removeNan(target_cloud_ptr, target_remove_nan_ptr);
        //截取一部分目标点云进行配准
        CloudT::Ptr clip_region_target_cloud_ptr = boost::make_shared<CloudT>();
        remove_close_pt(m_param->clip_region_min_x, m_param->clip_region_min_y, m_param->clip_region_max_x, m_param->clip_region_max_y, target_remove_nan_ptr, clip_region_target_cloud_ptr);
        ndtAlignPointClouds(clip_region_source_cloud_ptr, clip_region_target_cloud_ptr, init_pose, pairTransform);
        //把目标点云转换回源框架
        pcl::transformPointCloud(*target_cloud_ptr, *result_cloud_ptr, pairTransform);
        //添加源点云到转换目标
        *result_cloud_ptr += *source_cloud_ptr;
    }

    // 去除nan点
    void IcpRegistration::removeNan(pcl::PointCloud<pcl::PointXYZI>::Ptr &in, pcl::PointCloud<pcl::PointXYZI>::Ptr &out)
    {
        std::vector<int> indices;
        pcl::removeNaNFromPointCloud(*in, *out, indices);
    }

    void IcpRegistration::remove_close_pt(double minx, double miny, double maxx, double maxy, const pcl::PointCloud<pcl::PointXYZI>::Ptr in, const pcl::PointCloud<pcl::PointXYZI>::Ptr out)
    {
        skywell::CropBoxFilter crop;
        crop.setMinP(minx, miny, -100.0);
        crop.setMaxP(maxx, maxy, 100.0);
        crop.setNegative(true);
        crop.filter(in, out);
    }

    void IcpRegistration::icpAlignPointClouds(pcl::PointCloud<pcl::PointXYZI>::Ptr &source_cloud_ptr,
                                              pcl::PointCloud<pcl::PointXYZI>::Ptr &target_cloud_ptr,
                                              Eigen::Matrix4f &final_transform)
    {
        pcl::IterativeClosestPointNonLinear<PointT, PointT>::Ptr icp_ptr = boost::make_shared<pcl::IterativeClosestPointNonLinear<PointT, PointT>>();

        icp_ptr->setTransformationEpsilon(m_param->icp_transformation_epsilon);
        icp_ptr->setMaxCorrespondenceDistance(m_param->icp_max_correspondence_distance);
        icp_ptr->setMaximumIterations(m_param->icp_max_iterations);
        icp_ptr->setEuclideanFitnessEpsilon(m_param->icp_euclidean_fitness_epsilon);
        icp_ptr->setInputCloud(source_cloud_ptr);
        icp_ptr->setInputTarget(target_cloud_ptr);

        Eigen::Matrix4f Ti = Eigen::Matrix4f::Identity(), prev, targetToSource;
        pcl::PointCloud<pcl::PointXYZI>::Ptr reg_result = source_cloud_ptr;
        for (int i = 0; i < m_param->icp_optimized_iterations; ++i)
        {
            source_cloud_ptr = reg_result;
            icp_ptr->setInputCloud(source_cloud_ptr);
            icp_ptr->align(*reg_result);
            //在每一个迭代之间累积转换
            Ti = icp_ptr->getFinalTransformation() * Ti;
            //如果这次转换和之前转换之间的差异小于阈值
            //则通过减小最大对应距离来改善程序
            if (fabs((icp_ptr->getLastIncrementalTransformation() - prev).sum()) < icp_ptr->getTransformationEpsilon())
                icp_ptr->setMaxCorrespondenceDistance(icp_ptr->getMaxCorrespondenceDistance() - 0.001);
            prev = icp_ptr->getLastIncrementalTransformation();
        }
        // 得到目标点云到源点云的变换
        targetToSource = Ti.inverse();
        final_transform = targetToSource;
    }

    void IcpRegistration::ndtAlignPointClouds(pcl::PointCloud<pcl::PointXYZI>::Ptr &source_cloud_ptr,
                                              pcl::PointCloud<pcl::PointXYZI>::Ptr &target_cloud_ptr,
                                              Eigen::Matrix4f &init_pose,
                                              Eigen::Matrix4f &final_transform)
    {
        pcl::NormalDistributionsTransform<PointT, PointT>::Ptr ndt_ptr = boost::make_shared<pcl::NormalDistributionsTransform<PointT, PointT>>();
        CloudT::Ptr reg_result = boost::make_shared<CloudT>();
        ndt_ptr->setResolution(m_param->ndt_resolution);
        ndt_ptr->setStepSize(m_param->ndt_step_size);
        ndt_ptr->setTransformationEpsilon(m_param->ndt_transformation_epsilon);
        ndt_ptr->setMaximumIterations(m_param->ndt_max_iterations);
        ndt_ptr->setInputCloud(source_cloud_ptr);
        ndt_ptr->setInputTarget(target_cloud_ptr);
        ndt_ptr->align(*reg_result, init_pose);
        final_transform = ndt_ptr->getFinalTransformation().inverse();
    }

    int IcpRegistration::GetRegisterFlag(void)
    {
        int _r;
        //pthread_rwlock_rdlock(&thread_rwlock);
        _r = registerflag;
        //pthread_rwlock_unlock(&thread_rwlock);
        return _r;
    }
} // namespace skywell