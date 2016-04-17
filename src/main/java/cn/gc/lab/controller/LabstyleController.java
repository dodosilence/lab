package cn.gc.lab.controller;

import cn.gc.lab.controller.messagge.Message;
import cn.gc.lab.entity.Labstyle;
import cn.gc.lab.repository.LabstyleRepository;
import cn.gc.lab.service.LabStyleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by tristan on 16/4/13.
 */
@RequestMapping({"/mgr/labstyle", "/mgr/labstyle.html"})
@Controller
public class LabstyleController {
    @Autowired
    LabStyleService labStyleService;


    @RequestMapping()
    public String labstyle(Model model) {
        List<Labstyle> labstyles = labStyleService.findAllLabstyle();
        model.addAttribute("labstyles", labstyles);
        return "manager/labstyle/labstyle";
    }

    @RequestMapping(value="/create.html", method=RequestMethod.POST)
    @ResponseBody
    public Object newLabstyle(String styleName) {
        Labstyle labstyle = new Labstyle();
        labstyle.setStyleName(styleName);
        boolean res = labStyleService.save(labstyle);
        if (res) {
            return Message.success();

        } else {
            return Message.error();
        }
    }


}
