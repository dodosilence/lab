package cn.gc.lab.controller;

import cn.gc.lab.entity.User;
import cn.gc.lab.exception.ControllerException;
import cn.gc.lab.exception.ServiceException;
import cn.gc.lab.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
        User user = null;
        try {
            user = userService.findByUsernamePassword(username, password);
        } catch (ServiceException e) {
            throw  new ControllerException(e.getMessage());
        }
        session.setAttribute("user", user);
        return "redirect:index.html";
    }




    @RequestMapping("logout.do")
    public String logout(HttpSession session){

        if(session.getAttribute("user")!=null){
            session.removeAttribute("user");
        }

        return "redirect:index";
    }


}
