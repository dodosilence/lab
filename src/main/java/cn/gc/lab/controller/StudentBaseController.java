package cn.gc.lab.controller;

import cn.gc.lab.entity.Course;
import cn.gc.lab.entity.Project;
import cn.gc.lab.entity.Student;
import cn.gc.lab.entity.Teacher;
import cn.gc.lab.repository.ProjectRepository;
import cn.gc.lab.repository.StudentRepository;
import cn.gc.lab.repository.TeacherRepository;
import cn.gc.lab.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by tristan on 16/5/1.
 */

@Controller
@RequestMapping("student")
public class StudentBaseController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    TeacherRepository teacherRepository;
    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    StudentRepository studentRepository;

    @RequestMapping("course/list/{userId}")
    public String course(@PathVariable("userId") String userid, Model model){
       Student student= studentRepository.findOneByUser_Uuid(userid);
        model.addAttribute("courses",student.getCourses());
        return "teacher/course/course";
    }



    @RequestMapping("project/list/{userId}")
    public String project(@PathVariable("userId") String userid, Model model){
        Student student= studentRepository.findOneByUser_Uuid(userid);
        model.addAttribute("courses",student.getCourses());
        ArrayList<Project> projects = new ArrayList<Project>();
        for (Course c:student.getCourses()){
            projects.addAll(c.getProjects());
        }
        model.addAttribute("projects",projects);
        return "teacher/project/project";
    }
}
