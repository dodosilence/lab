import cn.gc.lab.entity.*;
import cn.gc.lab.repository.*;

import cn.gc.lab.service.HomeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * Created by tristan on 16/4/6.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-context.xml")
public class EntityTest {

    @Autowired
    private ManagerRepository managerRepository;

    @Test
    public void init() {

        List<Manager> all = managerRepository.findAll();

    }


    @Autowired
    CourseRepository courseRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    HomeService homeService;
    @Test
    public void testCourse() {
        String mgrcount = userRepository.mgrcount();


    }

    @Autowired
    LabstyleRepository labstyleRepository;

    @Test
    public void insertStyle() {
        Labstyle labstyle = new Labstyle();
        labstyle.setStyleName("其他实验室");
        labstyleRepository.save(labstyle);
    }

    @Autowired
    LaboratoryRepository laboratoryRepository;

    @Test
    public void inserLab(){
        Labstyle labstyle = labstyleRepository.findOne("402881885405c8b0015405c8ba090000");


        Laboratory laboratory = new Laboratory();
        laboratory.setLabName("物理实验室");
        laboratory.setPosition("四楼402");
        laboratory.setLabstyle(labstyle);
        Laboratory save = laboratoryRepository.save(laboratory);


    }


}
