import cn.gc.lab.entity.Course;
import cn.gc.lab.entity.Laboratory;
import cn.gc.lab.entity.Manager;
import cn.gc.lab.repository.CourseRepository;
import cn.gc.lab.repository.ManagerRepository;

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
    public void init(){

        List<Manager> all = managerRepository.findAll();

    }
    
    
    @Autowired 
    CourseRepository courseRepository;
    @Test
    @Transactional
    public void testCourse(){
    	 Course course = courseRepository.findOneByTeacher_Courses_CourseNameIn(Arrays.asList("ss","dd"));
    	
    	
    }


}
