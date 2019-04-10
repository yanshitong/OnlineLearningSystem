package com.yst.ovls.service;

import com.yst.ovls.entity.Chapter;
import com.yst.ovls.entity.Video;

public interface ChapterService {
	
	
	/** 根据课程ID加载章节和视频*/
	public Object loadChapterAndVideos(Integer courseId);
	
   /** 根据视频id获取视频地址*/
	public Object loadVideo(Integer vid);

	/* 获得所有章节信息*/
    public Object getChapters();

    /* 根据id 删除对应章节 */
    public Object deleteChapters(Integer id);

    /* 添加章节*/
    public  Object addChapters(Chapter chapter);


    /* 获得所有视频信息*/
    public Object getVideos();

    /* 根据id 删除对应视频 */
    public Object deleteVideo(Integer id);

}
