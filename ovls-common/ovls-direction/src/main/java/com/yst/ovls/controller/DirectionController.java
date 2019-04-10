package com.yst.ovls.controller;

import com.yst.ovls.entity.Direction;
import com.yst.ovls.entity.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.yst.ovls.service.DirectionService;


//@CrossOrigin(origins="*",methods={RequestMethod.GET,RequestMethod.POST})
@RestController
public class DirectionController {

    @Autowired
    private DirectionService directionService;

    /**
     * 获取所有的课程菜单
     */
    @GetMapping("/direction/all")
    public Object loadDirections() {
        return directionService.loadDirections();
    }

    /**
     * 获取所有方向信息
     */
    @GetMapping("/getDirection")
    public Object getDirection() {
        return directionService.getDirection();
    }

    /**
     * 根据id删除某方向
     */
    @DeleteMapping("/deleteDirection")
    public Object deleteDirection(Integer id) {
        return directionService.deleteDirection(id);
    }

    /*添加一个方向*/
    @PostMapping("/addDirection")
    public Object addDirection(Direction direction){
        return directionService.addDirection(direction);
    }

    /**
     * 获取所有学科信息
     */
    @GetMapping("/getSubject")
    public Object getSubject() {
        return directionService.getSubject();
    }

    /**
     * 根据id删除某学科
     */
    @DeleteMapping("/deleteSubject")
    public Object deleteSubject(Integer id) {
        return directionService.deleteSubject(id);
    }

    /*添加一个学科*/
    @PostMapping("/addSubject")
    public Object addSubject(Subject subject){
        return directionService.addSubject(subject);
    }
}
