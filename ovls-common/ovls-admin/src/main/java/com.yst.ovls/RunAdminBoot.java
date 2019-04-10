package com.yst.ovls;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
//import org.springframework.context.annotation.Bean;
//import org.springframework.web.client.RestTemplate;

/** springBoot启动类*/

@EnableFeignClients //启用feign
@EnableDiscoveryClient //寻找eureka
@SpringBootApplication
@MapperScan(basePackages={"com.yst.ovls.dao"})//添加映射扫描器,扫描com.yst.ovls.dao包
public class RunAdminBoot {

	public static void main(String[] args){
		SpringApplication.run(com.yst.ovls.RunAdminBoot.class, args);
	}
	
	
	/*//创建RestTemplate，方便对ovls-course发出请求
	@Bean
	public RestTemplate restTemplate(){
		return new RestTemplate();
	}*/
}
