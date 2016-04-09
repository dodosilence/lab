package cn.gc.lab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tristan on 16/4/10.
 */
@RequestMapping("manager")
@Controller
public class ManagerHomeController {

    @RequestMapping("index.html")
    public String managerIndex() {

        return "manager/index";
    }


}
