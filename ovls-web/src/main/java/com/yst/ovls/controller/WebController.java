package com.yst.ovls.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {

    @GetMapping({"/study/index", "/study/index.html"})
    public String index() {
        return "index";// index.jsp
    }

    @GetMapping({"/study/course", "/study/course.html"})
    public String course() {
        return "course";// course.jsp
    }
}
