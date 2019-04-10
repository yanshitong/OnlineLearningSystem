package com.yst.ovls.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.yst.ovls.dao.*;
import com.yst.ovls.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.yst.ovls.Util.ErrorResult;
//import com.yst.ovls.entity.Chapter;
//import com.yst.ovls.entity.Video;
import com.yst.ovls.remote.evaluateAndNoteRemote;


@Service
public class EvaluateAndNoteServiceImp implements EvaluateAndNoteService {

	@Autowired
	private EvaluateMapper evaluateDao;
/*	@Autowired
	private RestTemplate restTemplate;*/
	@Autowired
	private NoteMapper noteDao;
	@Autowired
	private evaluateAndNoteRemote remote;
	@Autowired
	private EvaluationLikeMapper evaluateLikeDao;
    @Autowired
    private NoteLikeMapper noteLikeDao;
    @Autowired
    private CollectNoteMapper collectNoteDao;

	/** 根据课程ID显示所有评论 */
	@Override
	public Object loadEvaluate(Integer cid) {
		List<Evaluate> list = new ArrayList<>();
		// 根据课程Id获取所有章节ID-->得到所有视频ID-->根据视频id查询评论
		/*String url = "http://localhost:9528/course/chapters?cid=" + cid;
		List chapters = restTemplate.getForObject(url, List.class);*/
		List chapters = (List) remote.loadChapterAndVideos(cid);
		for (int i = 0; i<chapters.size(); i++) {
			HashMap chapter = (HashMap) chapters.get(i);
			List videos =(List) chapter.get("videos");
			for (int j=0;j<videos.size();j++) {
			    HashMap video = (HashMap) videos.get(j);
			    int id = (int) video.get("id");
			    List<Evaluate> evaluate = evaluateDao.selectByVideoId(id);
			    list.addAll(evaluate);
			}

		}
		return list;

	}

	/** 根据课程ID显示所有笔记 */
	@Override
	public Object loadNote(Integer cid) {
		List<Note> list = new ArrayList<>();
		// 根据课程Id获取所有章节ID-->得到所有视频ID-->根据视频id查询笔记
//		String url = "http://localhost:9528/course/chapters?cid=" + cid;
//		List chapters = restTemplate.getForObject(url, List.class);
		
		List chapters = (List) remote.loadChapterAndVideos(cid);
		for (int i = 0; i<chapters.size(); i++) {
			HashMap chapter = (HashMap) chapters.get(i);
			List videos =(List) chapter.get("videos");
			for (int j=0;j<videos.size();j++) {
			    HashMap video = (HashMap) videos.get(j);
			    int id = (int) video.get("id");
			    List<Note> note = noteDao.selectByVideoId(id);
			    list.addAll(note);
			}
			
		}
		return list;

	}

	/** 根据视频ID显示所有评论*/
	@Override
	public Object loadEvaluateByVideoId(Integer vid) {
		List<Evaluate> list = evaluateDao.selectByVideoId(vid);
		return list;
	}

	/** 将评论传入数据库*/
	@Override
	public Object insertEvaluate(Evaluate evaluate) {
		evaluate.setPublishTime(new Date());
		int i =evaluateDao.insertSelective(evaluate);
		return i;
	}

	/** 根据视频ID显示笔记*/
	@Override
	public Object loadNoteByVideoId(Integer vid) {
		List<Note> list = noteDao.selectByVideoId(vid);
		return list;
	}

	/** 将笔记传入数据库*/
	@Override
	public Object insertNote(Note note) {
		note.setPublishTime(new Date());
		int i =noteDao.insertSelective(note);
		return i;
	}

	/** 根据视频ID和用户id显示笔记  评论中 只看我的*/
	@Override
	public Object loadNoteByVideoIdAndUserId(Integer videoId, Integer userId) {
		List<Note> list = noteDao.selectByVideoIdAndUserId(videoId, userId);
		if(list.isEmpty()){
			return 0;
			
		}
		return list;
	}

	/** 添加赞*/
	@Override
	public Object addZan(EvaluationLike evaluationLike) {
		evaluationLike.setLikeTime(new Date());
		int i = evaluateLikeDao.insert(evaluationLike);
		return i;
	}

