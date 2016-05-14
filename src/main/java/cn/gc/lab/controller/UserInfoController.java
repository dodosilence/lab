package cn.gc.lab.controller;

import cn.gc.lab.entity.User;
import cn.gc.lab.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * Created by tristan on 16/5/14.
 */
@Controller
@RequestMapping({"teacher","student","mgr"})
public class UserInfoController {


    @Autowired
    UserRepository userRepository;

    @RequestMapping("info")
    public String userInf(HttpSession session,Model model) {

        User user = (User) session.getAttribute("user");

        user = userRepository.findOne(user.getUuid());
        model.addAttribute("user",user);
        return "root/userinfo";
    }


    @RequestMapping(value = "update",method = RequestMethod.POST)
    @Transactional
    public String updateUSerInfo(User user , @RequestParam("password")String psd,@RequestParam("password1")String psd1){
        User one = userRepository.findOne(user.getUuid());
        one.setPassword(user.getPassword());
        one.setAddress(user.getAddress());
        one.setPhone(user.getPhone());
        one.setTruename(user.getTruename());
        one.setPhone(user.getPhone());
        one.setEmail(user.getEmail());
        userRepository.save(one);
        return "redirect:info";
    }

}
