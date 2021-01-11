#include "manager.h"

namespace skywell
{

  static float ground_k = 0.0f;
  static float ground_base = 0.0f;

  Manager::Manager(ros::NodeHandle &nh, skywell::Param *param)
  {
    m_param = param;
    m_decv_check = NULL;
    m_registration = NULL;
    SubInit(nh, param);
    PubInit(nh, param);
    ModInit(param);
  };

  Manager::~Manager(){};

  void Manager::SubInit(ros::NodeHandle &nh, skywell::Param *param)
  {
    if (param->front_rslidar_topic != "")
    {
      sub_front_rslidar = nh.subscribe<sensor_msgs::PointCloud2>(param->front_rslidar_topic, 10, boost::bind(&Manager::doRslidarWork, this, _1, param->front_rslidar_topic));
    }
    if (param->left_rslidar_topic != "")
    {
      sub_left_rslidar = nh.subscribe<sensor_msgs::PointCloud2>(param->left_rslidar_topic, 10, boost::bind(&Manager::doRslidarWork, this, _1, param->left_rslidar_topic));
    }
    if (param->right_rslidar_topic != "")
    {
      sub_right_rslidar = nh.subscribe<sensor_msgs::PointCloud2>(param->right_rslidar_topic, 10, boost::bind(&Manager::doRslidarWork, this, _1, param->right_rslidar_topic));
    }
  };

  void Manager::PubInit(ros::NodeHandle &nh, skywell::Param *param)
  {
    if (param->pub_ground != "")
    {
      pub_ground = nh.advertise<sensor_msgs::PointCloud2>(param->pub_ground, 10);
    }
    if (param->pub_no_ground != "")
    {
      pub_no_ground = nh.advertise<sensor_msgs::PointCloud2>(param->pub_no_ground, 10);
    }
    marker_pub = nh.advertise<visualization_msgs::Marker>("visualization_marker", 10);
    decv_state_pub = nh.advertise<segment::OnLineState>("lidar_oline_state", 10);
  };

  void Manager::ModInit(skywell::Param *param)
  {
    if (m_decv_check == NULL)
    {
      m_decv_check = new DecvCheck();
      m_decv_check->Init(decv_state_pub);
      if (param->front_rslidar_topic != "")
      {
        m_decv_check->addDecv(param->front_rslidar_topic, 0x01);
      }
      if (param->left_rslidar_topic != "")
      {
        m_decv_check->addDecv(param->left_rslidar_topic, 0x02);
      }
      if (param->right_rslidar_topic != "")
      {
        m_decv_check->addDecv(param->right_rslidar_topic, 0x03);
      }
    }
    if (m_registration == NULL)
      m_registration = new IcpRegistration();
  };

  void Manager::doRslidarWork(const sensor_msgs::PointCloud2ConstPtr &in_cloud_ptr, const std::string topicName)
  {
    m_param->loadcfg();
    // CloudT::Ptr current_pc_ptr = boost::make_shared<CloudT>();
    // pcl::fromROSMsg(*in_cloud_ptr, *current_pc_ptr);
    //根据topicName 检查对应话题是否工作正常是否有效
    // ROS_INFO("The 0 is going well until here");
    m_decv_check->aliveDecv(topicName);
    //ROS_INFO("topicName:%s,current_pc_ptr->header.stamp = %ld\n",topicName.c_str(),current_pc_ptr->header.stamp/1000);
    //ROS_INFO("m_decv_check->getOnlineNum() = %d\n",m_decv_check->getOnlineNum());
    // 第一阶段，多雷达数据合并
    //缓存数据，根据雷达数目，考虑缓存几场数据
    // cache_livox_point_cloud.push_back(*current_pc_ptr);

    // if (cache_livox_point_cloud.size() < m_decv_check->getOnlineNum())
    // {
    //   return;
    // }

    if (topicName == m_param->front_rslidar_topic)
      pretreat_point_clouds(in_cloud_ptr, cache_lslidar_point_cloud);
    if (topicName == m_param->left_rslidar_topic)
      pretreat_point_clouds(in_cloud_ptr, cache_rslidarl_point_cloud);
    if (topicName == m_param->right_rslidar_topic)
      pretreat_point_clouds(in_cloud_ptr, cache_rslidarr_point_cloud);

    if (cache_lslidar_point_cloud.size() == 0 || cache_rslidarl_point_cloud.size() == 0 || cache_rslidarr_point_cloud.size() == 0)
    {
      return;
    }

    //两补盲雷达配准

    CloudT::Ptr rslidarl_source_cloud_ptr = boost::make_shared<CloudT>(cache_rslidarl_point_cloud.back());
    CloudT::Ptr rslidarr_target_cloud_ptr = boost::make_shared<CloudT>(cache_rslidarr_point_cloud.back());
    m_registration->addPairPointCloud(rslidarl_source_cloud_ptr, rslidarr_target_cloud_ptr);

    CloudT::Ptr pair_result_cloud_ptr = boost::make_shared<CloudT>();
    if (m_registration->GetRegisterFlag() == 1)
      pairTransform = m_registration->get_transform_matrix();
    cout << "pairTransform: " << pairTransform.matrix() << endl;

    transform_point_clouds(rslidarl_source_cloud_ptr, rslidarr_target_cloud_ptr, pair_result_cloud_ptr, pairTransform);
    //补盲雷达配准后的结果和主雷达配准
    // CloudT::Ptr global_result_cloud_ptr = boost::make_shared<CloudT>();
    // if (m_param->need_global_registration)
    // {
    //   CloudT::Ptr lslidar_source_cloud_ptr = boost::make_shared<CloudT>(cache_lslidar_point_cloud.back());
    //   m_registration->addPairPointCloud(lslidar_source_cloud_ptr, pair_result_cloud_ptr);
    //   if (m_registration->GetRegisterFlag() == 1)
    //     globalTransform = m_registration->get_transform_matrix();
    //   cout << "globalTransform: " << globalTransform.matrix() << endl;
    //   transform_point_clouds(lslidar_source_cloud_ptr, pair_result_cloud_ptr, global_result_cloud_ptr, globalTransform);
    // }
    cache_lslidar_point_cloud.clear();
    cache_rslidarl_point_cloud.clear();
    cache_rslidarr_point_cloud.clear();

    // //多场数据合并
    // CloudT::Ptr cloud_sum_ptr = boost::make_shared<CloudT>();
    // for (size_t i = 0; i < cache_livox_point_cloud.size(); i++)
    // {
    //   CloudT::Ptr cloud_ptr = boost::make_shared<CloudT>();
    //   cloud_ptr = cache_livox_point_cloud[i].makeShared();
    //   *cloud_sum_ptr += *cloud_ptr;
    // }
    // cache_livox_point_cloud.clear();
    ros::Time startTime = ros::Time::now();

    // 体素下采样
    CloudT::Ptr octree_voxel_grid_ptr = boost::make_shared<CloudT>();
    //octreeVoxelGrid(m_param->leaf_size, cloud_sum_ptr, octree_voxel_grid_ptr);
    octreeVoxelGrid(m_param->leaf_size, pair_result_cloud_ptr, octree_voxel_grid_ptr);
    // 去除nan点
    CloudT::Ptr remove_nan_ptr = boost::make_shared<CloudT>();
    removeNan(octree_voxel_grid_ptr, remove_nan_ptr);
    // 消减一定高度
    CloudT::Ptr cliped_pc_ptr = boost::make_shared<CloudT>();
    clip_above(m_param->clip_height, remove_nan_ptr, cliped_pc_ptr);
    // 去除自身周围
    CloudT::Ptr remove_close_ptr = boost::make_shared<CloudT>();
    remove_close_pt(m_param->clip_min_x, m_param->clip_min_y, m_param->clip_max_x, m_param->clip_max_y, cliped_pc_ptr, remove_close_ptr);

    if (m_param->seg_model == 0) //
    {
      // 射线去地面
      GroundSegment(m_param->ray_angle, m_param->initial_distance, m_param->max_distance, m_param->height_threshold, m_param->slope_threshold, remove_close_ptr);
    }
    else if (m_param->seg_model == 1) //
    {
      plane_segment(remove_close_ptr);
    }
    else if (m_param->seg_model == 2)
    {
      // 耗时太高
      ProgressiveMorphologicalFilter(remove_close_ptr);
    }
    else if (m_param->seg_model == 3)
    {
      // 耗时太高
      RansacSegmentPlane(remove_close_ptr);
    }
    else if (m_param->seg_model == 9) //
    {
      debugRayGround(remove_close_ptr);
    }
    ros::Time endTime = ros::Time::now();
    double elapsedTime = (endTime - startTime).toSec() * 1000;
    ROS_INFO("doRslidarWork--->%f msecs for segment", elapsedTime);
  };

  void Manager::pretreat_point_clouds(const sensor_msgs::PointCloud2ConstPtr &in_cloud_ptr, std::vector<CloudT> &cloud_container)
  {
    pcl::PointCloud<pcl::PointXYZI>::Ptr current_pc_ptr = boost::make_shared<CloudT>();
    pcl::fromROSMsg(*in_cloud_ptr, *current_pc_ptr);
    // // 体素下采样
    // pcl::PointCloud<pcl::PointXYZI>::Ptr octree_voxel_grid_ptr = boost::make_shared<CloudT>();
    // octreeVoxelGrid(m_param->leaf_size, current_pc_ptr, octree_voxel_grid_ptr);
    // // 去除nan点
    // pcl::PointCloud<pcl::PointXYZI>::Ptr remove_nan_ptr = boost::make_shared<CloudT>();
    // removeNan(octree_voxel_grid_ptr, remove_nan_ptr);
    // //去掉过高的点
    // CloudT::Ptr cliped_ptr = boost::make_shared<CloudT>();
    // clip_above(m_param->clip_height, remove_nan_ptr, cliped_ptr);
    cloud_container.push_back(*current_pc_ptr);
  }

