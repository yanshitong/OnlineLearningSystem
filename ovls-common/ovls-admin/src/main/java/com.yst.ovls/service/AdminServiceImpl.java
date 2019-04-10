package com.yst.ovls.service;

import java.util.Date;
import java.util.List;

import com.yst.ovls.dao.ManagerMapper;
import com.yst.ovls.entity.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;

@Service
public class AdminServiceImpl implements adminService {

	@Autowired
	private ManagerMapper managerDao;


	/*
	* @Description：
	* @Author： yanshitong
	* @Date： 2019/3/21 3:44
	* @Param：[username, password]
	* @Return： java.lang.Object
	* @Exception： 根据用户名和密码查询用户信息 如果无则返回0 有则返回上次登录时间 并更新本次登录时间
	*/
    @Override
    public Object checkUsernameAndPassword(String username,String password) {
        Manager manager = managerDao.selectByUsernameAndPassword(username,password);
        if(manager==null){
            return 0;
        }else {
            Date result = manager.getLastLoginTime();
            manager.setLastLoginTime(new Date()); //设置当前时间放入数据库
            managerDao.updateByPrimaryKey(manager);
            return result;
        }

    }
}
