package cn.gc.lab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tristan on 16/4/10.
 */
@RequestMapping("student")
@Controller
public class StudentHomeController {


    @RequestMapping("index.html")
    public String studentIndex() {

        return "student/index";
    }
}
