package com.yst.ovls.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;

import com.yst.ovls.dao.CollectCourseMapper;
import com.yst.ovls.dao.SubjectMapper;
import com.yst.ovls.entity.CollectCourse;
import com.yst.ovls.entity.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yst.ovls.Util.ErrorResult;
import com.yst.ovls.dao.CourseMapper;
import com.yst.ovls.entity.Course;
import com.yst.ovls.util.FastDFSClient;
import sun.misc.BASE64Decoder;

@Service
public class CourseServiceImp implements CourseService {

	@Autowired
	private CourseMapper courseDao;// 注入DAO
    @Autowired
    private CollectCourseMapper collectCourseDao;// 注入DAO
    @Autowired
    private SubjectMapper subjectDao;// 注入DAO

	/** 通过ID加载视频的逻辑 */
	@Override
	public Object loadCourseById(int id) {
		Course course = courseDao.selectByPrimaryKey(id);
		if (course == null) {
			ErrorResult result = new ErrorResult();
			result.setCode(1);
			result.setMsg("未找到记录");
			return result;
		}
		return course;
	}

	/** 通过传入size显示免费好课的分页 逻辑 */
	@Override
	public Object loadFreeCourse(int size) {

		PageHelper.startPage(1, size);// 显示一页，每页显示的数据量由用户决定
		List<Course> list = courseDao.selectFreeCourse();
		return list;
	}

	/** 课程推荐显示 逻辑 */
	@Override
	public Object loadCourseRecommendation(int size) {
		PageHelper.startPage(1, size);// 显示一页，每页显示的数据量由用户决定
		List<Course> list = courseDao.selectCourseRecommendation();
		return list;
	}

	/** 菜单页方向    推荐课程*/
	@Override
	public Object loadDirectionRecService(int directionId, int size) {
		PageHelper.startPage(1, size);// 显示一页，每页显示的数据量由用户决定
		List<Course> list = courseDao.selectDirectionRec(directionId);
	
		return list;
	}

	/** 模糊查询*/
	@Override
	public Object selectCourseByName(int size, String name) {
		ErrorResult error = new ErrorResult();
		PageHelper.startPage(1, size);// 显示一页，每页显示的数据量由用户决定
		List<Course> list = courseDao.selectCourseByName(name);
		if (list.isEmpty()) {
			error.setCode(4);
			error.setMsg("查无结果"); 
			return error;
			
		}
	/*	for (Course course : list) {
			System.out.println(course.getId()+" "+course.getName());
		}*/
		return list;
	}

	/** 学科课程展示(价格)*/
	@Override
	public Object selectCourseBySubjectIdPrice(int size,int subjectId) {
		PageHelper.startPage(1, size);
		List<Course> list = courseDao.selectCourseBySubjectIdPrice(subjectId);
		return list;
	}


	/** 学科课程展示(评分)*/
	@Override
	public Object selectCourseBySubjectIdScore(int size,int subjectId) {
		PageHelper.startPage(1, size);
		List<Course> list = courseDao.selectCourseBySubjectIdScore(subjectId);
		return list;
	}

	/**最热,最新 */
	@Override
	public Object loadByActive(Integer id,int i,int pageNum) {
		int sum=0; 
		if(i==1){
			//获得总条数
			List<Course> sumTest = courseDao.selectBySubjectId(id);
			sum = sumTest.size();
			PageHelper.startPage(pageNum, 5);
			List<Course> list = courseDao.selectBySubjectId(id);
			Map<String, Object> map = new HashMap<>();
			map.put("sum", sum);
			map.put("i", i);
			map.put("pageNum", pageNum);
			map.put("list", list);
			map.put("size", list.size());
			return map;
		}else{
			//获得总条数
			List<Course> sumTest = courseDao.selectByActive(id);
			sum = sumTest.size();
			PageHelper.startPage(pageNum, 5);
			List<Course> list = courseDao.selectByActive(id);
			Map<String, Object> map = new HashMap<>();
			map.put("sum", sum);
			map.put("i", i);
			map.put("pageNum", pageNum);
			map.put("list", list);
			map.put("size", list.size());
			return map;
		}
	}

	/** 根据课程id得到学科id 根据学科id列出排行 推荐课程*/
	@Override
	public Object loadByTuiJian(Integer cid, int size) {
			
			Course course = courseDao.selectByPrimaryKey(cid);
			Integer sId =course.getSubjectId();
			PageHelper.startPage(1, size);
			List<Course> list = courseDao.selectCourseBySubjectIdPrice(sId);
			return list;
		
	}

