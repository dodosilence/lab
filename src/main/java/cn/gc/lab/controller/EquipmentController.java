package cn.gc.lab.controller;

import cn.gc.lab.entity.Equipment;
import cn.gc.lab.repository.EquipmentRepository;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by tristan on 16/4/12.
 */
@Controller
@RequestMapping("mgr/equip")
public class EquipmentController {

    @Autowired
    EquipmentRepository equipmentRepository;








    @RequestMapping("list/all")
    public String equipListAll(Model model){
        List<Equipment> equipments = equipmentRepository.findAll();
        model.addAttribute("equitments",equipments);
        return "manager/equipment/equipment";
    }
}
