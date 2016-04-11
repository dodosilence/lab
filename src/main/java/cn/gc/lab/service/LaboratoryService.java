package cn.gc.lab.service;

import cn.gc.lab.entity.Laboratory;
import cn.gc.lab.repository.LaboratoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by tristan on 16/4/11.
 */
@Service
public class LaboratoryService {

    @Autowired
    LaboratoryRepository laboratoryRepository;
    @Transactional
    public List<Laboratory> findLabsByLabStyle(String labstyle){

        List<Laboratory> laboratories = laboratoryRepository.findByLabstyle_Uuid(labstyle);

        return laboratories;
    }
}
