package cn.gc.lab.controller;

import cn.gc.lab.entity.Laboratory;
import cn.gc.lab.repository.LaboratoryRepository;
import cn.gc.lab.service.LaboratoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by tristan on 16/4/11.
 */
@Controller
@RequestMapping("mgr/labs")
public class LabstoratoryController {

    @Autowired
    LaboratoryService laboratoryService;

    @Autowired
    LaboratoryRepository laboratoryRepository;

    @RequestMapping("/list/{labstyleId}")
    public String labListbyStyle(@PathVariable("labstyleId") String labstyle, Model model) {
        List<Laboratory> laboratories = laboratoryService.findLabsByLabStyle(labstyle);
        model.addAttribute("laboratorys",laboratories);
        return "manager/labs";
    }


    @RequestMapping("/list/all")
    public String labListAll( Model model) {
        List<Laboratory> laboratories = laboratoryRepository.findAll();
        model.addAttribute("laboratorys",laboratories);
        return "manager/labs";
    }


    @RequestMapping("delete/{labId}")
    @ResponseBody
    public Object deleteLab(@PathVariable("labId") String labId){
        laboratoryRepository.delete(labId);
        return null;

    }
}
