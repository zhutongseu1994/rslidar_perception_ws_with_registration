//
// Created by hl on 2020/11/17.
//
#ifndef _GRID_H_
#define _GRID_H_

#include <pcl/point_cloud.h>
#include <pcl/point_types.h>

typedef pcl::PointXYZI PointT;
typedef pcl::PointCloud<PointT> CloudT;

class Grid 
{
	public:
		typename pcl::PointCloud<PointT> grid_cloud;
		pcl::PointIndices grid_inliers;
		float min_z = std::numeric_limits<float>::max();
		float max_z = -std::numeric_limits<float>::max();
		float height;
		float ground_height = 0.0;// 仅当ground_flag = 1,且check_flag = 0的时候使用。
		int size = 0;
		bool isvaild = false;
	public:
		int ground_flag = -1;// -1,未判断出结果，0，全部为地面点，1，绝对包含障碍物点
		int check_flag = -1;// 校验标志，-1，为校验过，0:检验过
		int index = 0;
		int col = 0;
		int row = 0;
	public:
		float process(void)
		{
			size = grid_cloud.points.size();
			for (int i = 0;i < size ; ++i)
			{
				if (grid_cloud.points[i].z < min_z)
				{
					min_z = grid_cloud.points[i].z;
				}
				if (grid_cloud.points[i].z > max_z)
				{
					max_z = grid_cloud.points[i].z;
				}
			}
			height = max_z - min_z;
			return height;
		};
};
class GridCloud
{
	public:
		void setInputCloud(pcl::PointCloud<PointT>::Ptr cloud)
		{
			in_cloud_ptr = cloud;
		};
		void setGridRange(float minx,float miny,float maxx,float maxy)
		{
			_minx = minx;
			_miny = miny;
			_maxx = maxx;
			_maxy = maxy;
		};
		void setGridSize(float size)
		{
			_size = size;
		};
		void setHeighThreshold(float height_threshold)
		{
			_height_threshold = height_threshold;
		}

		void initGrid(void)
		{
			col = (_maxx - _minx)/_size;
			row = (_maxy - _miny)/_size;
			//printf("col = %d,row = %d\n",col,row);
			int gridsize = col*row;
			_GridList.resize(gridsize);
		}
		void zeroGrid(void)
		{
			int gridsize = _GridList.size();
			#pragma omp parallel for
			for (int i = 0; i < gridsize; ++i)
			{
				_GridList[i].grid_cloud.points.clear();
				_GridList[i].grid_inliers.indices.clear();
				_GridList[i].isvaild = false;
			}
		}
		void process(void)
		{
			size_t pointsize = in_cloud_ptr->points.size();
			for (size_t i = 0; i < pointsize ; ++i)
			{
				if ((in_cloud_ptr->points[i].x > _minx)&&
					(in_cloud_ptr->points[i].x < _maxx)&&
					(in_cloud_ptr->points[i].y > _miny)&&
					(in_cloud_ptr->points[i].y < _maxy))
				{
					int col_ = (_maxx - in_cloud_ptr->points[i].x)/_size;
					int row_ = (_maxy - in_cloud_ptr->points[i].y)/_size;
					int index = col_ * row + row_;
					if (_GridList[index].isvaild == false)
					{
						_GridList[index].col = col_;
						_GridList[index].row = row_;
						_GridList[index].index = index;
						_GridList[index].isvaild = true;
					}
					_GridList[index].grid_cloud.points.push_back(in_cloud_ptr->points[i]);
					_GridList[index].grid_inliers.indices.push_back(i);
				}
			}
		}

		void getOrigin(int &col_,int &row_)
		{
			 col_ = (_maxx - 0.0)/_size;
			 row_ = (_maxy - 0.0)/_size;
		}
		
