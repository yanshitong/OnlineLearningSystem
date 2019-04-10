package com.yst.ovls;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/** springBoot启动类*/
@EnableEurekaServer//启动eureka服务中心
@SpringBootApplication
public class RunCloudBoot {
	public static void main(String[] args){
		SpringApplication.run(RunCloudBoot.class, args);
	}
}
