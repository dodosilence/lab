package cn.gc.lab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tristan on 16/4/10.
 */
@RequestMapping("teacher")
@Controller
public class TeacherHomeController {

    @RequestMapping("index.html")
    public String teacherIndex() {


        return "teacher/index";
    }
}