		void checkGrid(int col_,int row_,int &index_ )
		{
			
			int index = col_*row + row_;
			if ((_GridList[index].isvaild == false) || (_GridList[index].ground_flag == 0))
			{
				return ;
			}else
			{
				if (_GridList[index].ground_flag == 1)
				{
					// 满足条件包含障碍物点云,以栅格周围地面点为参照，去除本栅格内地面点
					std::vector<int> indexs;
					getRangeIndex(col_,row_,indexs);
					float avg_max_z = 0.0;
					int ground_block_num = 0;
					int ground_index = -1;
					for (auto num : indexs )
					{
						if (_GridList[num].isvaild == false)
						{
							continue;
						}else
						{
							if (_GridList[num].ground_flag == 0)
							{
								ground_index = num;
								ground_block_num ++;
								if (_GridList[num].max_z > avg_max_z)
								{
									avg_max_z =_GridList[num].max_z;
								}
								
								
							}else if ((_GridList[num].ground_flag == 1) && (_GridList[num].check_flag == 0))
							{
								ground_block_num ++;
								if (_GridList[num].ground_height > avg_max_z)
								{
									avg_max_z =_GridList[num].ground_height;
								}
								
							}
						}
					}
					//avg_max_z = avg_max_z/ground_block_num;
					
					if (ground_index == -1)
					{
						if (index_ != -1)
						{
							ground_index = index_;
						}
					}else
					{
						index_ = ground_index;
					}
					if (ground_block_num != 0)// 周边有地面栅格或者判断过的块
					{
						for (int i = 0; i < _GridList[index].size ; ++i)
						{
							if (_GridList[index].grid_cloud.points[i].z < avg_max_z + _height_threshold)
							{
								 // 并没有从原来的栅格中删除，考虑可能耗时,也没有添加点，只是添加了点的索引，都是为了减少耗时
								_GridList[ground_index].grid_inliers.indices.push_back(_GridList[index].grid_inliers.indices[i]);
								if (_GridList[index].grid_cloud.points[i].z > _GridList[index].ground_height)
								{
									_GridList[index].ground_height = _GridList[index].grid_cloud.points[i].z;
								}
								_GridList[index].check_flag = 0;
							}
						}
					}else
					{
						if (index_ != -1)
						{
						// 栅格周围没有找到地面块
							for (int i = 0; i < _GridList[index].size ; ++i)
							{
								if (_GridList[index].grid_cloud.points[i].z < _GridList[index_].max_z + _height_threshold)
								{
									//先任意找一个地面块暂存，这个地面块，由原点提供
									_GridList[index_].grid_inliers.indices.push_back(_GridList[index].grid_inliers.indices[i]);
								if (_GridList[index].grid_cloud.points[i].z > _GridList[index].ground_height)
								{
									_GridList[index].ground_height = _GridList[index].grid_cloud.points[i].z;
								}
									_GridList[index].check_flag = 0;
								}
							}
						}
						_GridList[index].ground_flag = 1;
					}
				}else{
					// 未知情况,以周围地面点为参照，按照一定高度阀值去除点云
					std::vector<int> indexs;
					getRangeIndex(col_,row_,indexs);
					float avg_max_z = 0.0;
					int ground_block_num = 0;
					int ground_index = -1;
					for (auto num : indexs )
					{
						if (_GridList[num].isvaild == false)
						{
							continue;
						}else
						{
							if (_GridList[num].ground_flag == 0)
							{
								ground_index = num;
								ground_block_num ++;
								if (_GridList[num].max_z > avg_max_z)
								{
									avg_max_z = _GridList[num].max_z;
								}
							}else if ((_GridList[num].ground_flag == 1) && (_GridList[num].check_flag == 0))
							{
								ground_block_num ++;
								if (_GridList[num].ground_height > avg_max_z)
								{
									avg_max_z = _GridList[num].ground_height;
								}
							}
						}
					}
					//avg_max_z = avg_max_z/ground_block_num;

					if (ground_index == -1)
					{
						if (index_ != -1)
						{
							ground_index = index_;
						}
					}else
					{
						index_ = ground_index;
					}
					if (ground_block_num != 0) // 周边有地面栅格
					{
						if (_GridList[index].max_z < avg_max_z + _height_threshold)
						{
							_GridList[index].ground_flag = 0;
							index_ = index;
						}else
						{
							for (int i = 0; i < _GridList[index].size ; ++i)
							{
								if (_GridList[index].grid_cloud.points[i].z < avg_max_z + _height_threshold)
								{
									 // 并没有从原来的栅格中删除，考虑可能耗时,也没有添加点，只是添加了点的索引，都是为了减少耗时
									_GridList[ground_index].grid_inliers.indices.push_back(_GridList[index].grid_inliers.indices[i]);
									if (_GridList[index].grid_cloud.points[i].z > _GridList[index].ground_height)
									{
										_GridList[index].ground_height = _GridList[index].grid_cloud.points[i].z;
									}
									_GridList[index].check_flag = 0;
								}
							}
							_GridList[index].ground_flag = 1;
						}
					}else
					{
						// 栅格周围没有找到地面块，只去除0.2以下的地面点
						if (index_ != -1)
						{
						// 栅格周围没有找到地面块，只去除0.2以下的地面点
							for (int i = 0; i < _GridList[index].size ; ++i)
							{
								if (_GridList[index].grid_cloud.points[i].z < _GridList[index_].max_z + _height_threshold)
								{
									//先任意找一个地面块暂存，这个地面块，由原点提供
									_GridList[index_].grid_inliers.indices.push_back(_GridList[index].grid_inliers.indices[i]);
									if (_GridList[index].grid_cloud.points[i].z > _GridList[index].ground_height)
									{
										_GridList[index].ground_height = _GridList[index].grid_cloud.points[i].z;
									}
									_GridList[index].check_flag = 0;
								}
							}
						}
						_GridList[index].ground_flag = 1;
					
					}
				}
			}
		};