  void Manager::transform_point_clouds(const CloudT::Ptr &source_cloud_ptr,
                                       const CloudT::Ptr &target_cloud_ptr,
                                       CloudT::Ptr &result_cloud_ptr,
                                       Eigen::Matrix4f &transform_matrix)
  {
    //把目标点云转换回源框架
    pcl::transformPointCloud(*target_cloud_ptr, *result_cloud_ptr, transform_matrix);
    //添加源点云到转换目标
    *result_cloud_ptr += *source_cloud_ptr;
  }

  void Manager::RayGroundSegment(float ray_angle, float he, float hg, const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud)
  {
    std::vector<pcl::PointIndices> radial_division_indices;
    std::vector<PointCloudXYZIRT> radial_ordered_clouds;

    int radial_dividers_num_ = ceil(360 / ray_angle);
    radial_division_indices.resize(radial_dividers_num_);
    radial_ordered_clouds.resize(radial_dividers_num_);

    XYZI_to_RTZ(ray_angle, in_cloud, radial_division_indices, radial_ordered_clouds);

    std::vector<st_Point> tempdataPoints;
    for (size_t j = 0; j < radial_ordered_clouds[0].size(); j++)
    {
      float distance = 0.0f;
      size_t len = tempdataPoints.size();
      if (len >= 1)
      {
        distance = tempdataPoints[len - 1].x - tempdataPoints[0].x;
        if ((distance <= 20.0) && (tempdataPoints.size() < 100))
        {
          st_Point _point;
          _point.x = radial_ordered_clouds[0][j].radius;
          _point.y = radial_ordered_clouds[0][j].point.z;
          tempdataPoints.push_back(_point);
        }
        else
        {
          break;
        }
      }
      else
      {
        st_Point _point;
        _point.x = radial_ordered_clouds[0][j].radius;
        _point.y = radial_ordered_clouds[0][j].point.z;
        tempdataPoints.push_back(_point);
      }
    }
    double A = 0;
    double B = 0;
    double C = 0;
    double meanError = 0;
    int datalen = tempdataPoints.size();
    if (!ransacLiner(tempdataPoints, datalen, 2, datalen * 0.5, datalen * 0.6, 0.3, A, B, C, meanError))
    {
      ROS_DEBUG("A = %f,B = %f,C= %f,Error = %f,K = %f,angle = %f\n", A, B, C, meanError, (-A / B), atan(-A / B) * 180 / 3.1415926);
      if (meanError <= 0.3)
      {
        ground_k = (-A / B);
        ground_base = (-C / B);
      }
    }
    else
    {
      ROS_DEBUG("RANSAC Failed ");
    }

    pcl::PointIndices ground_indices, no_ground_indices, road_boundary_indices;
    classify_pc(radial_ordered_clouds, ground_indices, he, hg, no_ground_indices, road_boundary_indices);

    pcl::PointCloud<pcl::PointXYZI>::Ptr ground_cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr no_ground_cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>);

    pcl::ExtractIndices<pcl::PointXYZI> extract_ground;
    extract_ground.setInputCloud(in_cloud);
    extract_ground.setIndices(boost::make_shared<pcl::PointIndices>(no_ground_indices));

    extract_ground.setNegative(false); //true removes the indices, false leaves only the indices
    extract_ground.filter(*no_ground_cloud_ptr);

