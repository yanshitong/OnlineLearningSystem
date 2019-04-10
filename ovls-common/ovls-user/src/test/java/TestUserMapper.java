

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.yst.ovls.RunUserBoot;
import com.yst.ovls.dao.UserMapper;
import com.yst.ovls.entity.User;

//在测试开始的时候自动创建Spring的应用上下文
@RunWith(SpringRunner.class)
//容器实例化,跟着UserRunBoot.class启动
@SpringBootTest(classes = { RunUserBoot.class })
public class TestUserMapper {

	@Autowired
	private UserMapper userDao;
	
	@Test
	public void test1(){
		User user = new User();
		user.setName("lcc");
		user.setPassword("123");
		userDao.insertSelective(user);
	}
}
