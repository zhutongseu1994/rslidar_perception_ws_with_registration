#ifndef _ICP_H_
#define _ICP_H_

#include <boost/make_shared.hpp>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/point_representation.h>
#include <pcl/filters/filter.h>
#include <pcl/features/normal_3d.h>
#include <pcl/registration/icp.h>
#include <pcl/registration/icp_nl.h>
#include <pcl/registration/transforms.h>





#include "thread.h"
#include "filter.h"

typedef pcl::PointXYZI PointT;
typedef pcl::PointCloud<PointT> CloudT;

class icp_register:public Thread
{
	public:
		icp_register();
		~icp_register();
	public:
		int Process(void);
		int add_pair_register(pcl::PointCloud<PointT>::Ptr source,pcl::PointCloud<PointT>::Ptr target);
		int get();
	private:
		//typename pcl::PointCloud<PointT>::Ptr source_ptr {new pcl::PointCloud<PointT>()};
		//typename pcl::PointCloud<PointT>::Ptr target_ptr {new pcl::PointCloud<PointT>()};

};






#endif
