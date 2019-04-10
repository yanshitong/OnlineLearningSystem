package com.yst.ovls.Util;

import java.util.Random;

import org.springframework.util.Base64Utils;

public class TokenUtil {

	public static String createToken(int userId,int hour){
		//创建规则: 用户ID+随机值+颁发时间+有效时间
		long createTime = System.currentTimeMillis();
		long expireTime = hour*3600*1000;
		Random random = new Random();
		int r = random.nextInt(99999);
		String s = userId+"-"+r+"-"+createTime+"-"+expireTime;
		//将token字符明文采用Base64编码
		return Base64Utils.encodeToString(s.getBytes());
	}

}
