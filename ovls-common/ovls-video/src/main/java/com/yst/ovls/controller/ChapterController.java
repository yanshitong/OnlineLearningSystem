package com.yst.ovls.controller;

import com.yst.ovls.entity.Chapter;
import com.yst.ovls.entity.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.yst.ovls.service.ChapterService;


@RestController
//@CrossOrigin(origins="*",methods={RequestMethod.GET,RequestMethod.POST})
public class ChapterController {

	@Autowired
	private ChapterService chapterService;
	
	/** 加载详情页章节和视频*/
	@GetMapping("/course/chapters")// /course/chapters?cid=xxx
	public Object loadChapterAndVideos(@RequestParam("cid") Integer cid){
		return chapterService.loadChapterAndVideos(cid);
	}
	
	/** 根据视频id获取视频地址*/
	@GetMapping("/video/loadVideoByVid")
	public Object loadVideoByVid(@RequestParam("vid") Integer vid){
		return chapterService.loadVideo(vid);
	}

	/* 获取所有章节信息*/
    @GetMapping("/getChapters")
    public Object getChapters(){
        return chapterService.getChapters();
    }

    /* 根据章节id 删除某章节*/
    @DeleteMapping("/deleteChapter")
    public Object deleteChapter(Integer id){
        return chapterService.deleteChapters(id);
    }
	/*添加一条章节*/
    @PostMapping("/addChapter")
    public Object addChapter(Chapter chapter){
        return chapterService.addChapters(chapter);
    }

    /* 获取所有视频信息*/
    @GetMapping("/getVideos")
    public Object getVideos(){
        return chapterService.getVideos();
    }

    /* 根据视频id 删除某视频*/
    @DeleteMapping("/deleteVideo")
    public Object deleteVideo(Integer id){
        return chapterService.deleteVideo(id);
    }


}
