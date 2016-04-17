package cn.gc.lab.service;

import cn.gc.lab.entity.Laboratory;
import cn.gc.lab.entity.Labstyle;
import cn.gc.lab.repository.LabstyleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

/**
 * Created by tristan on 16/4/11.
 */
@Service
public class LabStyleService {
    @Autowired
    private LabstyleRepository labstyleRepository;

    @Transactional
    public List<Labstyle> findAllLabstyle(){
        return labstyleRepository.findAll();
    }

    @Transactional
    public boolean save(Labstyle labstyle) {
        Labstyle save = labstyleRepository.save(labstyle);

        if (save!=null){
            return  true;
        }else {
            return false;
        }
    }

    @Transactional
    public Boolean deleteStyle(String uuid) {
        Labstyle one = labstyleRepository.findOne(uuid);
        Set<Laboratory> laboratorys = one.getLaboratorys();
        for (Laboratory lab:laboratorys){
            lab.setLabstyle(null);
        }
        labstyleRepository.delete(uuid);
        return true;
    }
}
