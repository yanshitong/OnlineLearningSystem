package com.yst.ovls.service;


import com.yst.ovls.entity.Video;

import java.util.Map;

public  interface PhotoAndVideoService {

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/3/7 15:07
    * @Param：[image]
    * @Return： java.util.Map<java.lang.String,java.lang.Object>
    * @Exception：修改头像
    */
    public Map<String, Object> avatar(Integer id ,String image);

    /*添加一条视频信息*/
    public Object addVideo(Video video);

}
