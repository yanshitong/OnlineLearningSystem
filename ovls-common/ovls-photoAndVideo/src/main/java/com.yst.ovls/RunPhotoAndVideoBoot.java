package com.yst.ovls;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/** springBoot启动类 */
@EnableFeignClients //启用feign
@EnableDiscoveryClient //寻找eureka
@SpringBootApplication
@MapperScan(basePackages = { "com.yst.ovls.dao" }) // 添加映射扫描器,扫描com.yst.ovls.dao包
public class RunPhotoAndVideoBoot {

	public static void main(String[] args) {
		SpringApplication.run(RunPhotoAndVideoBoot.class, args);
	}


}
