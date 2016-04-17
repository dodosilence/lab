package cn.gc.lab.controller;

import cn.gc.lab.controller.messagge.Message;
import cn.gc.lab.entity.Equipment;
import cn.gc.lab.entity.Laboratory;
import cn.gc.lab.repository.EquipmentRepository;

import cn.gc.lab.repository.LaboratoryRepository;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by tristan on 16/4/12.
 */
@Controller
@RequestMapping("mgr/equip")
public class EquipmentController {

    @Autowired
    EquipmentRepository equipmentRepository;
    @Autowired
    LaboratoryRepository laboratoryRepository;

    @RequestMapping("list/all")
    public String equipListAll(Model model) {
        List<Equipment> equipments = equipmentRepository.findAll();
        model.addAttribute("equitments", equipments);
        return "manager/equipment/equipment";
    }


    @RequestMapping(value = "create", method = RequestMethod.POST)
    @ResponseBody
    public Object insertEquip(@RequestParam(required = true) String ename, @RequestParam(required = false) Double price, @RequestParam(required = false) Integer count, String labUuid) {
        Laboratory laboratory = laboratoryRepository.findOne(labUuid);
        Equipment equipment = new Equipment();
        equipment.seteName(ename);
        equipment.setPrice(price);
        equipment.setUsefullCount(count);
        equipment.setLaboratory(laboratory);
        equipmentRepository.save(equipment);
        return Message.success();
    }

    @RequestMapping("delete/{euuid}")
    @ResponseBody
    public Object deleteEquip(@PathVariable("euuid") String uuid) {
        equipmentRepository.delete(uuid);
        return Message.success();
    }

}
