package com.yst.ovls.service;

import com.yst.ovls.entity.CollectCourse;
import com.yst.ovls.entity.Course;

public interface CourseService {

	/** 通过ID加载视频*/
	public Object loadCourseById(int id);
	
	/** 通过传入size显示免费好课的分页*/
	public Object loadFreeCourse(int size);
	/** 课程推荐显示*/
	public Object loadCourseRecommendation(int size); 
	/** 菜单页方向    推荐课程*/
	public Object loadDirectionRecService(int directionId, int size); 
	
	/** 根据输入模糊查找*/
	public Object selectCourseByName(int size, String name);
	
	/** 学科课程展示(价格)*/
	public Object selectCourseBySubjectIdPrice(int size,int subjectId); 
	
	/** 学科课程展示(评分)*/
	public Object selectCourseBySubjectIdScore(int size,int subjectId);
	/**最热、最新  引入了subject和direction表*/
	public Object loadByActive(Integer id,int i,int pageNum);
	
	/** 根据课程id得到学科id 根据学科id列出排行 推荐课程*/
	public Object loadByTuiJian(Integer cid,int size);

	/** 根据用户id 和 课程id 收藏课程*/
	public Object addCollectCourse(CollectCourse collectCourse);

	/** 根据用户id 查询收藏的课程*/
	public Object selectCollectCourse(Integer userId,int size);

	/** 后台管理获取所有课程*/
	public Object getCourses();

	/** 后台管理 根据课程id删除课程*/
	public Object deleteCourse(Integer id);

	/** 后台管理 添加课程*/
	public Object addCourse(Course course);
}
