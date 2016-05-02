package cn.gc.lab.controller;

import cn.gc.lab.controller.messagge.Message;
import cn.gc.lab.entity.Manager;
import cn.gc.lab.entity.Student;
import cn.gc.lab.entity.Teacher;
import cn.gc.lab.entity.User;
import cn.gc.lab.repository.ManagerRepository;
import cn.gc.lab.repository.StudentRepository;
import cn.gc.lab.repository.TeacherRepository;
import cn.gc.lab.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by tristan on 16/4/27.
 */
@Controller
@RequestMapping("mgr")
public class MgrOptionController {
    @Autowired
    TeacherRepository teacherRepository;

    @Autowired
    UserRepository userRepository;
    @RequestMapping("teacher/all")
    public String teachers(Model  model){
        List<Teacher> teachers = teacherRepository.findAll();
        model.addAttribute("teachers",teachers);
        return  "manager/teas/teacher";
    }


    @RequestMapping("teacher/delete/{teacher}")
    @ResponseBody
    public Object delteTea(@PathVariable("teacher") String tea){
        teacherRepository.delete(tea);
        return Message.success();
    }

    @RequestMapping(value = {"teacher/create"},method = RequestMethod.POST)
    @ResponseBody
    public Object createTea(User teacher){
        userRepository.save(teacher);
        Teacher teacher1 = new Teacher();
        teacher1.setUser(teacher);
        teacherRepository.save(teacher1);
        return  Message.success();
    }

    @Autowired
    ManagerRepository managerRepository;

    @RequestMapping("mgrs/all")
    public String mgrs(Model model){
        List<Manager> managers=managerRepository.findAll();
        model.addAttribute("managers",managers);
        return "manager/mgrs/managers";
    }

    @RequestMapping("mgrs/delete/{mgr}")
    @ResponseBody
    public Object delteMgr(@PathVariable("mgr") String mgr){
        managerRepository.delete(mgr);
        return Message.success();
    }

    @RequestMapping(value = {"mgrs/create"},method = RequestMethod.POST)
    @ResponseBody
    public Object createMgr(User user){
        userRepository.save(user);
        Manager manager = new Manager();
        manager.setUser(user);
        managerRepository.save(manager);
        return  Message.success();
    }


    @Autowired
    StudentRepository studentRepository;
    @RequestMapping("student/all")
    public String students(Model model){
        List<Student> students=studentRepository.findAll();
        model.addAttribute("students",students);
        return "manager/stus/student";
    }

    @RequestMapping("student/delete/{stu}")
    @ResponseBody
    public Object deltestu(@PathVariable("stu") String stu){
        studentRepository.delete(stu);
        return Message.success();
    }



    @RequestMapping(value = {"student/create"},method = RequestMethod.POST)
    @ResponseBody
    public Object crateStu(User user){
        userRepository.save(user);
        Student student = new Student();
        student.setUser(user);
        studentRepository.save(student);
        return  Message.success();
    }





}
