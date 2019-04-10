package com.yst.ovls.controller;

import com.yst.ovls.entity.CollectCourse;
import com.yst.ovls.entity.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.yst.ovls.service.CourseService;

//@CrossOrigin(origins = "*", methods = { RequestMethod.GET, RequestMethod.POST }) // 接收AJAX跨域请求
@RestController
public class CourseController {

	@Autowired
	private CourseService courseService;

	/** 根据id查询课程 */
	@GetMapping("/course/{id}")
	public Object loadCourse(@PathVariable("id") int id) {
		return courseService.loadCourseById(id);
	}

	/** 查询免费好课 */
	@GetMapping("/course/free")
	// 允许前端页面不传入size，默认size=5
	public Object loadFreeCourse(@RequestParam(name = "size", required = false, defaultValue = "5") int size) {
		return courseService.loadFreeCourse(size);
	}

	/** 课程推荐 */
	@GetMapping("/course/recommendation")
	// 允许前端页面不传入size，默认size=5
	public Object loadCourseRecommendation(
			@RequestParam(name = "size", required = false, defaultValue = "5") int size) {
		return courseService.loadCourseRecommendation(size);
	}

	/** 菜单页方向 推荐课程 */
	@GetMapping("/course/directionRec")
	// 允许前端页面不传入size，默认size=5
	public Object loadDirectionRec(@RequestParam(name = "size", required = false, defaultValue = "5") int size,
			@RequestParam("directionId") int directionId) {
		return courseService.loadDirectionRecService(directionId, size);
	}

	/** 模糊查询 */
	@GetMapping("/course/findCourseByName")
	// 允许前端页面不传入size，默认size=5
	public Object findCourseByName(@RequestParam(name = "size", required = false, defaultValue = "5") int size,
			String name) {
		return courseService.selectCourseByName(size, name);
	}

	/** 首页课程展示(价格)*/
	@GetMapping("/course/select/subjectIdPrice")
	public Object selectCourseBySubjectId(int size,int subjectId){
		return courseService.selectCourseBySubjectIdPrice(size,subjectId);
	}
	/** 首页课程展示(评分)*/
	@GetMapping("/course/select/subjectIdScore")
	public Object selectCourseBySubjectIdScore(int size,int subjectId){
		return courseService.selectCourseBySubjectIdScore(size,subjectId);
	}
	/** 最新最热排序*/
	@GetMapping("/course/active")
	public Object loadCourseByActive(
		Integer id,
		@RequestParam(name="i",required=false,defaultValue="1")int i,
		@RequestParam(name="pageNum",required=false,defaultValue="1")int pageNum){
		return courseService.loadByActive(id, i,pageNum);
	}
	
	/** 推荐课程*/
	@GetMapping("/course/select/tuijian")
	public Object selectCourseTuiJian(@RequestParam(name = "size", required = false, defaultValue = "5")int size,Integer cId){
		return courseService.loadByTuiJian(cId, size);
	}

	/*
	* @Description：
	* @Author： yanshitong
	* @Date： 2019/3/19 23:33
	* @Param：[collectCourse]
	* @Return： java.lang.Object
	* @Exception： 添加课程学习记录
	*/
	@PostMapping("/add/collectCourse")
    public Object collectCourse(CollectCourse collectCourse){
	    return courseService.addCollectCourse(collectCourse);
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/19 23:35
    * @Param：[userId, size]
    * @Return： java.lang.Object
    * @Exception： 根据用户ID展示学习记录
    */
    @GetMapping("/get/collectCourse")
    public Object getCollectCourse(Integer userId,@RequestParam(name = "size", required = false, defaultValue = "10")int size){
	    return  courseService.selectCollectCourse(userId,size);
    }


    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/23 0:17
    * @Param：[]
    * @Return： java.lang.Object
    * @Exception： 获取所有课程
    */
    @GetMapping("/get/courses")
    public Object getCourses(){
        return  courseService.getCourses();
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/23 0:18
    * @Param：[id]
    * @Return： java.lang.Object
    * @Exception： 根据课程id 删除此课程 返回0失败 1成功
    */
    @DeleteMapping("/delete/course")
    public Object deleteCourse(Integer id){
        return courseService.deleteCourse(id);
    }
    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/23 0:20
    * @Param：[course]
    * @Return： java.lang.Object
    * @Exception： 添加课程 返回0失败 1成功
    */
    @PostMapping("/add/course")
    public Object addCourse(Course course){
        return courseService.addCourse(course);
    }
}
