import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.yst.ovls.RunUserBoot;
import com.yst.ovls.controller.UserController;


//在测试开始的时候自动创建Spring的应用上下文
@RunWith(SpringRunner.class)
//容器实例化,跟着UserRunBoot.class启动
@SpringBootTest(classes = { RunUserBoot.class })
public class TestUpdatePersonalInfo {

	@Autowired
	private UserController controller;

	private MockMvc mockMvc;// 可以发送请求，并接受响应结果

	@Test
	public void test1() throws Exception {
		// SpringMVC Test测试
		mockMvc = MockMvcBuilders.standaloneSetup(controller).build();

		//创建一个put请求/user/put/update/PersonalInfo
		RequestBuilder putRequest = 
				MockMvcRequestBuilders.put("/user/put/update/PersonalInfo")
				.param("id", "26").param("sex", "男");
			//发送请求，接收响应结果
			MvcResult result = mockMvc.perform(putRequest).andReturn();
			//获取响应内容，显示在控制台
			String str = result.getResponse().getContentAsString();
			System.out.println(str);
	}
	
}
