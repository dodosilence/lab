package cn.gc.lab.controller;

import cn.gc.lab.service.HomeService;
import cn.gc.lab.service.LabStyleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tristan on 16/4/10.
 */
@Controller
@RequestMapping("mgr")
public class ManagerHomeController {

    @Autowired
    LabStyleService labStyleService;
    @Autowired
    HomeService homeService;

    @RequestMapping("index.html")
    public String managerIndex(Model model) {
        homeService.IndexData(model);

        return "index/index";
    }




}
