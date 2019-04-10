package com.yst.ovls.controller;

import com.yst.ovls.entity.Video;
import com.yst.ovls.service.PhotoAndVideoService;
import com.yst.ovls.util.FastDFSClient;
import io.micrometer.core.instrument.Meter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import sun.misc.BASE64Decoder;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @author: yanshitong
 * @Date: 2019/3/6 23:38
 * @Description: 获取前端传来的头像
 */
//@CrossOrigin(origins = "*", methods = {RequestMethod.GET, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.PUT})
//可以跨域访问

@RestController
public class PhotoAndVideoController {

    @Autowired
    private PhotoAndVideoService service;


    @PostMapping("/PhotoAndVideo/avatar")
    @ResponseBody
    public Map<String, Object> uploadAvatar( Integer id,@RequestParam("image") String image) throws IOException {
        return service.avatar(id,image);
    }

    /* 添加视频*/
    @PostMapping("/addVideo")
    public Object addVideo(Video video){
        return service.addVideo(video);
    }

}