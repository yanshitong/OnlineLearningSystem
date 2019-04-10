package com.yst.ovls.controller;


import com.yst.ovls.entity.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.yst.ovls.service.EvaluateAndNoteService;

//@CrossOrigin(origins="*",methods={RequestMethod.GET,RequestMethod.POST,RequestMethod.DELETE,RequestMethod.PUT})//可以跨域访问
@RestController
public class EvaluateAndNoteController {

	@Autowired
	private EvaluateAndNoteService service;
 

	
	/** 获取评论信息*/
	@GetMapping("/get/evaluates")
	//允许前端页面不传入size，默认size=5
	public Object getEvaluates(
			@RequestParam(name="size",required=false,defaultValue="10")int size,
			Integer cid){
		return service.loadEvaluate(cid);
	}
	
	/** 获取笔记信息*/
	@GetMapping("/get/notes")
	//允许前端页面不传入size，默认size=5
	public Object getNotes(
			@RequestParam(name="size",required=false,defaultValue="10")int size,
			Integer cid){
		return service.loadNote(cid);
	}
	
	/** 根据视频id获得评论信息*/
	@GetMapping("/get/evaluatesByvid")
	//允许前端页面不传入size，默认size=5
	public Object getEvaluatesByVid(
			@RequestParam(name="size",required=false,defaultValue="10")int size,
			Integer vid){
		return service.loadEvaluateByVideoId(vid);
	}
	
	/** 根据视频id获得评论信息*/
	@GetMapping("/get/NotesByvid")
	//允许前端页面不传入size，默认size=5
	public Object getNotesByVid(
			@RequestParam(name="size",required=false,defaultValue="10")int size,
			Integer vid){
		return service.loadNoteByVideoId(vid);
	}
	
	
	/** 添加评论*/
	@PostMapping("/post/evaluates")
	public Object insertEvaluate(Evaluate evaluate){
		return service.insertEvaluate(evaluate);
	}
	
	/** 添加笔记*/
	@PostMapping("/post/notes")
	public Object insertNote(Note note){
		return service.insertNote(note);
	}
	
	/** 根据视频id和用户id获得评论信息  评论中 只看我的*/
	@GetMapping("/get/evaluatesByvidAndUserId")
	//允许前端页面不传入size，默认size=5
	public Object getEvaluatesByVidAndUserId(
			@RequestParam(name="size",required=false,defaultValue="10")int size,
			Integer videoId,Integer userId){
		return service.loadNoteByVideoIdAndUserId(videoId, userId);
	}
	
	/** 添加赞*/
	@PostMapping("/add/zan")
	public Object addZan(EvaluationLike evaluationLike){
		return service.addZan(evaluationLike);
	}
	
	
	/** 删除赞*/
	@DeleteMapping("/delete/zan")
	public Object deleteZan(Integer evaluationId,Integer userId){
	    return service.deleteZan(evaluationId, userId);
	}
	/** 修改点赞数*/
	@PutMapping("/update/evaluate")
	public Object updateevaluateById(Evaluate evaluate){
		return service.updateevaluateById(evaluate);
	}
	
	/** 根据用户id和evaluateId获得评论信息*/
	@GetMapping("/get/evaluatesByUserIdAndEvaluateId")
	public Object getEvaluatesByUserIdAndEvaluateId(Integer userId,Integer evaluateId){
		return service.loadEvaluateByUserIdAndEvaluateId(userId,evaluateId);
	}


    /** 添加笔记赞*/
    @PostMapping("/add/noteZan")
    public Object addNoteZan(NoteLike noteLike){
        return service.addNoteZan(noteLike);
    }


    /** 删除笔记赞*/
    @DeleteMapping(value ="/delete/noteZan")
    public Object deleteNoteZan(Integer noteId,Integer userId){
        return service.deleteNoteZan(noteId, userId);
    }
    /** 修改笔记点赞数*/
    @PutMapping(value="/update/note")
    public Object updateNoteById(Note note){
        return service.updateNoteById(note);
    }

    /** 根据用户id和evaluateId获得笔记 赞信息*/
    @GetMapping("/get/notesByUserIdAndNoteId")
    public Object getNotesByUserIdAndNoteId(Integer userId,Integer noteId){
        return service.loadNoteByUserIdAndNoteId(userId,noteId);
    }

    /** 笔记收藏*/
    @PostMapping("/add/collectNote")
    public Object addCollectNote(CollectNote collectNote){
        return service.collectNote(collectNote);
    }

    /** 获取笔记收藏记录*/
	@GetMapping("/get/collectNote")
    public Object getCollectNote(@RequestParam(name = "size", required = false, defaultValue = "10")Integer size,Integer userId){
	    return service.getcollectNote(size,userId);

    }

    /** 获取笔记*/
    @GetMapping("/get/notesByNoteId")
    public Object getNotesByNoteId(Integer noteId){
        return service.loadNoteByNoteId(noteId);
    }


    /** 获取所有评价*/
    @GetMapping("/get/getEvaluatesAdmin")
    public Object getEvaluatesAdmin(){
        return service.getEvaluates();
    }

    /** 根据id 删除某条评价*/
    @DeleteMapping("/deleteEvaluate")
    public Object deleteEvaluate(Integer id){
        return service.deleteEvaluates(id);
    }
}
