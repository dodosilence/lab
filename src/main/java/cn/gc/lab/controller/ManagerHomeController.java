package cn.gc.lab.controller;

import cn.gc.lab.entity.Labstyle;
import cn.gc.lab.service.LabStyleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by tristan on 16/4/10.
 */
@Controller
@RequestMapping("mgr")
public class ManagerHomeController {

    @Autowired
    LabStyleService labStyleService;

    @RequestMapping("index.html")
    public String managerIndex() {
        return "manager/index";
    }

    @RequestMapping("labstyle.html")
    public String labstyle(Model model) {
        List<Labstyle> labstyles = labStyleService.findAllLabstyle();
        model.addAttribute("labstyles",labstyles);
        return "manager/labstyle/labstyle";
    }


}
