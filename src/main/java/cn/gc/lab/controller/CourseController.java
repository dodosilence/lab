package cn.gc.lab.controller;

import cn.gc.lab.controller.messagge.Message;
import cn.gc.lab.entity.*;
import cn.gc.lab.repository.*;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by tristan on 16/4/27.
 */
@Controller
@RequestMapping("mgr/course")
public class CourseController {
    @Autowired
    CourseRepository courseRepository;
    @Autowired
    LaboratoryRepository laboratoryRepository;

    @Autowired
    StudentRepository studentRepository;

    @RequestMapping("/list/all")
    public String list(Model model) {
        List<Course> courses = courseRepository.findAll();
        model.addAttribute("courses", courses);
        List<Laboratory> laboratories = laboratoryRepository.findAll();
        model.addAttribute("laboratories", laboratories);
        List<Teacher> teachers = teacherRepository.findAll();
        model.addAttribute("teachers", teachers);
        return "manager/course/course";

    }

    @RequestMapping(value = "/delete/{courseId}",method = RequestMethod.POST)
    @ResponseBody
    public Object delete(@PathVariable("courseId") String courseId) {
        courseRepository.delete(courseId);
        return Message.success();
    }

    @Autowired
    TeacherRepository teacherRepository;

    @RequestMapping(value = "create", method = RequestMethod.POST)
    @ResponseBody
    public Object create(String courseName, String labId, String teacherId) {
        Laboratory one = laboratoryRepository.findOne(labId);
        Teacher teacher = teacherRepository.findOne(teacherId);
        Course course = new Course();
        course.setCourseName(courseName);
        course.setLaboratory(one);
        course.setTeacher(teacher);
        courseRepository.save(course);
        return Message.success();
    }


    @RequestMapping("info/{courseId}")
    public String courseInfo(@PathVariable("courseId") String courseId, Model model){

        Course course = courseRepository.findOne(courseId);


        model.addAttribute("course",course);
        List<Student> students = studentRepository.findAll();
        model.addAttribute("students",students);

        return "manager/course/courseinfo";


    }




}
