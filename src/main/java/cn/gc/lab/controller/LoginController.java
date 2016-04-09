package cn.gc.lab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tristan on 16/4/6.
 */
@Controller
@RequestMapping("/")
public class LoginController {


    @RequestMapping("login")
    public String loginPage(){

        return "page-login";
    }
}
