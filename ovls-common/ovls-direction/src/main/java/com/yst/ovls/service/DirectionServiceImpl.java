package com.yst.ovls.service;

import java.util.List;

import com.yst.ovls.dao.SubjectMapper;
import com.yst.ovls.entity.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;

import com.yst.ovls.dao.DirectionMapper;
import com.yst.ovls.entity.Direction;
import com.yst.ovls.remote.courseRemote;

@Service
public class DirectionServiceImpl implements DirectionService {

	@Autowired
	private DirectionMapper directionDao;

    @Autowired
    private SubjectMapper subjectDao;
	
	/*@Autowired
	private RestTemplate restTemplate;*/
	
	@Autowired
	private courseRemote courseService;
	
	/** 方向+学科*//* 使用restTemplate的方法
	public Object loadDirections() {
		//利用MyBatis关联映射@Many加载相关的Subject学科数据，自动填充到Direction类的subjects属性中
		List<Direction> list = directionDao.selectAll();
		//循环为每个Direction加载相关的课程信息
		for(Direction d:list){
			//调用/course/free服务加载direction对象信息,返回List<HashMap>
			String url = "http://localhost:9526/course/directionRec?size=3&directionId=" + d.getId();
			List courses = restTemplate.getForObject(url, List.class);
			d.setCourses(courses);
		}
		return list;
	}*/
	
	/** 方向+学科 使用远程接口*/
	public Object loadDirections() {
		//利用MyBatis关联映射@Many加载相关的Subject学科数据，自动填充到Direction类的subjects属性中
		List<Direction> list = directionDao.selectAll();

		//循环为每个Direction加载相关的课程信息
		for(Direction d:list){
			Integer directionId = d.getId();
			List courses = (List) courseService.loadDirectionRec(3, directionId);
			d.setCourses(courses);
		}
		return list;
	}

	/*
	* @Description：
	* @Author： yanshitong
	* @Date： 2019/3/23 3:47
	* @Param：[]
	* @Return： java.lang.Object
	* @Exception： 获取所有学科信息
	*/
    @Override
    public Object getSubject() {
	    List<Subject> list = subjectDao.selectSubject();
        return list;
    }


    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 0:23
    * @Param：[]
    * @Return： java.lang.Object
    * @Exception： 从数据库中获得所有方向信息
    */
    @Override
    public Object getDirection() {
        List<Direction> list = directionDao.selectAll();
        return list;
    }


    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 0:53
    * @Param：[id]
    * @Return： java.lang.Object
    * @Exception： 根据id 删除对应的方向
    */
    @Override
    public Object deleteDirection(Integer id) {
        int i = directionDao.deleteByPrimaryKey(id);
        return i;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 0:54
    * @Param：[direction]
    * @Return： java.lang.Object
    * @Exception： 根据传入信息 将方向插入到数据库中
    */
    @Override
    public Object addDirection(Direction direction) {
        int i = directionDao.insert(direction);
        return i;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 1:12
    * @Param：[id]
    * @Return： java.lang.Object
    * @Exception： 删除数据库中的某个学科
    */
    @Override
    public Object deleteSubject(Integer id) {
        int i = subjectDao.deleteByPrimaryKey(id);
        return i;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 1:15
    * @Param：[subject]
    * @Return： java.lang.Object
    * @Exception： 往数据库中添加一条学科信息
    */
    @Override
    public Object addSubject(Subject subject) {
        int i = subjectDao.insert(subject);
        return i;
    }


}
