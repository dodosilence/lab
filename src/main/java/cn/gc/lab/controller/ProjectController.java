package cn.gc.lab.controller;

import antlr.debug.MessageAdapter;
import cn.gc.lab.controller.messagge.Message;
import cn.gc.lab.entity.Course;
import cn.gc.lab.entity.Project;
import cn.gc.lab.repository.CourseRepository;
import cn.gc.lab.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by tristan on 16/4/27.
 */
@Controller
@RequestMapping("mgr/project")
public class ProjectController {
    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    CourseRepository courseRepository;


    @RequestMapping("list/all")
    public String list(Model model){
        List<Project> projects = projectRepository.findAll();
        model.addAttribute("projects",projects);
        List<Course> courses = courseRepository.findAll();
        model.addAttribute("courses",courses);
        return "manager/project/project";

    }



    @RequestMapping(value = "/create",method = RequestMethod.POST)
    @ResponseBody
    public Object create(String projectName, String course, @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date endDateTime,
                         @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date startDateTime){
        Project project = new Project();

        project.setProjectName(projectName);
        Course one = courseRepository.findOne(course);
        project.setCourse(one);
        project.setEndDateTime(endDateTime);
        project.setStartDateTime(startDateTime);
        projectRepository.save(project);
        return Message.success();
    }
}
