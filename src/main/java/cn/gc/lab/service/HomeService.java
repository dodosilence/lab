package cn.gc.lab.service;

import cn.gc.lab.entity.Laboratory;
import cn.gc.lab.repository.EquipmentRepository;
import cn.gc.lab.repository.LaboratoryRepository;
import cn.gc.lab.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

/**
 * Created by tristan on 16/5/14.
 */
@Service
public class HomeService {
    @Autowired
    UserRepository userRepository;

    @Autowired
    LaboratoryRepository laboratoryRepository;


    @Autowired
    EquipmentRepository equipmentRepository;




    public void IndexData(Model model) {
        String[] counts = userRepository.mgrcount().split(",");
        Integer tole=Integer.parseInt(counts[0])+Integer.parseInt(counts[1])+Integer.parseInt(counts[2]);
        float mgrcount=tole==0?0:100*Integer.parseInt(counts[2])/tole;
        float stucount=tole==0?0:100*Integer.parseInt(counts[1])/tole;
        float teacount=tole==0?0:100*Integer.parseInt(counts[0])/tole;
        model.addAttribute("mgr", mgrcount);
        model.addAttribute("tea", stucount);
        model.addAttribute("stu", teacount);


        int countLabs = laboratoryRepository.countLabs();
        model.addAttribute("labscount",countLabs);


        int countEqu = equipmentRepository.countEqu();

        model.addAttribute("equscount",countEqu);


    }
}
