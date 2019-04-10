package com.yst.ovls.remote;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 编写远程服务的Remote接口
 */
@FeignClient(name = "OVLS-COURSE")  //feign接口
public interface courseRemote {
    /**
     * 菜单页方向 推荐课程
     */
    @GetMapping("/course/directionRec")
    // 允许前端页面不传入size，默认size=5
    public Object loadDirectionRec(@RequestParam(name = "size", required = false, defaultValue = "5") int size,
                                   @RequestParam("directionId") int directionId);
}
