package com.yst.ovls.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yst.ovls.dao.ChapterMapper;
import com.yst.ovls.dao.VideoMapper;
import com.yst.ovls.entity.Chapter;
import com.yst.ovls.entity.Video;


@Service
public class ChapterServiceImpl implements ChapterService {

	@Autowired
	private ChapterMapper chapterDao;
	
	@Autowired
	private VideoMapper videoDao;
	
	/** 根据课程ID加载章节和视频*/
	@Override
	public Object loadChapterAndVideos(Integer courseId) {
		List<Chapter> list = chapterDao.selectByCourseId(courseId);
		return list;
	}

	/** 根据视频id获取视频地址*/
	@Override
	public Object loadVideo(Integer vid) {
		Video video = videoDao.selectByPrimaryKey(vid);
		return video;
	}

	/*
	* @Description：
	* @Author： yanshitong
	* @Date： 2019/4/9 19:59
	* @Param：[]
	* @Return： java.lang.Object
	* @Exception： 获得所有章节信息
	*/
    @Override
    public Object getChapters() {
	    List<Chapter> list = chapterDao.selectChapters();
        return list;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 19:59
    * @Param：[id]
    * @Return： java.lang.Object
    * @Exception： 根据章节id 删除章节
    */
    @Override
    public Object deleteChapters(Integer id) {
        int i = chapterDao.deleteByPrimaryKey(id);
        return i;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 20:00
    * @Param：[chapter]
    * @Return： java.lang.Object
    * @Exception： 插入一条章节信息
    */
    @Override
    public Object addChapters(Chapter chapter) {
        int i = chapterDao.insert(chapter);
        return i;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 20:42
    * @Param：[]
    * @Return： java.lang.Object
    * @Exception： 从数据库中得到所有视频信息
    */
    @Override
    public Object getVideos() {
        List<Video> list = videoDao.selectVideos();
        return list;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 20:43
    * @Param：[id]
    * @Return： java.lang.Object
    * @Exception： 根据id 删除某视频
    */
    @Override
    public Object deleteVideo(Integer id) {
        int i = videoDao.deleteByPrimaryKey(id);
        return i;
    }


}
