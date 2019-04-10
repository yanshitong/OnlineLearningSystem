package com.yst.ovls;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;

import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RandomRule;

/** springBoot启动类*/
@EnableDiscoveryClient  //寻找eureka
@SpringBootApplication
@MapperScan(basePackages={"com.yst.ovls.dao"})//添加映射扫描器,扫描com.yst.ovls.dao包
public class RunCourseBoot {

	public static void main(String[] args){
		SpringApplication.run(RunCourseBoot.class, args);
	}
	

}