    extract_ground.setNegative(true); //true removes the indices, false leaves only the indices
    extract_ground.filter(*ground_cloud_ptr);
    publish_cloud(pub_ground, ground_cloud_ptr);
    publish_cloud(pub_no_ground, no_ground_cloud_ptr);
  };

  void Manager::GroundSegment(float ray_angle, float initial_distance, float max_distance, float height_threshold, float slope_threshold, const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud)
  {
    std::vector<pcl::PointIndices> radial_division_indices;
    std::vector<PointCloudXYZIRT> radial_ordered_clouds;

    int radial_dividers_num_ = ceil(360 / ray_angle);
    radial_division_indices.resize(radial_dividers_num_);
    radial_ordered_clouds.resize(radial_dividers_num_);

    XYZI_to_RTZ(ray_angle, in_cloud, radial_division_indices, radial_ordered_clouds);
    /*
	std::vector<st_Point> tempdataPoints;
	for (size_t j = 0; j< radial_ordered_clouds[0].size() ;j++ )
	{
		float distance = 0.0f;
		size_t len = tempdataPoints.size();
		if (len >= 1)
		{
			distance = tempdataPoints[len - 1].x - tempdataPoints[0].x;
			if ((distance <=20.0)&&(tempdataPoints.size() < 100))
			{
				st_Point _point;
				_point.x = radial_ordered_clouds[0][j].radius;
				_point.y = radial_ordered_clouds[0][j].point.z;
				tempdataPoints.push_back(_point);
			}else
			{
				break;
			}
		}else
		{
			st_Point _point;
			_point.x = radial_ordered_clouds[0][j].radius;
			_point.y = radial_ordered_clouds[0][j].point.z;
			tempdataPoints.push_back(_point);
		}
	}
    double A = 0;
    double B = 0;
    double C = 0;
    double meanError = 0;
	int datalen = tempdataPoints.size();
    if(!ransacLiner(tempdataPoints,datalen ,2, datalen*0.5, datalen*0.6, 0.3, A, B, C, meanError))
    {
		ROS_INFO("A = %f,B = %f,C= %f,Error = %f,K = %f,angle = %f\n",A,B,C,meanError,(-A/B),atan(-A/B)*180/3.1415926);
		if (meanError <= 0.3)
		{
			ground_k = (-A/B);
			ground_base = (-C/B);
		}
    }
    else
    {
        cout << "RANSAC Failed " << endl;
    }*/
    /*
	for (int i = 0; i < radial_division_indices.size() ;i++ )
	{

		if (radial_division_indices[i].indices.size() > 0)
		{
			pcl::PointCloud<pcl::PointXYZI>::Ptr ground_cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>);

			pcl::ExtractIndices<pcl::PointXYZI> extract_ground;
			extract_ground.setInputCloud(in_cloud);
			extract_ground.setIndices(boost::make_shared<pcl::PointIndices>(radial_division_indices[i]));

			extract_ground.setNegative(false); //true removes the indices, false leaves only the indices
			extract_ground.filter(*ground_cloud_ptr);
			publish_cloud(pub_ground, ground_cloud_ptr);
			sleep(1);
		}
	}
	*/

    pcl::PointIndices ground_indices, no_ground_indices, road_boundary_indices;
    my_classify_pc(radial_ordered_clouds, ground_indices, initial_distance, max_distance, height_threshold, slope_threshold, no_ground_indices, road_boundary_indices);

    pcl::PointCloud<pcl::PointXYZI>::Ptr ground_cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr no_ground_cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>);

    pcl::ExtractIndices<pcl::PointXYZI> extract_no_ground;
    extract_no_ground.setInputCloud(in_cloud);
    extract_no_ground.setIndices(boost::make_shared<pcl::PointIndices>(no_ground_indices));

    extract_no_ground.setNegative(false); //true removes the indices, false leaves only the indices
    extract_no_ground.filter(*no_ground_cloud_ptr);
    publish_cloud(pub_no_ground, no_ground_cloud_ptr);
    pcl::ExtractIndices<pcl::PointXYZI> extract_ground;
    extract_ground.setInputCloud(in_cloud);
    extract_ground.setIndices(boost::make_shared<pcl::PointIndices>(ground_indices));

    extract_ground.setNegative(false); //true removes the indices, false leaves only the indices
    extract_ground.filter(*ground_cloud_ptr);
    publish_cloud(pub_ground, ground_cloud_ptr);
  };
  /*
void Manager::Ray_ProgressiveMorphologicalFilter(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud)
{
	std::vector<pcl::PointIndices> radial_division_indices;
    std::vector<pcl::PointCloud<pcl::PointXYZI>> radial_ordered_clouds;

	int radial_dividers_num_ = ceil(360/RADIAL_DIVIDER_ANGLE);
	radial_division_indices.resize(radial_dividers_num_);
    radial_ordered_clouds.resize(radial_dividers_num_);

	XYZI_to_RTZ(in_cloud,radial_division_indices,radial_ordered_clouds);

};
*/
  void Manager::RansacSegmentPlane(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud)
  {
    int num_points = in_cloud->points.size();
    auto cloud_points = in_cloud->points;
    Ransac RansacSeg(10, 0.5, num_points);
    std::unordered_set<int> inliersResult = RansacSeg.Ransac3d(in_cloud);
    pcl::PointCloud<pcl::PointXYZI>::Ptr ground_cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr no_ground_cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>);
    for (int i = 0; i < num_points; i++)
    {
      PointT pt = cloud_points[i];
      if (inliersResult.count(i))
      {
        no_ground_cloud_ptr->points.push_back(pt);
      }
      else
      {
        ground_cloud_ptr->points.push_back(pt);
      }
    }
    publish_cloud(pub_ground, ground_cloud_ptr);
    publish_cloud(pub_no_ground, no_ground_cloud_ptr);
  };

  void Manager::debugRayGround(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud)
  {
    std::vector<pcl::PointIndices> radial_division_indices;
    std::vector<PointCloudXYZIRT> radial_ordered_clouds;

    int radial_dividers_num_ = ceil(360 / RADIAL_DIVIDER_ANGLE);
    radial_division_indices.resize(radial_dividers_num_);
    radial_ordered_clouds.resize(radial_dividers_num_);
    XYZI_to_RTZ(RADIAL_DIVIDER_ANGLE, in_cloud, radial_division_indices, radial_ordered_clouds);
    int index = ceil(m_param->check_angle / RADIAL_DIVIDER_ANGLE);
    std::vector<st_Point> tempdataPoints;
    //printf("radial_ordered_clouds[0].size() = %ld\n",radial_ordered_clouds[0].size());
    for (size_t j = 0; j < radial_ordered_clouds[index].size(); j++)
    {
      st_Point _point;
      _point.x = radial_ordered_clouds[index][j].radius;
      _point.y = radial_ordered_clouds[index][j].point.z;
      tempdataPoints.push_back(_point);
      // 标定的时候，依据r,z值标定，要求r值增长，z值始终约等于 0.0，表示雷达水平；可以在不同方向上测试
      std::cout << "[r:" << radial_ordered_clouds[index][j].radius << ",z:" << radial_ordered_clouds[index][j].point.z << "],";
    }
    std::cout << std::endl;
    double A = 0;
    double B = 0;
    double C = 0;
    double meanError = 0;
    int datalen = tempdataPoints.size();
    if (!ransacLiner(tempdataPoints, datalen, 2, datalen * 0.5, datalen * 0.6, 0.2, A, B, C, meanError))
    {
      ROS_DEBUG("A = %f,B = %f,C= %f,Error = %f,K = %f,angle = %f\n", A, B, C, meanError, (-A / B), atan(-A / B) * 180 / 3.1415926);
    }
    else
    {
      ROS_DEBUG("RANSAC Failed\n");
    }
    pcl::PointCloud<pcl::PointXYZI>::Ptr ground_cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>);
    pcl::ExtractIndices<pcl::PointXYZI> extract_ground;
    extract_ground.setInputCloud(in_cloud);
    extract_ground.setIndices(boost::make_shared<pcl::PointIndices>(radial_division_indices[index]));
    extract_ground.setNegative(false); //true removes the indices, false leaves only the indices
    extract_ground.filter(*ground_cloud_ptr);
    if (ground_cloud_ptr->points.size() > 0)
    {
      printf("---------------------------------\n");
      publish_cloud(pub_ground, ground_cloud_ptr);
    }
    visualization_msgs::Marker line_list;
    line_list.header.frame_id = "livox_frame";
    line_list.header.stamp = ros::Time::now();
    line_list.ns = "lines";
    line_list.action = visualization_msgs::Marker::ADD;
    line_list.pose.orientation.w = 1.0;
    line_list.id = 2;
    line_list.type = visualization_msgs::Marker::LINE_LIST;
    line_list.scale.x = 0.1;
    // Line list is red
    line_list.color.r = 1.0;
    line_list.color.a = 1.0;
    // Create the vertices for the points and lines
    geometry_msgs::Point p;
    p.x = 0;
    p.y = 0;
    p.z = 0;
    // The line list needs two points for each line
    line_list.points.push_back(p);
    p.x = 20.0;
    p.y = 0;
    p.z = (0 - (20 * A + C)) / B;
    line_list.points.push_back(p);
    marker_pub.publish(line_list);
  };

  int Manager::ransacLiner(std::vector<st_Point> &pstData, int dataCnt, int minCnt, double maxIterCnt, int consensusCntThreshold, double maxErrorThreshod, double &A, double &B, double &C, double &modelMeanError)
  {
    default_random_engine rng;
    uniform_int_distribution<unsigned> uniform(0, dataCnt - 1);
    rng.seed(10);                      // 固定随机数种子
    set<unsigned int> selectIndexs;    // 选择的点的索引
    vector<st_Point> selectPoints;     // 选择的点
    set<unsigned int> consensusIndexs; // 满足一致性的点的索引
    double line_A = 0;
    double line_B = 0;
    double line_C = 0;
    modelMeanError = 0;
    int isNonFind = 1;
    unsigned int bestConsensusCnt = 0; // 满足一致性估计的点的个数
    int iter = 0;
    while (iter < maxIterCnt)
    {
      selectIndexs.clear();
      selectPoints.clear();

      // Step1: 随机选择minCnt个点
      while (1)
      {
        unsigned int index = uniform(rng);
        selectIndexs.insert(index);
        if (selectIndexs.size() == minCnt)
        {
          break;
        }
      }

      // Step2: 进行模型参数估计 (y2 - y1)*x - (x2 - x1)*y + (y2 - y1)x2 - (x2 - x1)y2= 0
      set<unsigned int>::iterator selectIter = selectIndexs.begin();
      while (selectIter != selectIndexs.end())
      {
        unsigned int index = *selectIter;
        selectPoints.push_back(pstData[index]);
        selectIter++;
      }
      double deltaY = (selectPoints[1]).y - (selectPoints[0]).y;
      double deltaX = (selectPoints[1]).x - (selectPoints[0]).x;
      line_A = deltaY;
      line_B = -deltaX;
      line_C = -deltaY * (selectPoints[0]).x + deltaX * (selectPoints[0]).y;

      // Step3: 进行模型评估: 点到直线的距离
      int dataIter = 0;
      double meanError = 0;
      set<unsigned int> tmpConsensusIndexs;
      while (dataIter < dataCnt)
      {
        double distance = (line_A * pstData[dataIter].x + line_B * pstData[dataIter].y + line_C) / sqrt(line_A * line_A + line_B * line_B);
        distance = distance > 0 ? distance : -distance;
        if (distance < maxErrorThreshod)
        {
          tmpConsensusIndexs.insert(dataIter);
        }
        meanError += distance;
        dataIter++;
      }

      // Step4: 判断一致性: 满足一致性集合的最小元素个数条件 + 至少比上一次的好
      if (tmpConsensusIndexs.size() >= bestConsensusCnt && tmpConsensusIndexs.size() >= consensusCntThreshold)
      {
        bestConsensusCnt = consensusIndexs.size(); // 更新一致性索引集合元素个数
        modelMeanError = meanError / dataCnt;
        consensusIndexs.clear();
        consensusIndexs = tmpConsensusIndexs; // 更新一致性索引集合
        A = line_A;
        B = line_B;
        C = line_C;
        isNonFind = 0;
      }
      iter++;
    }
    return isNonFind;
  }

  void Manager::XYZI_to_RTZ(float ray_angle, const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud,
                            std::vector<pcl::PointIndices> &out_radial_divided_indices,
                            std::vector<PointCloudXYZIRT> &out_radial_ordered_clouds)
  {
    //out_radial_divided_indices.clear();
    //#pragma omp parallel for
    for (size_t i = 0; i < in_cloud->points.size(); i++)
    {
      PointXYZIRT new_point;
      auto radius = (float)sqrt(
          in_cloud->points[i].x * in_cloud->points[i].x + in_cloud->points[i].y * in_cloud->points[i].y);
      auto theta = (float)atan2(in_cloud->points[i].y, in_cloud->points[i].x) * 180 / 3.1415926;
      if (theta < 0)
      {
        theta += 360;
      }
      //角度的微分
      auto radial_div = (size_t)floor(theta / ray_angle);
      new_point.point = in_cloud->points[i];
      new_point.radius = radius;
      new_point.theta = theta;
      new_point.radial_div = radial_div;
      new_point.original_index = i;
      //#pragma omp critical
      {
        out_radial_divided_indices[radial_div].indices.push_back(i);
        out_radial_ordered_clouds[radial_div].push_back(new_point);
      }
    } //end for

    //将同一根射线上的点按照半径（距离）排序
    //#pragma omp for

    for (size_t i = 0; i < out_radial_ordered_clouds.size(); i++)
    {
      std::sort(out_radial_ordered_clouds[i].begin(), out_radial_ordered_clouds[i].end(),
                [](const PointXYZIRT &a, const PointXYZIRT &b) { return a.radius < b.radius; });
    }
  }

  void Manager::XYZI_to_RTZ(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud,
                            std::vector<pcl::PointIndices> &out_radial_divided_indices,
                            std::vector<pcl::PointCloud<PointT>> &out_radial_ordered_clouds)
  {
    //out_radial_divided_indices.clear();
    //#pragma omp parallel for
    for (size_t i = 0; i < in_cloud->points.size(); i++)
    {
      auto theta = (float)atan2(in_cloud->points[i].y, in_cloud->points[i].x) * 180 / 3.1415926;
      if (theta < 0)
      {
        theta += 360;
      }
      //角度的微分
      auto radial_div = (size_t)floor(theta / RADIAL_DIVIDER_ANGLE);
      //#pragma omp critical
      {
        out_radial_divided_indices[radial_div].indices.push_back(i);
        out_radial_ordered_clouds[radial_div].push_back(in_cloud->points[i]);
      }
    } //end for
  }

  void Manager::classify_pc(std::vector<PointCloudXYZIRT> &in_radial_ordered_clouds,
                            pcl::PointIndices &out_ground_indices,
                            float he, float hg,
                            pcl::PointIndices &out_no_ground_indices,
                            pcl::PointIndices &out_road_boundary_indices)
  {

    out_ground_indices.indices.clear();
    out_no_ground_indices.indices.clear();
    out_road_boundary_indices.indices.clear();
    //#pragma omp for
    float Hg = hg;
    float He = he;
    for (size_t i = 0; i < in_radial_ordered_clouds.size(); i++) //sweep through each radial division 遍历每一根射线
    {
      // 一段点云集计算
      float min_z = std::numeric_limits<float>::max();
      float max_z = -std::numeric_limits<float>::max();
      float start_radius = 0.0f;
      float end_radius = 0.0f;
      std::vector<PointXYZIRT> tmpPointXYZIRT;
      bool first_no_ground_point = true;
      for (size_t j = 0; j < in_radial_ordered_clouds[i].size(); j++) //loop through each point in the radial div
      {
        float points_distance = 0.0f;
        if (j != 0)
        {
          points_distance = in_radial_ordered_clouds[i][j].radius - start_radius;
        }
        else
        {
          start_radius = in_radial_ordered_clouds[i][j].radius;
        }

        if ((points_distance <= 0.5))
        {
          if (in_radial_ordered_clouds[i][j].point.z < min_z)
          {
            min_z = in_radial_ordered_clouds[i][j].point.z;
          }
          if (in_radial_ordered_clouds[i][j].point.z > max_z)
          {
            max_z = in_radial_ordered_clouds[i][j].point.z;
          }
          end_radius = in_radial_ordered_clouds[i][j].radius;
          tmpPointXYZIRT.push_back(in_radial_ordered_clouds[i][j]);
        }
        else
        {
          float _hg = max_z - min_z;
          float _he = min_z - 0.0;
          float _base_ground_height = ((start_radius + end_radius) / 2) * ground_k + ground_base;
          if (((_hg <= Hg) && (_he <= (He + _base_ground_height))) || (max_z < _base_ground_height))
          {
            for (size_t k = 0; k < tmpPointXYZIRT.size(); k++)
            {
              out_ground_indices.indices.push_back(tmpPointXYZIRT[k].original_index);
            }
          }
          else
          {
            if (tmpPointXYZIRT.size() > 1)
            {
              for (size_t k = 0; k < tmpPointXYZIRT.size(); k++)
              {
                out_no_ground_indices.indices.push_back(tmpPointXYZIRT[k].original_index);
              }
              if (first_no_ground_point) // 第一个非地面点
              {
                out_road_boundary_indices.indices.push_back(tmpPointXYZIRT[0].original_index);
                first_no_ground_point = false;
              }
            }
          }
          tmpPointXYZIRT.clear();
          min_z = std::numeric_limits<float>::max();
          max_z = -std::numeric_limits<float>::max();
          if (in_radial_ordered_clouds[i][j].point.z < min_z)
          {
            min_z = in_radial_ordered_clouds[i][j].point.z;
          }
          if (in_radial_ordered_clouds[i][j].point.z > max_z)
          {
            max_z = in_radial_ordered_clouds[i][j].point.z;
          }
          start_radius = in_radial_ordered_clouds[i][j].radius;
          tmpPointXYZIRT.push_back(in_radial_ordered_clouds[i][j]);
        }
      }
      if (!tmpPointXYZIRT.empty())
      {
        float _hg = max_z - min_z;
        float _he = min_z - 0.0;
        float _base_ground_height = ((start_radius + end_radius) / 2) * ground_k + ground_base;
        if (((_hg <= Hg) && (_he <= (He + _base_ground_height))) || (max_z < _base_ground_height))
        {
          for (size_t k = 0; k < tmpPointXYZIRT.size(); k++)
          {
            out_ground_indices.indices.push_back(tmpPointXYZIRT[k].original_index);
          }
        }
        else
        {
          if (tmpPointXYZIRT.size() > 1)
          {
            for (size_t k = 0; k < tmpPointXYZIRT.size(); k++)
            {
              out_no_ground_indices.indices.push_back(tmpPointXYZIRT[k].original_index);
            }
            if (first_no_ground_point) // 第一个非地面点
            {
              out_road_boundary_indices.indices.push_back(tmpPointXYZIRT[0].original_index);
              first_no_ground_point = false;
            }
          }
        }
        tmpPointXYZIRT.clear();
      }
    }
  }

  double distance(PointT &first, PointT &second)
  {
    float x = first.x - second.x;
    float y = first.y - second.y;
    float z = first.z - second.z;
    return sqrt(x * x + y * y + z * z);
  }

  /** 
 * @brief 判断输入点是否是地面点
 * @param ground_points       已知的地面点集
 * @param index               判断地面点参考已知地面点集中的点序号
 * @param pointxyzrt          需要判断的点
 * @param initial_distance    初始地面高度
 * @param max_distance        参考点与判断最远距离
 * @param height_threshold    高度阈值：当判断点与参考点距离超过max_distance，按照height_threshold判断
 * @param slope_threshold     坡度阈值：输入的是角度
 * @return 返回说明
 *     -<em>false</em> 非地面点
 *     -<em>true</em> 地面点
 */
  bool Manager::check_point_is_ground(std::vector<PointXYZIRT> &ground_points,
                                      int index,
                                      PointXYZIRT &pointxyzrt,
                                      float initial_distance,
                                      float max_distance,
                                      float height_threshold,
                                      float slope_threshold)
  {
    bool is_ground_point = false;
    float _height_threshold = tan(DEG2RAD(slope_threshold)) * max_distance;
    height_threshold = (height_threshold > _height_threshold) ? height_threshold : _height_threshold;

    if (index > 0)
    {
      float prev_ground_points_radius = pointxyzrt.radius - ground_points[index - 1].radius;
      float prev_ground_point_height = ground_points[index - 1].point.z;
      float prev_height_threshold = tan(DEG2RAD(slope_threshold)) * prev_ground_points_radius;
      float points_distacne = distance(ground_points[index - 1].point, pointxyzrt.point);
      float current_height = pointxyzrt.point.z;
      if ((points_distacne < 0.05) || (current_height < initial_distance))
      {
        is_ground_point = true;
      }
      else
      {
        if (prev_ground_points_radius < max_distance)
        {
          //if (current_height < (prev_ground_point_height + prev_height_threshold))
          if (current_height < (prev_ground_point_height + prev_height_threshold) && current_height > (prev_ground_point_height - prev_height_threshold))
          {
            is_ground_point = true;
          }
          else
          {
            is_ground_point = check_point_is_ground(ground_points, index - 1, pointxyzrt, initial_distance, max_distance, height_threshold, slope_threshold);
          }
        }
        else
        {
          if (current_height < ground_points[ground_points.size() - 1].point.z + height_threshold)
          {
            is_ground_point = true;
          }
          else
          {
            is_ground_point = false;
          }
        }
      }
    }
    else
    {
      if (ground_points.size() > 0)
      {
        is_ground_point = false;
      }
      else
      {
        float prev_ground_points_radius = pointxyzrt.radius - 0.0f;
        float prev_ground_point_height = 0.0f;
        float prev_height_threshold = tan(DEG2RAD(slope_threshold)) * prev_ground_points_radius;
        float current_height = pointxyzrt.point.z;
        if ((current_height < (prev_ground_point_height + prev_height_threshold) && current_height > (prev_ground_point_height - prev_height_threshold)) || (current_height < initial_distance))
        {
          is_ground_point = true;
        }
        else
        {
          is_ground_point = false;
        }
      }
    }
    return is_ground_point;
  };

  void Manager::my_classify_pc(std::vector<PointCloudXYZIRT> &in_radial_ordered_clouds,
                               pcl::PointIndices &out_ground_indices,
                               float initial_distance, float max_distance,
                               float height_threshold, float slope_threshold,
                               pcl::PointIndices &out_no_ground_indices,
                               pcl::PointIndices &out_road_boundary_indices)
  {
    out_ground_indices.indices.clear();
    out_no_ground_indices.indices.clear();
    out_road_boundary_indices.indices.clear();
    for (size_t i = 0; i < in_radial_ordered_clouds.size(); i++) //sweep through each radial division 遍历每一根射线
    //for (size_t i = 45; i < 46; i++) //sweep through each radial division 遍历每一根射线
    {
      PointT prev_point;
      prev_point.x = 0.0f;
      prev_point.y = 0.0f;
      prev_point.z = 0.0f;
      // 上一个地面基准点半径
      float prev_ground_base_point_radius = 0.0f;
      // 上一个地面基准点点高度
      float prev_ground_base_point_height = 0.0f;
      float prev_ground_point_radius = 0.0f;
      float prev_ground_point_height = 0.0f;

      bool prev_ground = false;
      bool current_ground = false;

      std::vector<PointXYZIRT> tmp_ground_PointXYZIRT;
      for (size_t j = 0; j < in_radial_ordered_clouds[i].size(); j++)
      {
        current_ground = check_point_is_ground(tmp_ground_PointXYZIRT, tmp_ground_PointXYZIRT.size(), in_radial_ordered_clouds[i][j], initial_distance, max_distance, height_threshold, slope_threshold);
        if (current_ground)
        {
          tmp_ground_PointXYZIRT.push_back(in_radial_ordered_clouds[i][j]);
          out_ground_indices.indices.push_back(in_radial_ordered_clouds[i][j].original_index);
        }
        else
        {
          out_no_ground_indices.indices.push_back(in_radial_ordered_clouds[i][j].original_index);
        }
      }
      //pcl::PointIndices temp_point_indices;

      //boost::shared_ptr<pcl::PointCloud<pcl::PointXYZI>> tmp_ground_points = boost::make_shared<pcl::PointCloud<pcl::PointXYZI>>();
      /*for (size_t j = 0; j < in_radial_ordered_clouds[i].size(); j++) //loop through each point in the radial div
        {
			float base_points_radius = in_radial_ordered_clouds[i][j].radius - prev_ground_base_point_radius;
			float base_height_threshold = tan(DEG2RAD(local_max_slope_)) * base_points_radius;
			float current_height = in_radial_ordered_clouds[i][j].point.z;
			float points_distacne = distance(in_radial_ordered_clouds[i][j].point,prev_point);



			std::cout<<"p_d:"<< points_distacne<<",r:"<<in_radial_ordered_clouds[i][j].radius<<",p_r:"<<base_points_radius<<",p_h:"<<prev_ground_base_point_height<<",h_t:"<<base_height_threshold<<",c_h:"<<current_height;

			if ((((current_height < (prev_ground_base_point_height + base_height_threshold) && current_height > (prev_ground_base_point_height - base_height_threshold)))&&(base_points_radius < 2.0))||(current_height < 0.2)) //  只找地面点
			{
				tmp_ground_PointXYZIRT.push_back(in_radial_ordered_clouds[i][j]);
				std::cout<<"  --11 --  ";
				current_ground = true;
				if (base_points_radius > 1.0)
				{
						prev_ground_base_point_radius = in_radial_ordered_clouds[i][j].radius;
						prev_ground_base_point_height = in_radial_ordered_clouds[i][j].point.z;
				}
			}else
			{
				// 单主雷达，第一个距离原点较远
				if ((j == 0)&&(current_height < (prev_ground_base_point_height + base_height_threshold) && current_height > (prev_ground_base_point_height - base_height_threshold)))
				{
					std::cout<<"  --22 --  ";
					tmp_ground_PointXYZIRT.push_back(in_radial_ordered_clouds[i][j]);
					current_ground = true;
					if (base_points_radius > 1.0)
					{
							prev_ground_base_point_radius = in_radial_ordered_clouds[i][j].radius;
							prev_ground_base_point_height = in_radial_ordered_clouds[i][j].point.z;
					}
				}else
				{
					// 想办法将与基点过近或过远的地面点，不满足上面条件找出来
					// 以最后一个地面点向前取几个点，这些点满足：这些点累计线段长度大于1.0,
					if (tmp_ground_PointXYZIRT.size() > 0)
					{
						bool is_find_points = false;
						float last_points_radius = 0.0f;
						float last_ground_height = 0.0f;
						
						for (size_t k = tmp_ground_PointXYZIRT.size() - 1; k > 0 ;k-- )
						{
							last_points_radius = in_radial_ordered_clouds[i][j].radius - tmp_ground_PointXYZIRT[k].radius;
							if ((last_points_radius > 1.0)&&(last_points_radius < 2.0))
							{
								is_find_points = true;
								last_ground_height = tmp_ground_PointXYZIRT[k].point.z;
								break;
							}else if (last_points_radius > 2.0)
							{
								break;
							}
						}
						if (is_find_points)// 找到1.0远处外一个地面点
						{
							
							float last_height_threshold = tan(DEG2RAD(local_max_slope_)) * last_points_radius;
							std::cout<<"["<<"l_p_r:"<<last_points_radius<<",l_g_h:"<<last_ground_height<<",c_h:"<<current_height<<",l_h_t:"<< last_height_threshold <<"]";
							if (current_height < (last_ground_height + last_height_threshold) && current_height > (last_ground_height - last_height_threshold))
							{
								std::cout<<"  -- 33 --  ";
								tmp_ground_PointXYZIRT.push_back(in_radial_ordered_clouds[i][j]);
								//再次更新基准点
								current_ground = true;
								if (base_points_radius > 1.0)
								{
										prev_ground_base_point_radius = in_radial_ordered_clouds[i][j].radius;
										prev_ground_base_point_height = in_radial_ordered_clouds[i][j].point.z;
								}
							}else
							{
								std::cout<<"  -- 44 --  ";
								current_ground = false;
							}
						}else
						{
							if ( current_height < tmp_ground_PointXYZIRT[tmp_ground_PointXYZIRT.size() - 1].point.z + 0.2 )
							{
								std::cout<<"  -- 55 --  ";
								current_ground = true;
								if (base_points_radius > 1.0)
								{
										prev_ground_base_point_radius = in_radial_ordered_clouds[i][j].radius;
										prev_ground_base_point_height = in_radial_ordered_clouds[i][j].point.z;
								}
							}else
							{
								std::cout<<"  -- 66 --  ";
								current_ground = false;
							}

						}
					}else
					{
						std::cout<<"  -- 77 --  ";
						current_ground = false;
					}
				}




				//current_ground = false;


			}
            if (current_ground)
            {
				std::cout<<" ground";
            	prev_ground_point_radius = in_radial_ordered_clouds[i][j].radius;
            	prev_ground_point_height = in_radial_ordered_clouds[i][j].point.z;
                out_ground_indices.indices.push_back(in_radial_ordered_clouds[i][j].original_index);
                prev_ground = true;
            }
            else
            {
				std::cout<<" no_ground";
                out_no_ground_indices.indices.push_back(in_radial_ordered_clouds[i][j].original_index);
                prev_ground = false;
            }
			prev_point = in_radial_ordered_clouds[i][j].point;
			std::cout<<endl;

        }*/
      /*if ((tmp_ground_PointXYZIRT.size() > 0)&&(tmp_no_ground_PointXYZIRT.size() > 0))
		{
			 //printf("ground_Size:%ld      no_ground_Size :%ld\n",tmp_ground_PointXYZIRT.size(),tmp_no_ground_PointXYZIRT.size());
			boost::shared_ptr<pcl::PointCloud<pcl::PointXYZI>> tmpPoints = boost::make_shared<pcl::PointCloud<pcl::PointXYZI>>();
			int ground_Size = tmp_ground_PointXYZIRT.size();
			int no_ground_Size = tmp_no_ground_PointXYZIRT.size();
			//tmpPoints->width = ground_Size + no_ground_Size;
			//tmpPoints->height = 1;
			//tmpPoints->points.resize(tmpPoints->width * tmpPoints->height);
			for (int i = 0; i < ground_Size ; i++)
			{
				//printf("ground:x;%f,y:%f,z:%f\n",tmp_ground_PointXYZIRT[i].point.x,tmp_ground_PointXYZIRT[i].point.y,tmp_ground_PointXYZIRT[i].point.z);
				tmpPoints->push_back(tmp_ground_PointXYZIRT[i].point);
			}
			for (int i = 0; i < no_ground_Size ; i++)
			{
				tmpPoints->push_back(tmp_no_ground_PointXYZIRT[i].point);
			}

			//建立kd数范围搜索
			boost::shared_ptr<pcl::KdTreeFLANN<pcl::PointXYZI>> kdtree = boost::make_shared<pcl::KdTreeFLANN<pcl::PointXYZI>>();
			kdtree->setInputCloud(tmpPoints);
			printf("ground_Size = %ld,no_ground_Size = %ld\n",ground_Size,no_ground_Size);
			for (size_t i = 0; i < ground_Size + no_ground_Size ; i++)
			{
				printf("i = %d 查询:x;%f,y:%f,z:%f\n",i,tmpPoints->points[i].x,tmpPoints->points[i].y,tmpPoints->points[i].z);
				std::vector<int> index;	  //索引
				std::vector<float> value; //值
				kdtree->radiusSearch((*tmpPoints)[i], 0.5, index, value);
				
				int ground_point_size = 0;
				int no_ground_point_size = 0;
				float avg_ground_point_height = 0.0f;
				float avg_no_ground_point_height = 0.0f;

				for (auto j:index)
				{
					
					if (j > ground_Size)
					{
						no_ground_point_size++;
						//printf("非地面:x;%f,y:%f,z:%f\n",tmpPoints->points[j].x,tmpPoints->points[j].y,tmpPoints->points[j].z);
						//std::cout<<"no_ground-->:"<<"x:"<<tmp_no_ground_PointXYZIRT[j].point.x<<",y:"<<tmp_no_ground_PointXYZIRT[j].point.y<<",z:"<<tmp_no_ground_PointXYZIRT[j].point.z << std::endl;;
					}else
					{
						ground_point_size ++;
						//printf("地面:x;%f,y:%f,z:%f\n",tmpPoints->points[j].x,tmpPoints->points[j].y,tmpPoints->points[j].z);

						//std::cout<<"ground-->:"<<"x:"<<tmp_ground_PointXYZIRT[j].point.x<<",y:"<<tmp_ground_PointXYZIRT[j].point.y<<",z:"<<tmp_ground_PointXYZIRT[j].point.z<< std::endl;
					}
				}
				//std::cout<<"no_ground_point_size:"<<no_ground_point_size<<",ground_point_size:"<<ground_point_size<<endl;
				double ground_probability = ground_point_size/(ground_point_size +no_ground_point_size);
				double no_ground_probability = 1- ground_probability;
				if (i < ground_Size)
				{
					if (no_ground_probability >= 0.7)
					{
						//printf("%d,",tmp_ground_PointXYZIRT[i].original_index);
						//tmp_ground_PointXYZIRT[i].original_index
						std::cout<<"地面 变为 非地面:"<<"x:"<<tmp_ground_PointXYZIRT[i].point.x<<",y:"<<tmp_ground_PointXYZIRT[i].point.y<<",z:"<<tmp_ground_PointXYZIRT[i].point.z<< std::endl;
						out_no_ground_indices.indices.push_back(tmp_ground_PointXYZIRT[i].original_index);
					}else
					{
						std::cout<<"保持地面属性:"<<"x:"<<tmp_ground_PointXYZIRT[i].point.x<<",y:"<<tmp_ground_PointXYZIRT[i].point.y<<",z:"<<tmp_ground_PointXYZIRT[i].point.z<< std::endl;
						out_ground_indices.indices.push_back(tmp_ground_PointXYZIRT[i].original_index);
					}
				}else
				{
					if (ground_point_size >= 0.7)
					{
						std::cout<<"非地面 变为 地面:"<<"x:"<<tmp_no_ground_PointXYZIRT[i - ground_Size].point.x<<",y:"<<tmp_no_ground_PointXYZIRT[i - ground_Size].point.y<<",z:"<<tmp_no_ground_PointXYZIRT[i - ground_Size].point.z<< std::endl;
						out_ground_indices.indices.push_back(tmp_no_ground_PointXYZIRT[i - ground_Size].original_index);
					}else
					{
						std::cout<<"保持非地面属性:"<<"x:"<<tmp_no_ground_PointXYZIRT[i - ground_Size].point.x<<",y:"<<tmp_no_ground_PointXYZIRT[i - ground_Size].point.y<<",z:"<<tmp_no_ground_PointXYZIRT[i - ground_Size].point.z<< std::endl;
						out_no_ground_indices.indices.push_back(tmp_no_ground_PointXYZIRT[i - ground_Size].original_index);
					}
				}
				//printf("===========\n");
			}
		}else
		{
			
			for (int i = 0 ; i < tmp_ground_PointXYZIRT.size() ; i++)
			{
				//printf("-------------------------\n");
				out_ground_indices.indices.push_back(tmp_ground_PointXYZIRT[i].original_index);
			}
			for (int i = 0 ; i < tmp_no_ground_PointXYZIRT.size() ; i++)
			{
				//printf("++++++++++++++++++++++++++\n");
				out_ground_indices.indices.push_back(tmp_no_ground_PointXYZIRT[i].original_index);
			}
		}*/
      //printf("tmp_ground_PointXYZIRT.size() = %ld\n",tmp_ground_PointXYZIRT.size());
      //printf("tmp_no_ground_PointXYZIRT.size() = %ld\n",tmp_no_ground_PointXYZIRT.size());
      tmp_ground_PointXYZIRT.clear();
    }

    //printf("out_ground_indices.size() = %ld\n",out_ground_indices.indices.size());
    //printf("out_no_ground_indices.size() = %ld\n",out_no_ground_indices.indices.size());

    //#pragma omp for
    /*
	float Hg = hg;
	float He = he;
    for (size_t i = 0; i < in_radial_ordered_clouds.size(); i++) //sweep through each radial division 遍历每一根射线
    {
		// 一段点云集计算
		float min_z = std::numeric_limits<float>::max();
		float max_z = -std::numeric_limits<float>::max();
		float start_radius = 0.0f;
		float end_radius = 0.0f;
		std::vector<PointXYZIRT> tmpPointXYZIRT;
		bool first_no_ground_point = true;
        for (size_t j = 0; j < in_radial_ordered_clouds[i].size(); j++) //loop through each point in the radial div
        {
			float points_distance = 0.0f;
			if (j!= 0)
			{
				points_distance = in_radial_ordered_clouds[i][j].radius - start_radius;
			}else
			{
				start_radius = in_radial_ordered_clouds[i][j].radius;
			}

			if ((points_distance <= 0.5))
			{
				if (in_radial_ordered_clouds[i][j].point.z  < min_z)
				{
					min_z = in_radial_ordered_clouds[i][j].point.z;
				}
				if (in_radial_ordered_clouds[i][j].point.z  > max_z)
				{
					max_z = in_radial_ordered_clouds[i][j].point.z;
				}
				end_radius = in_radial_ordered_clouds[i][j].radius;
				tmpPointXYZIRT.push_back(in_radial_ordered_clouds[i][j]);
			}else
			{
				float _hg = max_z - min_z;
				float _he = min_z - 0.0;
				float _base_ground_height = ((start_radius + end_radius)/2) * ground_k + ground_base;
				if (((_hg <= Hg )&&(_he <= (He + _base_ground_height)))||(max_z < _base_ground_height)) 
				{
					for (size_t k = 0; k < tmpPointXYZIRT.size() ; k++)
					{
						out_ground_indices.indices.push_back(tmpPointXYZIRT[k].original_index);
					}
				}else
				{
					if (tmpPointXYZIRT.size() > 1)
					{
						for (size_t k = 0; k < tmpPointXYZIRT.size() ; k++)
						{
							out_no_ground_indices.indices.push_back(tmpPointXYZIRT[k].original_index);
						}
						if (first_no_ground_point) // 第一个非地面点
						{
							out_road_boundary_indices.indices.push_back(tmpPointXYZIRT[0].original_index);
							first_no_ground_point = false;
						}
					}
				}
				tmpPointXYZIRT.clear();
				min_z = std::numeric_limits<float>::max();
				max_z = -std::numeric_limits<float>::max();
				if (in_radial_ordered_clouds[i][j].point.z  < min_z)
				{
					min_z = in_radial_ordered_clouds[i][j].point.z;
				}
				if (in_radial_ordered_clouds[i][j].point.z  > max_z)
				{
					max_z = in_radial_ordered_clouds[i][j].point.z;
				}
				start_radius = in_radial_ordered_clouds[i][j].radius;
				tmpPointXYZIRT.push_back(in_radial_ordered_clouds[i][j]);
			}
        }
		if (!tmpPointXYZIRT.empty())
		{
			float _hg = max_z - min_z;
			float _he = min_z - 0.0;
			float _base_ground_height = ((start_radius + end_radius)/2) * ground_k + ground_base;
			if (((_hg <= Hg )&&(_he <= (He + _base_ground_height)))||(max_z < _base_ground_height)) 
			{
				for (size_t k = 0; k < tmpPointXYZIRT.size() ; k++)
				{
					out_ground_indices.indices.push_back(tmpPointXYZIRT[k].original_index);
				}
			}else
			{
				if (tmpPointXYZIRT.size() > 1)
				{
					for (size_t k = 0; k < tmpPointXYZIRT.size() ; k++)
					{
						out_no_ground_indices.indices.push_back(tmpPointXYZIRT[k].original_index);
					}
					if (first_no_ground_point) // 第一个非地面点
					{
						out_road_boundary_indices.indices.push_back(tmpPointXYZIRT[0].original_index);
						first_no_ground_point = false;
					}
				}
			}
			tmpPointXYZIRT.clear();
		}
    }*/
  }

  void Manager::publish_cloud(const ros::Publisher &in_publisher,
                              const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud_to_publish_ptr)
  {
    sensor_msgs::PointCloud2 cloud_msg;
    pcl::toROSMsg(*in_cloud_to_publish_ptr, cloud_msg);
    cloud_msg.header.frame_id = "livox_frame";
    in_publisher.publish(cloud_msg);
  }
  // 去除nan点
  void Manager::removeNan(pcl::PointCloud<pcl::PointXYZI>::Ptr in, pcl::PointCloud<pcl::PointXYZI>::Ptr out)
  {
    std::vector<int> indices;
    pcl::removeNaNFromPointCloud(*in, *out, indices);
  }

  // 八叉树下采样
  void Manager::octreeVoxelGrid(float leafsize, pcl::PointCloud<pcl::PointXYZI>::Ptr in, pcl::PointCloud<pcl::PointXYZI>::Ptr out)
  {
    pcl::octree::OctreePointCloudSearch<pcl::PointXYZI> octree(10.0); //最小体素尺寸
    octree.setInputCloud(in);
    //载入点云后，八叉树会根据分辨率和点云的空间维度得到深度，并得到一个Bounding Box，即一个长方体盒子
    //它能将整个点云装在它的内部，也就相当于划分出来了点云的空间范围。
    //如果点云的空间范围我们是知道的，那么可以通过defineBoundingBox函数可以直接设定
    octree.defineBoundingBox();
    //octree.enableDynamicDepth (leafAggSize);
    octree.addPointsFromInputCloud();
    pcl::octree::OctreePointCloudPointVector<pcl::PointXYZI>::Iterator it;
    pcl::octree::OctreePointCloudPointVector<pcl::PointXYZI>::Iterator it_end = octree.leaf_end();
    pcl::IndicesPtr indexVector(new vector<int>);
    for (it = octree.leaf_begin(); it != it_end; ++it)
    {
      const pcl::octree::OctreeNode *node = it.getCurrentOctreeNode();
      if (node->getNodeType() == pcl::octree::LEAF_NODE)
      {
        CloudT::Ptr grid_voxel_cloud = boost::make_shared<CloudT>();
        const pcl::octree::OctreeContainerPointIndices &container = it.getLeafContainer();
        std::vector<int> points_indices;
        container.getPointIndices(points_indices);
        pcl::IndicesPtr indexVector = boost::make_shared<std::vector<int>>(points_indices);
        pcl::VoxelGrid<pcl::PointXYZI> pGrid;
        pGrid.setLeafSize(leafsize, leafsize, leafsize);
        pGrid.setInputCloud(in);
        pGrid.setIndices(indexVector);
        pGrid.filter(*grid_voxel_cloud);
        *out += *grid_voxel_cloud;
      }
    }
  };

  // 去掉 近原点的点
  void Manager::remove_close_pt(double min_distance, const pcl::PointCloud<pcl::PointXYZI>::Ptr in,
                                const pcl::PointCloud<pcl::PointXYZI>::Ptr out)
  {
    pcl::ExtractIndices<pcl::PointXYZI> cliper;

    cliper.setInputCloud(in);
    pcl::PointIndices indices;
#pragma omp parallel for
    for (size_t i = 0; i < in->points.size(); i++)
    {
      double distance = sqrt(in->points[i].x * in->points[i].x + in->points[i].y * in->points[i].y);

      if (distance < min_distance)
      {
#pragma omp critical
        indices.indices.push_back(i);
      }
    }
    cliper.setIndices(boost::make_shared<pcl::PointIndices>(indices));
    cliper.setNegative(true); //ture to remove the indices
    cliper.filter(*out);
  }

  // 去掉车身范围点
  void Manager::remove_close_pt(double minx, double miny, double maxx, double maxy, const pcl::PointCloud<pcl::PointXYZI>::Ptr in, const pcl::PointCloud<pcl::PointXYZI>::Ptr out)
  {
    skywell::CropBoxFilter crop;
    crop.setMinP(minx, miny, -100.0);
    crop.setMaxP(maxx, maxy, 100.0);
    crop.setNegative(true);
    crop.filter(in, out);
  }

  // 消减 上面点
  void Manager::clip_above(double clip_height, const pcl::PointCloud<pcl::PointXYZI>::Ptr in,
                           const pcl::PointCloud<pcl::PointXYZI>::Ptr out)
  {
    pcl::ExtractIndices<pcl::PointXYZI> cliper;

    cliper.setInputCloud(in);
    pcl::PointIndices indices;
//表示for循环体的代码将被多个线程并行执行
#pragma omp parallel for
    for (size_t i = 0; i < in->points.size(); i++)
    {
      if (in->points[i].z > clip_height)
      {
//用在一段代码临界区之前，保证每次只有一个OpenMP线程进入
#pragma omp critical
        indices.indices.push_back(i);
      }
    }
    cliper.setIndices(boost::make_shared<pcl::PointIndices>(indices));
    cliper.setNegative(true); //ture to remove the indices
    cliper.filter(*out);
  }

  /*
bool estimateGroundPlane(PointCloudXYZI::Ptr &in_cloud, PointCloudXYZI::Ptr &out_cloud,
                                   visualization_msgs::MarkerPtr &plane_marker, const float in_distance_thre)
{
    //plane segmentation
    pcl::SACSegmentation<pcl::PointXYZI> plane_seg;
    pcl::PointIndices::Ptr plane_inliers ( new pcl::PointIndices );
    pcl::ModelCoefficients::Ptr plane_coefficients ( new pcl::ModelCoefficients );
    plane_seg.setOptimizeCoefficients (true);
    plane_seg.setModelType ( pcl::SACMODEL_PLANE );
    plane_seg.setMethodType ( pcl::SAC_RANSAC );
    plane_seg.setDistanceThreshold ( in_distance_thre );
    plane_seg.setInputCloud ( in_cloud );
    plane_seg.segment ( *plane_inliers, *plane_coefficients );
    return true;
}*/

