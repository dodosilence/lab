package cn.gc.lab.controller;

import cn.gc.lab.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tristan on 16/4/10.
 */
@RequestMapping("teacher")
@Controller
public class TeacherHomeController {
    @Autowired
    HomeService homeService;

    @RequestMapping("index.html")
    public String teacherIndex(Model model) {
        homeService.IndexData(model);


        return "index/index";
    }
}