	/*
	* @Description：
	* @Author： yanshitong
	* @Date： 2019/3/19 23:26
	* @Param：[collectCourse]
	* @Return： java.lang.Object
	* @Exception： 课程收藏 先查询数据库中是否有数据 有则更新时间 无则插入
	*/
    @Override
    public Object addCollectCourse(CollectCourse collectCourse) {
	    collectCourse.setCollectTime(new Date());
	    Integer userId = collectCourse.getUserId();
	    Integer courseId = collectCourse.getCourseId();
	    List<CollectCourse> list =collectCourseDao.selectByUserIdAndCourseId(userId,courseId);

	    if (list.isEmpty()){
            return collectCourseDao.insert(collectCourse);
        }else {
            Integer id = list.get(0).getId();
	        collectCourse.setId(id);
            return collectCourseDao.updateByPrimaryKey(collectCourse);
        }

    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/19 23:30
    * @Param：[userId, size]
    * @Return： java.lang.Object
    * @Exception： 课程中心 学习记录
    */
    @Override
    public Object selectCollectCourse(Integer userId, int size) {
        PageHelper.startPage(1, size);
        List<CollectCourse> list =collectCourseDao.selectByUserId(userId);
        return list.isEmpty()?0:list;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/23 0:12
    * @Param：[]
    * @Return： java.lang.Object
    * @Exception： 获取所有课程信息
    */
    @Override
    public Object getCourses() {
        List<Course> list =courseDao.selectCourses();
        return list;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/23 0:12
    * @Param：[id]
    * @Return： java.lang.Object
    * @Exception： 根据课程id 删除所有相关信息
    */
    @Override
    public Object deleteCourse(Integer id) {
        int i = courseDao.deleteByPrimaryKey(id);
        return i;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/23 0:13
    * @Param：[course]
    * @Return： java.lang.Object
    * @Exception： 添加新的课程 并将课程照片上传到本地 和 FastDFS服务器 将新的地址更新
    */
    private String imgFilePath = null; //图片本地地址
    private String filePath = null; //图片FastDFS中地址
    @Override
    public Object addCourse(Course course) {
        //前台在用Ajax传base64值的时候会把base64中的+换成空格，所以需要替换回来。
        String imgBase64 = course.getImage().replaceAll(" ", "+");
        try {
            GenerateImage(imgBase64); //转换为照片  并保存到本地
        } catch (IOException e) {
            e.printStackTrace();
        }
        uploadFast(imgFilePath); // 上传到FastDFS服务器

        course.setImage(filePath);//将fastdfs路径放入数据库
        course.setPublishTime(new Date());
        Subject s = subjectDao.selectByPrimaryKey(course.getSubjectId());//获取学科信息
        course.setDirectionId(s.getDirectionId());//将方向id 放入课程中
        int i = courseDao.insert(course);
        return i;
    }


    /*
     * @Description：
     * @Author： yanshitong
     * @Date： 2019/3/6 23:39
     * @Param：[imgStr]
     * @Return： boolean
     * @Exception： base64字符串转化成图片
     */
    public void GenerateImage(String imgStr) throws IOException {
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] b = decoder.decodeBuffer(imgStr.replace("data:image/jpeg;base64,", ""));//去除base64中无用的部分
        String base64Pic = "";
        base64Pic = base64Pic.replace("base64,", "");
        //新照片保存到本地
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        //生成jpg图片
        imgFilePath = "D:\\images\\" + uuid + ".jpg";//新生成的图片
        try {
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {// 调整异常数据
                    b[i] += 256;
                }
            }
            // 生成jpeg图片
            OutputStream out = new FileOutputStream(imgFilePath);
            out.write(b);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


/*
        //对字节数组字符串进行Base64解码并生成图片
        BASE64Decoder decoder = new BASE64Decoder();
        // Base64解码
        byte[] b = decoder.decodeBuffer(imgStr);
        for (int i = 0; i < b.length; ++i) {
            if (b[i] < 0) {//调整异常数据
                b[i] += 256;
            }
        }

        //新照片保存到本地
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        //生成jpg图片
        imgFilePath = "D:\\images\\" + uuid + ".jpg";//新生成的图片
        OutputStream out = new FileOutputStream(imgFilePath);
        out.write(b);
        out.flush();
        out.close();
        return true;
    }*/
    /*
     * @Description：
     * @Author： yanshitong
     * @Date： 2019/3/7 14:56
     * @Param：[imgFiilePath]
     * @Return： void
     * @Exception： 将照片传输到FastDFS服务器 得到返回地址
     */
    public void uploadFast(String imgFilePath) {
        // 1、把FastDFS提供的jar包添加到工程中
        // 2、初始化全局配置。加载一个配置文件。
        String confUrl = this.getClass().getClassLoader().getResource("fdfs_client.properties").getPath();
        FastDFSClient fastDFSClient = null;
        try {
            fastDFSClient = new FastDFSClient(confUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //上传文件
        filePath ="http://192.168.138.129:9999/" + fastDFSClient.uploadFile(imgFilePath);
    }


}