#define PAI 3.141592653
  void Manager::my_segment(CloudT::Ptr cloud)
  {
    float resolution = 1.0f;
    float Hg = 0.2f;
    float He = 0.8f;
    float Angle = 2.0f;
    pcl::octree::OctreePointCloudSearch<pcl::PointXYZI> octree(resolution);
    octree.setInputCloud(cloud);
    octree.defineBoundingBox();
    //octree.enableDynamicDepth (leafAggSize);
    octree.addPointsFromInputCloud();
    pcl::octree::OctreePointCloudPointVector<pcl::PointXYZI>::Iterator it;
    pcl::octree::OctreePointCloudPointVector<pcl::PointXYZI>::Iterator it_end = octree.leaf_end();
    unsigned int leaf_count = 0;
    double minx, miny, minz, maxx, maxy, maxz;
    octree.getBoundingBox(minx, miny, minz, maxx, maxy, maxz);
    //std::vector<int> indexVector;
    //pcl::PointIndices::Ptr inliers(new pcl::PointIndices());
    std::cout << "minx:" << minx << ",miny:" << miny << ",minz:" << minz << std::endl;
    std::cout << "maxx:" << maxx << ",maxy:" << maxy << ",maxy:" << maxy << std::endl;
    std::cout << "GetBranchCount() = " << octree.getBranchCount() << endl;
    std::cout << "GetLeafCount() = " << octree.getLeafCount() << endl;

    for (it = octree.leaf_begin(); it != it_end; ++it)
    {
      Eigen::Vector3f min_pt;
      Eigen::Vector3f max_pt;
      octree.getVoxelBounds(it, min_pt, max_pt);
      //std::cout<<"min_pt:"<<min_pt<<",max_pit:"<<max_pt<<endl;
      //std::cout<<"GetCurrentOctreeDepth() = "<<it.getCurrentOctreeDepth()<<endl;
      //std::cout<<"getNodeID() = "<<it.getNodeID()<<endl;

      const pcl::octree::OctreeNode *node = it.getCurrentOctreeNode();
      if (node->getNodeType() == pcl::octree::LEAF_NODE)
      {
        pcl::PointIndices::Ptr inliers(new pcl::PointIndices());
        const pcl::octree::OctreeContainerPointIndices &container = it.getLeafContainer();
        std::vector<int> tmpVector;
        container.getPointIndices(tmpVector);
        for (int i = 0; i < tmpVector.size(); i++)
        {
          inliers->indices.push_back(tmpVector[i]);
        }

        if (inliers->indices.size() > 0)
        {
          // 提取剩余点云
          pcl::PointCloud<pcl::PointXYZI>::Ptr myCloud(new pcl::PointCloud<pcl::PointXYZI>);
          pcl::ExtractIndices<pcl::PointXYZI> extract;
          // Extract the inliers
          extract.setInputCloud(cloud);
          extract.setIndices(inliers);
          extract.setNegative(true);
          extract.filter(*myCloud);

          sensor_msgs::PointCloud2 plane_cloud;
          pcl::toROSMsg(*myCloud, plane_cloud);
          plane_cloud.header.frame_id = "livox_frame";
          pub_ground.publish(plane_cloud);
        }

        float min_z = std::numeric_limits<float>::max();
        float max_z = -std::numeric_limits<float>::max();
        int min_p_i = 0;
        int max_p_i = 0;
        /*for (int i = 0; i < tmpVector.size() ; i++)
			{
				int index = tmpVector[i];
				if (cloud->points[index].z  < min_z)
				{
					min_z = cloud->points[index].z;
					min_p_i = index;
				}
				if (cloud->points[index].z  > max_z)
				{
					max_z = cloud->points[index].z;
					max_p_i = index;
				}
			}
			float _hg = max_z - min_z;
			float _he = max_z - 0.0;
			if (((_hg > Hg )||(_he > He))) 
			{
					for (int i = 0;i < tmpVector.size() ; i++)
					{
						inliers->indices.push_back(tmpVector[i]);
					}
			}*/
      }
      else
      {
      }
      //sleep(1);
    }
    //printf("\n");
    /*
	if (inliers->indices.size() > 0)
	{
		// 提取剩余点云
		pcl::PointCloud<pcl::PointXYZI>::Ptr myCloud (new pcl::PointCloud<pcl::PointXYZI>);
		pcl::ExtractIndices<pcl::PointXYZI> extract;
		// Extract the inliers
		extract.setInputCloud(cloud);
		extract.setIndices(inliers);
		extract.setNegative(true);
		extract.filter(*myCloud);

		sensor_msgs::PointCloud2 plane_cloud;
		pcl::toROSMsg(*myCloud, plane_cloud);
		plane_cloud.header.frame_id = "livox_frame";
		pub_ground.publish(plane_cloud);
	}*/
    //printf("leaf_count = %d\n",leaf_count);
  };

  /*
void Manager::ObjectToClusterMsg(boost::shared_ptr<std::vector<skywell::Object>> objs,perception::Cluster &cluster)
{
	for (auto& obj : *objs) {
		perception::Object  _object;
		_object.center.pos[0] = obj.transform(0);
		_object.center.pos[1] = obj.transform(1);
		_object.center.pos[2] = obj.transform(2);
		_object.width = obj.width;
		_object.height = obj.height;
		_object.depth = obj.depth;
		_object.rotate.x = obj.rotate.x();
		_object.rotate.y = obj.rotate.y();
		_object.rotate.z = obj.rotate.z();
		_object.rotate.w = obj.rotate.w();
		cluster.object.push_back(_object);
	}
};


void Manager::ToObstSet(ClusterVectorPtr midsave,perception::ObstSet &obstset,uint64_t stamp)
{
	for (size_t i = 0;i < midsave->size() ;i++ )
	{
		perception::ObstPointCloud _obstpointcloud;
		for (int index = 0; index < (*(*midsave)[i]).size() ;index++ )
		{
			perception::PointXYZI pointt;
			pointt.x = ((*(*midsave)[i])[index]).x;
			pointt.y = ((*(*midsave)[i])[index]).y;
			pointt.z = ((*(*midsave)[i])[index]).z;
			pointt.intensity = ((*(*midsave)[i])[index]).intensity;
			_obstpointcloud.points.push_back(pointt);
		}
		ros::Time ros_stamp((stamp/1000000),(stamp%1000000));
		_obstpointcloud.header.stamp = ros_stamp;
		obstset.obsts.push_back(_obstpointcloud);
	}
		printf("障碍物数目：%ld\n",midsave->size());
};
*/

  void Manager::plane_segment(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud)
  {
    //平面模型分割点云
    pcl::ModelCoefficients::Ptr coefficients(new pcl::ModelCoefficients);
    pcl::PointIndices::Ptr inliers(new pcl::PointIndices);
    pcl::SACSegmentation<PointT> seg;
    seg.setOptimizeCoefficients(true);
    seg.setModelType(pcl::SACMODEL_PLANE);
    seg.setMethodType(pcl::SAC_RANSAC);

    seg.setDistanceThreshold(0.2);
    seg.setInputCloud(in_cloud);
    seg.setMaxIterations(50);
    seg.setProbability(0.95);
    seg.segment(*inliers, *coefficients);
    if (0 == inliers->indices.size())
    {
      std::cout << "could not estimate a planar model for the given dataset." << std::endl;
    }
    CloudT::Ptr no_ground_cloud_ptr = boost::make_shared<CloudT>();
    CloudT::Ptr ground_cloud_ptr = boost::make_shared<CloudT>();

    // 提取点云地面
    pcl::ExtractIndices<PointT> extract;
    extract.setInputCloud(in_cloud);
    extract.setIndices(boost::make_shared<const pcl::PointIndices>(*inliers)); //设置索引
    extract.filter(*ground_cloud_ptr);
    // 障碍物点云提取
    extract.setNegative(true);
    extract.filter(*no_ground_cloud_ptr);

    publish_cloud(pub_ground, ground_cloud_ptr);
    publish_cloud(pub_no_ground, no_ground_cloud_ptr);
  };

  void Manager::ProgressiveMorphologicalFilter(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud)
  {
    float max_w_s = 2.0f;
    float slope = 0.3f;
    float initial_d = 0.2f;
    float max_d = 0.2f;
    float cell_size = 0.1f;
    CloudT::Ptr no_ground_cloud_ptr = boost::make_shared<CloudT>();
    CloudT::Ptr ground_cloud_ptr = boost::make_shared<CloudT>();
    pcl::PointIndicesPtr ground(new pcl::PointIndices);

    // Create the filtering object
    pcl::ProgressiveMorphologicalFilter<PointT> pmf;
    pmf.setInputCloud(in_cloud);
    pmf.setMaxWindowSize(max_w_s);
    pmf.setSlope(slope);
    pmf.setCellSize(cell_size);
    //pmf.setBase(2.0f);
    pmf.setInitialDistance(initial_d);
    pmf.setMaxDistance(max_d);
    pmf.extract(ground->indices);
    // Create the filtering object
    pcl::ExtractIndices<PointT> extract;
    extract.setInputCloud(in_cloud);
    extract.setIndices(ground);
    extract.filter(*ground_cloud_ptr);

    extract.setNegative(true);
    extract.filter(*no_ground_cloud_ptr);

    publish_cloud(pub_ground, ground_cloud_ptr);
    publish_cloud(pub_no_ground, no_ground_cloud_ptr);
  }

  /*
void::Manager gridFilter(const pcl::PointCloud<pcl::PointXYZI>::Ptr in_cloud);
{
	float grid_size = 0.2f;
	float height_threshold = 0.5f;

}*/

  /*


template <typename PointT> void
pcl::applyMorphologicalOperator (const typename pcl::PointCloud<PointT>::ConstPtr &cloud_in,
                                 float resolution, const int morphological_operator,
                                 pcl::PointCloud<PointT> &cloud_out)
{
  if (cloud_in->empty ())
    return;

  pcl::copyPointCloud<PointT, PointT> (*cloud_in, cloud_out);

  pcl::octree::OctreePointCloudSearch<PointT> tree (resolution);

  tree.setInputCloud (cloud_in);
  tree.addPointsFromInputCloud ();

  float half_res = resolution / 2.0f;

  switch (morphological_operator)
  {
    case MORPH_DILATE:
    case MORPH_ERODE:
    {
      for (size_t p_idx = 0; p_idx < cloud_in->points.size (); ++p_idx)
      {
        Eigen::Vector3f bbox_min, bbox_max;
        std::vector<int> pt_indices;
        float minx = cloud_in->points[p_idx].x - half_res;
        float miny = cloud_in->points[p_idx].y - half_res;
        float minz = -std::numeric_limits<float>::max ();
        float maxx = cloud_in->points[p_idx].x + half_res;
        float maxy = cloud_in->points[p_idx].y + half_res;
        float maxz = std::numeric_limits<float>::max ();
        bbox_min = Eigen::Vector3f (minx, miny, minz);
        bbox_max = Eigen::Vector3f (maxx, maxy, maxz);
        tree.boxSearch (bbox_min, bbox_max, pt_indices);

        if (pt_indices.size () > 0)
        {
          Eigen::Vector4f min_pt, max_pt;
          pcl::getMinMax3D<PointT> (*cloud_in, pt_indices, min_pt, max_pt);

          switch (morphological_operator)
          {
            case MORPH_DILATE:
            {
              cloud_out.points[p_idx].z = max_pt.z ();
              break;
            }
            case MORPH_ERODE:
            {
              cloud_out.points[p_idx].z = min_pt.z ();
              break;
            }
          }
        }
      }
      break;
    }
    case MORPH_OPEN:
    case MORPH_CLOSE:
    {
      pcl::PointCloud<PointT> cloud_temp;

      pcl::copyPointCloud<PointT, PointT> (*cloud_in, cloud_temp);

      for (size_t p_idx = 0; p_idx < cloud_temp.points.size (); ++p_idx)
      {
        Eigen::Vector3f bbox_min, bbox_max;
        std::vector<int> pt_indices;
        float minx = cloud_temp.points[p_idx].x - half_res;
        float miny = cloud_temp.points[p_idx].y - half_res;
        float minz = -std::numeric_limits<float>::max ();
        float maxx = cloud_temp.points[p_idx].x + half_res;
        float maxy = cloud_temp.points[p_idx].y + half_res;
        float maxz = std::numeric_limits<float>::max ();
        bbox_min = Eigen::Vector3f (minx, miny, minz);
        bbox_max = Eigen::Vector3f (maxx, maxy, maxz);
        tree.boxSearch (bbox_min, bbox_max, pt_indices);

        if (pt_indices.size () > 0)
        {
          Eigen::Vector4f min_pt, max_pt;
          pcl::getMinMax3D<PointT> (cloud_temp, pt_indices, min_pt, max_pt);

          switch (morphological_operator)
          {
            case MORPH_OPEN:
            {
              cloud_out.points[p_idx].z = min_pt.z ();
              break;
            }
            case MORPH_CLOSE:
            {
              cloud_out.points[p_idx].z = max_pt.z ();
              break;
            }
          }
        }
      }

      cloud_temp.swap (cloud_out);

      for (size_t p_idx = 0; p_idx < cloud_temp.points.size (); ++p_idx)
      {
        Eigen::Vector3f bbox_min, bbox_max;
        std::vector<int> pt_indices;
        float minx = cloud_temp.points[p_idx].x - half_res;
        float miny = cloud_temp.points[p_idx].y - half_res;
        float minz = -std::numeric_limits<float>::max ();
        float maxx = cloud_temp.points[p_idx].x + half_res;
        float maxy = cloud_temp.points[p_idx].y + half_res;
        float maxz = std::numeric_limits<float>::max ();
        bbox_min = Eigen::Vector3f (minx, miny, minz);
        bbox_max = Eigen::Vector3f (maxx, maxy, maxz);
        tree.boxSearch (bbox_min, bbox_max, pt_indices);

        if (pt_indices.size () > 0)
        {
          Eigen::Vector4f min_pt, max_pt;
          pcl::getMinMax3D<PointT> (cloud_temp, pt_indices, min_pt, max_pt);

          switch (morphological_operator)
          {
            case MORPH_OPEN:
            default:
            {
              cloud_out.points[p_idx].z = max_pt.z ();
              break;
            }
            case MORPH_CLOSE:
            {
              cloud_out.points[p_idx].z = min_pt.z ();
              break;
            }
          }
        }
      }
      break;
    }
    default:
    {
      PCL_ERROR ("Morphological operator is not supported!\n");
      break;
    }
  }

  return;
}*/

} // namespace skywell
