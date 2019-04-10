package com.yst.ovls.service;

import com.yst.ovls.entity.Direction;
import com.yst.ovls.entity.Subject;

public interface DirectionService {
	
	/** 加载首页的 方向+学科+课程*/
	public Object loadDirections();

	/** 获取所有学科*/
	public Object getSubject();

	/** 后台管理系统获得所有方向信息*/
	public Object getDirection();

	/*后台管理系统 删除某个方向*/
    public Object deleteDirection(Integer id);

    /*后台管理系统 添加方向*/
    public Object addDirection(Direction direction);

    /*后台管理系统 删除某个学科*/
    public Object deleteSubject(Integer id);

    /*后台管理系统 添加学科*/
    public Object addSubject(Subject subject);
	
}