	/** 删除赞*/
	@Override
	public Object deleteZan(Integer evaluationId,Integer userId) {
		int i = evaluateLikeDao.deleteByEIdAndUserId(evaluationId, userId);
		return i;
	}

	/** 修改点赞数*/
	@Override
	public Object updateevaluateById(Evaluate evaluate) {
		int i = evaluateDao.updateByPrimaryKeySelective(evaluate);
		return i;
	}

	/** 根据userId获得评论点赞记录*/
	@Override
	public Object loadEvaluateByUserIdAndEvaluateId(Integer userId,Integer evaluationId) {
		List<EvaluationLike> evaluationLike = evaluateLikeDao.selectByUserIdAndEvaluateId(userId,evaluationId);
		return evaluationLike.isEmpty()? 0:evaluationLike.get(0);
	}


	/*
	* @Description：
	* @Author： yanshitong
	* @Date： 2019/3/18 22:24
	* @Param：[noteLike]
	* @Return： java.lang.Object
	* @Exception： 添加笔记赞
	*/
    @Override
    public Object addNoteZan(NoteLike noteLike) {
        noteLike.setLikeTime(new Date());
        int i = noteLikeDao.insert(noteLike);
        return i;
    }


    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/18 22:33
    * @Param：[noteId, userId]
    * @Return： java.lang.Object
    * @Exception： 删除笔记赞
    */
    @Override
    public Object deleteNoteZan(Integer noteId, Integer userId) {
        int i = noteLikeDao.deleteByNoteIdAndUserId(noteId, userId);
        return i;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/18 22:28
    * @Param：[note]
    * @Return： java.lang.Object
    * @Exception： 更新笔记点赞数
    */
    @Override
    public Object updateNoteById(Note note) {
        int i =noteDao.updateByPrimaryKeySelective(note);
        return i;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/18 22:40
    * @Param：[userId, noteId]
    * @Return： java.lang.Object
    * @Exception： 根据用户id 和 笔记id 获取点赞信息
    */
    @Override
    public Object loadNoteByUserIdAndNoteId(Integer userId, Integer noteId) {
        List<NoteLike> noteLike =  noteLikeDao.selectByUserIdAndNoteId(userId,noteId);
        return noteLike.isEmpty()? 0:noteLike.get(0);
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/19 1:30
    * @Param：[collectNote]
    * @Return： java.lang.Object
    * @Exception： 笔记收藏 先查询数据库中是否有此笔记 有则返回 -1，无则进行插入操作
    */
    @Override
    public Object collectNote(CollectNote collectNote) {
        collectNote.setCollectTime(new Date());
        Integer userId = collectNote.getUserId();
        Integer noteId = collectNote.getNoteId();
        List<CollectNote> list = collectNoteDao.selectByUserIdAndNoteId(userId,noteId);
        if (list.isEmpty()){
            int i = collectNoteDao.insert(collectNote);
            return i;

        }else {
            return -1;
        }
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/19 16:45
    * @Param：[size, userId]
    * @Return： java.lang.Object
    * @Exception： 根据用户id查询所有收藏笔记
    */
    @Override
    public Object getcollectNote(Integer size, Integer userId) {
        PageHelper.startPage(1, size);
        List<CollectNote> collectNotes =collectNoteDao.selectByUserId(userId);
        return collectNotes.isEmpty()?0:collectNotes;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/19 17:02
    * @Param：[noteId]
    * @Return： java.lang.Object
    * @Exception： 根据笔记id 查询笔记信息
    */
    @Override
    public Object loadNoteByNoteId(Integer noteId) {
        Note note =noteDao.selectByPrimaryKey(noteId);
        return note;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 2:37
    * @Param：[]
    * @Return： java.lang.Object
    * @Exception： 从数据库中获取评价的所有信息 包括视频名 和 用户名
    */
    @Override
    public Object getEvaluates() {
        List<Evaluate> list = evaluateDao.getEvaluates();
        return list;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/9 2:38
    * @Param：[id]
    * @Return： java.lang.Object
    * @Exception： 根据评价id 从数据库中删除此条评价
    */
    @Override
    public Object deleteEvaluates(Integer id) {
        int i = evaluateDao.deleteByPrimaryKey(id);
        return i;
    }


}
