package com.yst.ovls.remote;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 编写远程服务的Remote接口
 */
@FeignClient(name = "OVLS-VIDEO")  //feign接口
public interface evaluateAndNoteRemote {

    /*
    * @Description：菜单页方向 推荐课程
    * @Author： yanshitong
    * @Date： 2019/2/18 14:53
    * @Param：[cid]
    * @Return： java.lang.Object
    * @Exception：
    */

    @GetMapping("/course/chapters")// /course/chapters?cid=xxx
    public Object loadChapterAndVideos(@RequestParam("cid") Integer cid);
}
