package com.yst.ovls.remote;

import com.yst.ovls.entity.Video;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 编写远程服务的Remote接口
 */
@FeignClient(name = "OVLS-USER")  //feign接口
public interface UserRemote {
    /**
     * 菜单页方向 推荐课程
     */
    @PutMapping("/user/put/avatar")
    public boolean avatar(@RequestParam("id") Integer id, @RequestParam("image") String image);
}

