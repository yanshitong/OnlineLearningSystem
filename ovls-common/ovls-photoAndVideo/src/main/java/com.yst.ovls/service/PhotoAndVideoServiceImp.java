package com.yst.ovls.service;

import com.yst.ovls.dao.VideoMapper;
import com.yst.ovls.entity.Video;
import com.yst.ovls.remote.UserRemote;
import com.yst.ovls.util.FastDFSClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Decoder;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class PhotoAndVideoServiceImp implements PhotoAndVideoService {

    @Autowired
    private UserRemote userRemote;

    @Autowired
    private VideoMapper videoDao;
    /*
     * @Description：
     * @Author： yanshitong
     * @Date： 2019/3/7 15:12
     * @Param：[image]
     * @Return： java.util.Map<java.lang.String,java.lang.Object>
     * @Exception： 修改头像 保存本地(redis实现) 上传到liunx系统中的FastDFS服务器，将url返回，且修改数据库
     */

    private String imgFilePath = null; //图片本地地址
    private String filePath = null; //图片FastDFS中地址
    boolean flag = false; //判断是否成功修改

    @Override
    public Map<String, Object> avatar(Integer id ,String image) {
        String imgBase64 = image.replace("data:image/png;base64,", "");

        try {
            flag = GenerateImage(imgBase64); //转换为照片  并保存到本地
        } catch (IOException e) {
            e.printStackTrace();
        }
        uploadFast(imgFilePath); // 上传到FastDFS服务器
        if(id==null){
            flag=false;
        }else {
            updateImg(id,filePath); //将新照片地址修改
        }

        if (flag == false){
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("result", "修改失败！");
            map.put("file", "修改失败");
            return map;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", "ok");
        map.put("file", filePath);
        return map;
    }

    /*
    * @Description：
    * @Author： yanshitong
    * @Date： 2019/4/10 1:00
    * @Param：[video]
    * @Return： java.lang.Object
    * @Exception： 将视频上传到FastDFS中 并得到返回的url  放入数据库
    */
    @Override
    public Object addVideo(Video video) {
        String videoURL = video.getUrl();
        uploadFast(videoURL); // 上传到FastDFS服务器
        video.setUrl(filePath);//将url修改为FASTDFS中的路径
        int i =videoDao.insert(video);
        return i;
    }


    /*
     * @Description：
     * @Author： yanshitong
     * @Date： 2019/3/6 23:39
     * @Param：[imgStr]
     * @Return： boolean
     * @Exception： base64字符串转化成图片
     */
    public boolean GenerateImage(String imgStr) throws IOException {
        //对字节数组字符串进行Base64解码并生成图片
        if (imgStr == null) { //图像数据为空
            return false;
        }

        BASE64Decoder decoder = new BASE64Decoder();
        // Base64解码
        byte[] b = decoder.decodeBuffer(imgStr);
        for (int i = 0; i < b.length; ++i) {
            if (b[i] < 0) {//调整异常数据
                b[i] += 256;
            }
        }

        //将剪裁后的新照片保存到本地
        String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
        //生成jpg图片
        imgFilePath = "D:\\images\\" + uuid + ".jpg";//新生成的图片
        OutputStream out = new FileOutputStream(imgFilePath);
        out.write(b);
        out.flush();
        out.close();
        return true;
    }

    /*
     * @Description：
     * @Author： yanshitong
     * @Date： 2019/3/7 14:56
     * @Param：[imgFiilePath]
     * @Return： void
     * @Exception： 将照片传输到FastDFS服务器 得到返回地址
     */
    public void uploadFast(String imgFilePath) {
        // 1、把FastDFS提供的jar包添加到工程中
        // 2、初始化全局配置。加载一个配置文件。
        String confUrl = this.getClass().getClassLoader().getResource("fdfs_client.properties").getPath();
        FastDFSClient fastDFSClient = null;
        try {
            fastDFSClient = new FastDFSClient(confUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //上传文件
        filePath ="http://192.168.138.129:9999/" + fastDFSClient.uploadFile(imgFilePath);
    }


    /*
     * @Description：
     * @Author： yanshitong
     * @Date： 2019/3/7 20:14
     * @Param：[id, image]
     * @Return： void
     * @Exception： 调用接口 更新数据库中的头像地址
     */
    public void updateImg(int id, String image){
        flag = userRemote.avatar(id,image);
    }
}
