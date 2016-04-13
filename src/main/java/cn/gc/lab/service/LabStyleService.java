package cn.gc.lab.service;

import cn.gc.lab.entity.Labstyle;
import cn.gc.lab.repository.LabstyleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
}
