package com.yst.ovls.service;

import com.yst.ovls.entity.*;

public interface EvaluateAndNoteService {
	/** 根据课程ID显示评论*/
	public Object loadEvaluate(Integer cid);
	
	/** 根据课程ID显示笔记*/
	public Object loadNote(Integer cid);
	
	/** 根据视频ID显示评论*/
	public Object loadEvaluateByVideoId(Integer vid);
	
	/** 根据视频ID显示笔记*/
	public Object loadNoteByVideoId(Integer vid);
	
	/** 将评论传入数据库*/
	public Object insertEvaluate(Evaluate evaluate);
	
	/** 将笔记传入数据库*/
	public Object insertNote(Note note);
	
	/** 根据视频ID和用户id显示笔记 评论中 只看我的*/
	public Object loadNoteByVideoIdAndUserId(Integer videoId,Integer userId);
	
	/** 添加评论赞*/
	public Object addZan(EvaluationLike evaluationLike);
	
	/** 删除评论赞*/
	public Object deleteZan(Integer evaluationId,Integer userId);
	
	/** 修改评论点赞数*/
	public Object updateevaluateById(Evaluate evaluate);
	
	/** 根据userId获得评论*/
	public Object loadEvaluateByUserIdAndEvaluateId(Integer userId,Integer evaluationId);


    /** 添加笔记赞*/
    public Object addNoteZan(NoteLike noteLike);

    /** 删除笔记赞*/
    public Object deleteNoteZan(Integer noteId,Integer userId);

    /** 修改笔记点赞数*/
    public Object updateNoteById(Note  note);
    /** 根据userId获得笔记点赞信息*/
    public Object loadNoteByUserIdAndNoteId(Integer userId,Integer noteId);

    /** 笔记收藏*/
    public Object collectNote(CollectNote collectNote);

    /** 获取收藏的笔记*/
    public Object getcollectNote(Integer size,Integer userId);
    /** 根据笔记ID显示笔记*/
    public Object loadNoteByNoteId(Integer noteId);


    /**获得所有评价的信息*/
    public Object getEvaluates();
    /**删除某条评价的信息*/
    public Object deleteEvaluates(Integer id);
}
