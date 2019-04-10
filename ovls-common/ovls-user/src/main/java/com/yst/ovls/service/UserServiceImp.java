package com.yst.ovls.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.yst.ovls.Util.ErrorResult;
import com.yst.ovls.Util.Md5Util;
import com.yst.ovls.Util.TokenUtil;
import com.yst.ovls.dao.LoginHistoryMapper;
import com.yst.ovls.dao.UserMapper;
import com.yst.ovls.entity.LoginHistory;
import com.yst.ovls.entity.User;
import org.springframework.util.Base64Utils;

@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserMapper userDao;
	@Autowired
	private LoginHistoryMapper loginHistoryDao;
	@Autowired
	private RedisTemplate<Object, Object> redis;

	/** 快速注册逻辑 */
	public Object addUser(String name, String password) {
		ErrorResult error = new ErrorResult();
		// 请求参数的格式检查
		if (name == null || "".equals(name)) {
			error.setCode(1);
			error.setMsg("用户名不合法");
			return error;
		}
		if (password == null || "".equals(password)) {
			error.setCode(2);
			error.setMsg("密码不合法");
			return error;
		}
		// 检查用户是否被占用
		User user = userDao.selectByName(name);
		if (user != null) {// 存在
			error.setCode(1);
			error.setMsg("用户名已存在");
			return error;
		}
		// user等于null正常添加
		user = new User();
		user.setName(name);
		// 获取一个随机盐值
		String salt = Md5Util.salt();
		// 密码采用MD5(密码+盐)加密
		String md5Password = Md5Util.md5StrAndSalt(password, salt);
		user.setPassword(md5Password);
		user.setSalt(salt);
		user.setImage("http://192.168.138.129:9999/group1/M00/00/00/wKiKgVyH0P-AKpKyAAAlb-kLhVQ724.jpg");//设置默认头像
		user.setRegtime(new Date());
		userDao.insertSelective(user);
		return user;
		
	}

	/** 登录逻辑 */
	public Object checkUser(String name, String password,String ip,String city) {
		ErrorResult error = new ErrorResult();
		// 请求参数的格式检查
		if (name == null || "".equals(name)) {
			error.setCode(1);
			error.setMsg("用户名不合法");
			return error;
		}
		if (password == null || "".equals(password)) {
			error.setCode(2);
			error.setMsg("密码不合法");
			return error;
		}
		// 查询用户名是否存在
		User user = userDao.selectByName(name);
		if (user == null) {
			error.setCode(3);
			error.setMsg("用户名或密码错误");
			return error;
		}
		// 将提交密码加密，与数据库比对
		String md5Password = Md5Util.md5StrAndSalt(password, user.getSalt());
		if (!user.getPassword().equals(md5Password)) {
			error.setCode(3);
			error.setMsg("用户名或密码错误");
			return error;
		}
		// 成功返回个人信息
		Map<String, Object> data = new HashMap<>();
		data.put("userId", user.getId());
		data.put("image", user.getImage());
		data.put("name", user.getName());
		data.put("location",user.getLocation());
		data.put("nickName",user.getNickName());
		data.put("position",user.getPosition());
		data.put("sex",user.getSex());
		data.put("signature",user.getSignature());
		//生成一个token返回
		String token = TokenUtil.createToken(user.getId(), 24);
		data.put("token", token);
		//将用户token存入redis缓存
		String key = "token_"+user.getId();
		redis.opsForValue().set(key, token);
		//2小时后失效 
		redis.expire(key, 2, TimeUnit.HOURS); 
		//将登录时间、ip等信息存储
		LoginHistory record = new LoginHistory();
		record.setLoginTime(new Date());
		record.setUserId(user.getId());
		record.setIp(ip); 
		record.setCity(city);
		loginHistoryDao.insert(record);
		return data;
	}

	/** 修改密码逻辑 */
	@Override
	public Object changePassword(int id, String oldPassword, String newPassword) {
		ErrorResult error = new ErrorResult();
		// 请求参数的格式检查
		if (oldPassword == null || "".equals(oldPassword)) {
			error.setCode(2);
			error.setMsg("密码不合法");
			return error;
		}
		if (newPassword == null || "".equals(newPassword)) {
			error.setCode(2);
			error.setMsg("密码不合法");
			return error;
		}
		// 将提交的旧密码加密，与数据库中密码比对
		User user = userDao.selectByPrimaryKey(id);
		String md5Password = Md5Util.md5StrAndSalt(oldPassword, user.getSalt());
		if (!user.getPassword().equals(md5Password)) {
			error.setCode(2);
			error.setMsg("密码输入错误");
			return error;
		}
		// 将数据库中的旧密码改为新密码
		// 1.重新获取一个随机盐值
		String salt = Md5Util.salt();
		// 2.密码采用MD5(密码+盐)加密
		md5Password = Md5Util.md5StrAndSalt(newPassword, salt);
		user.setPassword(md5Password);
		user.setSalt(salt);
		// 3.更新
		int rows = userDao.updateByPrimaryKeySelective(user);
		// 判断是否成功
		if (rows == 0) {
			error.setCode(2);
			error.setMsg("修改失败");
			return error;
		}
		return user;
	}

	/** 修改个人信息 逻辑 */
	@Override
	public Object updatePerInfo(User user) {
		ErrorResult error = new ErrorResult();
		//进行合理判断，防止恶意攻击
        if(user.getImage() == null && user.getLocation() ==null && 
        		user.getName() == null && user.getNickName() ==null &&
        		user.getPosition() == null && user.getSex() ==null && 
        		user.getSignature() == null){
        	error.setCode(4);
			error.setMsg("修改失败");
			return error;
        }
		int rows = userDao.updateByPrimaryKeySelective(user);
		// 判断是否成功
		if (rows == 0) {
			error.setCode(4);
			error.setMsg("修改失败");
			return error;
		}
		return user;
	}

	/** 通过登录的ID 获取登录信息*/
	@Override
	public Object getLonginInfo(int size,Integer userId) {
		PageHelper.startPage(1, size);// 显示一页，每页显示的数据量由用户决定
		List<LoginHistory> loginHistory = loginHistoryDao.selectByUserId(userId);
		return loginHistory;
	}

	/** 通过用户的ID 获取用户信息*/
	@Override
	public Object getUserInfo(Integer userId) {
		User user = userDao.selectByUserId(userId);
		if (user==null){
		    return 0;
        }
		return user;
	}

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/2/28 16:22
    * @Param：[token]
    * @Return： java.lang.Object
    * @Exception：token检查
    */
	@Override
    public Object checkToken(String token) {
        //解析token
        try{
            byte[] bytes = Base64Utils.decodeFromString(token);
            String token1 = new String(bytes);
            String[] arrays = token1.split("-");
            String userId = arrays[0];
            long createTime = Long.parseLong(arrays[2]);
            long expireTime = Long.parseLong(arrays[3]);
            //检测用户token是否存在
            String key = "token_"+userId;
            String redisToken = (String)redis.opsForValue().get(key);
            if(redisToken == null){
                ErrorResult error = new ErrorResult();
                error.setCode(1);
                error.setMsg("未登录或登录失效");
                return error;
            }
            //检测用户token是否一致
            if(!redisToken.equals(token)){
                ErrorResult error = new ErrorResult();
                error.setCode(1);
                error.setMsg("不合法用户");
                return error;
            }
            //检测是否失效
            long now = System.currentTimeMillis();
            if((createTime+expireTime)<now){
               ErrorResult error = new ErrorResult();
                error.setCode(1);
                error.setMsg("登录过期，重新登录");
                return error;
            }
            //合法令牌
            Map data = new HashMap<>();
            data.put("code", 0);
            data.put("msg", "登录验证有效");
            return data;
        }catch(Exception e){
            ErrorResult error = new ErrorResult();
            error.setCode(1);
            error.setMsg("令牌参数错误");
            return error;
        }
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/8 23:08
    * @Param：[id, image]
    * @Return： boolean
    * @Exception： 修改数据库中头像地址
    */
    @Override
    public boolean avatar(Integer id, String image) {
	    if (image==null || "".equals(image)){
	        return false;
        }
	    //根据用户id 查询用户所有信息
	    User user = userDao.selectByUserId(id);
	    //更新头像路径
	    user.setImage(image);
	    //更新用户信息
        int rows = userDao.updateByPrimaryKeySelective(user);
        if(rows == 0){
            return false;
        }
        return true;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/22 2:46
    * @Param：[]
    * @Return： java.lang.Object
    * @Exception： 获取所有用户的信息
    */
    @Override
    public Object getAllUserInfo() {
        List<User> usersList = userDao.selectAllUserInfo();
        return usersList;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/22 2:48
    * @Param：[id]
    * @Return： java.lang.Object
    * @Exception： 根据用户id 删除此用户
    */
    @Override
    public Object deleteUser(Integer id) {
        if(id==null){
            return 0;
        }else {
            int i =userDao.deleteByPrimaryKey(id);
            return i;
        }

    }

}
