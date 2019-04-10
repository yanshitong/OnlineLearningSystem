package com.yst.ovls.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import com.yst.ovls.entity.User;
import com.yst.ovls.service.UserService;


//@CrossOrigin(origins="*",methods={RequestMethod.GET,RequestMethod.POST,RequestMethod.DELETE,RequestMethod.PUT})//可以跨域访问
@RestController
public class UserController {

	@Autowired
	private UserService userService;

    /** 注册*/
	@PostMapping("/user/regist")
	public Object regist(String name,String password){
		return userService.addUser(name, password);
	}
	
	/** 登录*/
	@GetMapping("/user/login")
	public Object login(String name,String password,String ip,String city){
		return userService.checkUser(name, password,ip,city);
	}
	
	/** 修改密码*/
	@PutMapping("/user/update/changePassword")
	public Object updatePassword(int id, String oldPassword,
			String newPassword){
		return userService.changePassword(id, oldPassword, newPassword);
	}
	
	/** 修改个人信息*/
	@PutMapping("/user/put/update/PersonalInfo")
	public Object updatePerInfo(User user){
		return userService.updatePerInfo(user);
	}
	
	/** 获取登录信息*/
	@GetMapping("/user/get/getLonginInfo")
	//允许前端页面不传入size，默认size=5
	public Object getLonginInfo(
			@RequestParam(name="size",required=false,defaultValue="10")int size,
			Integer userId){
		return userService.getLonginInfo(size,userId);
	}
	
	/** 获取用户信息*/
	@GetMapping("/user/get/getUserInfo")
	public Object getLonginInfo(Integer userId){
		return userService.getUserInfo(userId);
	}

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/2/28 16:19
    * @Param：[token]
    * @Return： java.lang.Object
    * @Exception： 检查token
    */
	@PostMapping("/user/token")
    public Object author(String token){
        return userService.checkToken(token);
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/7 19:55
    * @Param：[id, image]
    * @Return： boolean
    * @Exception： 修改数据库中的头像地址
    */
    @PutMapping("/user/put/avatar")
    public boolean avatar(Integer id,String image){
	    return userService.avatar(id,image);
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/22 0:32
    * @Param：[]
    * @Return： java.lang.Object
    * @Exception： 管理界面 获取用户所有信息
    */
    @GetMapping("/user/getAllUserInfo")
    public Object getAllUserInfo(){
        return userService.getAllUserInfo();
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/22 2:50
    * @Param：[id]
    * @Return： java.lang.Object
    * @Exception： 根据用户id删除用户
    */
    @DeleteMapping("/delete/user")
    public Object deleteUser(Integer id){
        return userService.deleteUser(id);
    }

}
