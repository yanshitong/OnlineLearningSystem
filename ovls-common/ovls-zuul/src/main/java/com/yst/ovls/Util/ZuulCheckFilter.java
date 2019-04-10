package com.yst.ovls.Util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;

/**
* @author: yanshitong
* @Date: 2019/3/4 20:03
* @Description: 网关拦截
*/
@Component
public class ZuulCheckFilter extends ZuulFilter{

	@Autowired
	private RestTemplate restTemplate;


/*
* @Description：
* @Author： yanshitong
* @Date： 2019/3/4 20:02
* @Param：[]
* @Return： boolean
* @Exception： 根据请求判断是否需要拦截
*/
    @Override
    public boolean shouldFilter() {
        RequestContext rc = RequestContext.getCurrentContext();
        HttpServletRequest request  = rc.getRequest();

        //忽略大小写，返回true则拦截，进入run方法
        if ("/ovls-user/user/put/update/PersonalInfo".equalsIgnoreCase(request.getRequestURI())){
            return true; //boolean值来判断该过滤器是否要执行，true表示执行，false表示不执行
        }else if ("/ovls-user/user/update/changePassword".equalsIgnoreCase(request.getRequestURI())){
            return true;
        }else if ("/ovls-user/user/get/getLonginInfo".equalsIgnoreCase(request.getRequestURI())){
            return true;
        }
        return false;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/4 20:03
    * @Param：[]
    * @Return： java.lang.Object
    * @Exception： 对需要拦截的请求进行 token验证
    */
	@Override
	public Object run(){
        RequestContext rc = RequestContext.getCurrentContext();
        HttpServletRequest request  = rc.getRequest();
		HttpServletResponse response = rc.getResponse();
		String userId = request.getHeader("id");
		String token = request.getHeader("token");
		//调用/user/token服务检测
		String url = "http://ovls-user/user/token";
		LinkedMultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
		params.set("userId", userId);//设置userId=xx
		params.set("token", token);//设置token=xx
        Map result = restTemplate.postForObject(
                url, params, Map.class);
        String code1 = result.get("code").toString();
        int code = Integer.parseInt(code1);
        if(code==1){
			//无效
			//将返回的ovlsresult对象转成json字符串，利用response输出
			rc.setSendZuulResponse(false);//阻止后续处理
			rc.setResponseStatusCode(401);//身份不合法
			response.setContentType("text/html;charset=UTF-8");
			rc.setResponseBody("{\"status\":1,\"msg\":\"身份不合法\"}");
			return null;
		}else{
			//有效
			rc.setSendZuulResponse(true);//继续执行后续处理
			rc.setResponseStatusCode(200);//设置成功标识
			return null;
		}
	}

	@Override
	public int filterOrder() {
	    return 0;
	}

	@Override
	public String filterType() {
	    return FilterConstants.PRE_TYPE;//pre、route、post、error
	}

}
