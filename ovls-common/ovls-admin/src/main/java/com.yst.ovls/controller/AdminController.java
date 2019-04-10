package com.yst.ovls.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yst.ovls.service.adminService;


@RestController
public class AdminController {

	@Autowired
	private adminService adminService;
	
	/** 登录*/
	@GetMapping("/get/checkAdmin")
	public Object checkAdmin(String username,String password){
		return adminService.checkUsernameAndPassword(username,password);
	}
	
}