		void segment(pcl::PointIndices &out_indices)
		{
			int gridsize = _GridList.size();
			for (int i = 0; i < gridsize ; ++i)
			{
				if (_GridList[i].isvaild)
				{
					float abs_height = _GridList[i].process();
					if (abs_height > 1.0)
					{
						// 假设满足条件的绝对包含障碍物点云
						_GridList[i].ground_flag = 1;
					}else if ((abs_height < 0.3)&&(_GridList[i].min_z < 0.3))
					{
						_GridList[i].ground_flag = 0;
						//假设满足条件的绝对是地面点云
					}else{
						_GridList[i].ground_flag = -1;
						// 初步判断不出结果
					}
				}
			}
			//计算原点所在的位置
			int col_ = -1,row_ = -1,index_ = -1;
			getOrigin(col_,row_);
			// 先向上判断
			for (int i = col_; i > 0; --i)
			{
				// 先向左判断
				for (int j = row_; j > 0 ; -- j)
				{
					checkGrid(i,j,index_);
				}
				// 在向右判断
				for (int j = row_+1 ;j< row ; ++j)
				{
					checkGrid(i,j,index_);
				}
			}
			// 再向下判断
			for (int i = col_+1; i < col; ++ i)
			{
				// 先向左判断
				for (int j = row_; j > 0 ; -- j)
				{
					checkGrid(i,j,index_);
				}
				// 在向右判断
				for (int j = row_+1 ;j< row ; ++j)
				{
					checkGrid(i,j,index_);
				}
			}
			for (int i = 0; i < gridsize ; ++i)
			{
				//int i = 19950;
				if ((_GridList[i].isvaild)&&(_GridList[i].ground_flag == 0))
				{
					out_indices.indices.insert(out_indices.indices.end(),_GridList[i].grid_inliers.indices.begin(),_GridList[i].grid_inliers.indices.end());
				}
			}
		};
	private:
		int getindex(int col_,int row_)
		{
			if ((col_>= 0)&&(col_<= col) && (row_ >= 0) && (row_ <= row))
			{
				return (col_* row + row_);
			}
			return -1;
		};
		void getRangeIndex(int col_,int row_ ,std::vector<int>  &index_vec)
		{
			//查找周围八个栅格
			int index = -1;
			index = getindex(col_,row_-1);
			if (index != -1)
			{
				index_vec.push_back(index);
			}
			index = getindex(col_-1,row_ -1);
			if (index != -1)
			{
				index_vec.push_back(index);
			}
			index = getindex(col_-1,row_);
			if (index != -1)
			{
				index_vec.push_back(index);
			}
			index = getindex(col_ - 1,row_ + 1);
			if (index != -1)
			{
				index_vec.push_back(index);
			}
			index = getindex(col_ ,row_ + 1);
			if (index != -1)
			{
				index_vec.push_back(index);
			}
			index = getindex(col_ + 1,row_ + 1);
			if (index != -1)
			{
				index_vec.push_back(index);
			}
			index = getindex(col_ + 1,row_);
			if (index != -1)
			{
				index_vec.push_back(index);
			}
			index = getindex(col_ + 1,row_ - 1);
			if (index != -1)
			{
				index_vec.push_back(index);
			}
		};
	private:
		typename pcl::PointCloud<PointT>::Ptr in_cloud_ptr {new pcl::PointCloud<PointT>()};
		float _minx,_miny,_maxx,_maxy;
		float _size = 0;
		float _height_threshold = 0.2;
	public:
		int col = 0;
		int row = 0;;
		std::vector<Grid> _GridList;
};



#endif
