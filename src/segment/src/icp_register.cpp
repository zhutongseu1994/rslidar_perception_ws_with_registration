#include "icp_register.h"

int icp_register::Process(void)
{

	// 配准的流程
	// set 1 裁剪一块交叠区域点云
	CloudT::Ptr clip_region_source_cloud_ptr = boost::make_shared<CloudT>();
	CloudT::Ptr clip_region_target_cloud_ptr = boost::make_shared<CloudT>();
	skywell::CropBoxFilter crop;
	crop.setMinP(5, -5, -100.0);
	crop.setMaxP(10, 5, 100.0);
	crop.filter(source_ptr,clip_region_source_cloud_ptr);
	crop.filter(source_ptr,clip_region_target_cloud_ptr);

	// set 2 icp
	  pcl::IterativeClosestPoint<pcl::PointXYZI, pcl::PointXYZI> icp;
	  icp.setInputCloud(clip_region_source_cloud_ptr);
	  icp.setInputTarget(clip_region_target_cloud_ptr);
	  pcl::PointCloud<pcl::PointXYZI> Final;
	  icp.align(Final);
	  std::cout<<icp.getFitnessScore() <<std::endl;
	  std::cout << icp.getFinalTransformation() << std::endl;

	return -99;
}




int icp_register::add_pair_register(pcl::PointCloud<PointT>::Ptr source,pcl::PointCloud<PointT>::Ptr target)
{
	// 查询线程状态
	if (GetRunFlag() != 2)
	{
		// 更新数据
		source_ptr = source;
		target_ptr = target;
		// 启动配准
		ThreadStart();
	}
	return -1;
};
