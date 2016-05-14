package cn.gc.lab.controller;

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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by tristan on 16/4/10.
 */
@RequestMapping("/")
@Controller
public class HomePageController {



    @RequestMapping({"/", "index","index.html"})
    public String homePage(HttpSession session, Model model) {
        String homePage = null;

        User user = (User) session.getAttribute("user");
        if (user != null) {
            if ("manager".equals(user.getRole())) {

                homePage = "redirect:mgr/index.html";
            } else if ("teacher".equals(user.getRole())) {

                homePage = "redirect:teacher/index.html";
            } else {
                homePage = "redirect:student/index.html";
            }
        } else {
            homePage = "redirect:page-login.html";
        }

        return homePage;
    }



}
