package cn.gc.lab.controller;

import cn.gc.lab.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by tristan on 16/4/10.
 */
@RequestMapping("/")
@Controller
public class HomePageController {

    @RequestMapping({"/", "index","index.html"})
    public String homePage(HttpSession session) {
        String homePage = null;
        User user = (User) session.getAttribute("user");
        if (user != null) {
            if ("manager".equals(user.getRole())) {
                homePage = "redirect:manager/index.html";
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
