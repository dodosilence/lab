package cn.gc.lab.controller;

import cn.gc.lab.entity.Course;
import cn.gc.lab.entity.Project;
import cn.gc.lab.entity.Teacher;
import cn.gc.lab.repository.ProjectRepository;
import cn.gc.lab.repository.TeacherRepository;
import cn.gc.lab.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by tristan on 16/5/1.
 */

@Controller
@RequestMapping("teacher")
public class TeacehrBaseController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    TeacherRepository teacherRepository;
    @Autowired
    ProjectRepository projectRepository;


    @RequestMapping("course/list/{userId}")
    public String course(@PathVariable("userId") String userid, Model model){
       Teacher teacher= teacherRepository.findOneByUser_Uuid(userid);
        model.addAttribute("courses",teacher.getCourses());
        return "teacher/course/course";
    }



    @RequestMapping("project/list/{userId}")
    public String project(@PathVariable("userId") String userid, Model model){
        Teacher teacher= teacherRepository.findOneByUser_Uuid(userid);
        model.addAttribute("courses",teacher.getCourses());
        List<Project> projectList= projectRepository.findByCourse_Teacher_User_Uuid(userid);
        model.addAttribute("projects",projectList);
        return "teacher/project/project";
    }
}
