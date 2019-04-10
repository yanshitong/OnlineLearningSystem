package com.yst.ovls.service;

import com.yst.ovls.entity.User;

public interface UserService {

	/** 快速注册*/
	public Object addUser(String name,String password);
	/** 登录*/
	public Object checkUser(String name,String password,String ip,String city);
	/** 修改密码*/
	public Object changePassword(int id, String oldPassword, String newPassword);
	/** 修改个人信息*/
	public Object updatePerInfo(User user);
	
	/** 通过登录的ID 获取登录信息*/
	public Object getLonginInfo(int size,Integer userId);
	
	/** 用户ID得到用户信息*/
	public Object getUserInfo(Integer userId);
	/*
	* @Description：
	* @Author： yanshitong
	* @Date： 2019/2/28 16:20
	* @Param：[token]
	* @Return： java.lang.Object
	* @Exception： token检查
	*/
    public Object checkToken(String token);

    /** 修改用户头像**/
    public boolean avatar(Integer id , String image);

    /** 获取所有用户信息*/
    public Object getAllUserInfo();
    /** 根据用户id 删除用户*/
    public Object deleteUser(Integer id);
}
