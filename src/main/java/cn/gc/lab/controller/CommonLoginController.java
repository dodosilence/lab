package cn.gc.lab.controller;

import cn.gc.lab.entity.Manager;
import cn.gc.lab.entity.Student;
import cn.gc.lab.entity.Teacher;
import cn.gc.lab.entity.User;
import cn.gc.lab.exception.ControllerException;
import cn.gc.lab.exception.ServiceException;
import cn.gc.lab.repository.ManagerRepository;
import cn.gc.lab.repository.StudentRepository;
import cn.gc.lab.repository.TeacherRepository;
import cn.gc.lab.repository.UserRepository;
import cn.gc.lab.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * Created by tristan on 16/4/6.
 */
@Controller
@RequestMapping("/")
public class CommonLoginController {

    @Autowired
    UserService userService;

    @RequestMapping("login.do")
    public String login(@RequestParam(value = "username", required = true) String username,
                        @RequestParam(value = "password", required = true) String password, HttpSession session) throws Exception {
        initOneUser();
        User user = null;
        try {
            user = userService.findByUsernamePassword(username, password);
        } catch (ServiceException e) {
            throw new ControllerException(e.getMessage());
        }
        session.setAttribute("user", user);
        return "redirect:index.html";
    }


    @RequestMapping("logout.do")
    public String logout(HttpSession session) {

        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
        }

        return "redirect:index";
    }

    @Autowired
    UserRepository userRepository;

    @Autowired
    ManagerRepository managerRepository;
    @Autowired
    StudentRepository studentRepository;
    @Autowired
    TeacherRepository teacherRepository;

    @Transactional
    private void initOneUser() {

        //设置管理员登陆的用户和密码    用户名：manager 密码：root
        User man = userRepository.findOneByUsername("manager");
        if (man == null) {
            Manager manager = new Manager();
            User user = new User();
            user.setUsername("manager");
            user.setPassword("root");
            user.setRole("manager");
            userRepository.save(user);
            manager.setUser(user);
            managerRepository.save(manager);

        }
        
       //设置学生登陆的用户和密码    用户名：student 密码：root
        User stu = userRepository.findOneByUsername("student");
        if (stu == null) {
            Student student = new Student();
            User user1 = new User();
            user1.setUsername("student");
            user1.setPassword("root");
            user1.setRole("student");
            userRepository.save(user1);
            studentRepository.save(student);
        }
        
        //设置教师登陆的用户和密码    用户名：teacher 密码：root
        User tea = userRepository.findOneByUsername("teacher");
        if (tea == null) {
            Teacher teacher = new Teacher();
            User user2 = new User();
            user2.setUsername("teacher");
            user2.setPassword("root");
            user2.setRole("teacher");

            userRepository.save(user2);

            teacher.setUser(user2);
            teacherRepository.save(teacher);
        }
    }


}
