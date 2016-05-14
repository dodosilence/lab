package cn.gc.lab.controller;

import cn.gc.lab.controller.messagge.Message;
import cn.gc.lab.entity.Laboratory;
import cn.gc.lab.entity.Labstyle;
import cn.gc.lab.repository.EquipmentRepository;
import cn.gc.lab.repository.LaboratoryRepository;
import cn.gc.lab.repository.LabstyleRepository;
import cn.gc.lab.service.LaboratoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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

    @Autowired
    LabstyleRepository labstyleRepository;
    @Autowired
    EquipmentRepository equipmentRepository;

    @RequestMapping("/list/{labstyleId}")
    public String labListbyStyle(@PathVariable("labstyleId") String labstyle, Model model) {


        List<Laboratory> laboratories = laboratoryService.findLabsByLabStyle(labstyle);
        Labstyle labstyleItem = labstyleRepository.findOne(labstyle);
        model.addAttribute("laboratorys", laboratories);
        model.addAttribute("labstyle", labstyleItem);
        return "manager/labs/labs";
    }


    @RequestMapping("/list/all")
    public String labListAll(String keyword, Model model) {

        List<Laboratory> laboratories=new ArrayList<Laboratory>();
        if (keyword != null&&!"".equals(keyword)) {
            laboratories=laboratoryRepository.findByLabNameLike("%"+keyword+"%");
        } else {

           laboratories= laboratoryRepository.findAll();
        }
        model.addAttribute("laboratorys", laboratories);
        return "manager/labs/labs";
    }


    @RequestMapping("delete/{labId}")
    @ResponseBody
    public Object deleteLab(@PathVariable("labId") String labId) {
        laboratoryRepository.delete(labId);
        return Message.success();
    }


    @RequestMapping(value = "create", method = RequestMethod.POST)
    @ResponseBody
    public Object createLab(String labName, @RequestParam(required = false) String position, @RequestParam(required = false) String labstyle) {
        Labstyle style = labstyleRepository.findOne(labstyle);
        Laboratory laboratory = new Laboratory();
        laboratory.setLabName(labName);
        laboratory.setPosition(position);
        laboratory.setLabstyle(style);
        Laboratory save = laboratoryRepository.save(laboratory);
        return Message.success();
    }


    @RequestMapping("info/{uuid}")
    public String labInfo(Model model, @PathVariable("uuid") String uuid) {
        Laboratory one = laboratoryRepository.findOne(uuid);
        model.addAttribute("laboratory", one);
        model.addAttribute("equitments", one.getEquipments());
        List<Labstyle> labstyles = labstyleRepository.findAll();
        model.addAttribute("labstyles", labstyles);
        return "manager/equipment/equipment";
    }


    @RequestMapping("update/{uuid}")
    @ResponseBody
    public Object updateInfo(@PathVariable("uuid") String uuid,
                             @RequestParam(value = "lname", required = false) String name,
                             @RequestParam(value = "position", required = false) String position,
                             @RequestParam(value = "style", required = false) String style) {
        boolean res = laboratoryService.update(uuid, name, position, style);

        if (res) {
            return Message.success();
        } else {
            return Message.error();
        }
    }

}
