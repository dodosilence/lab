package cn.gc.lab.interceptor;

import cn.gc.lab.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by tristan on 16/4/10.
 */
public class ManagerInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object o) throws Exception {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user.getRole().equals("manager")) {
            return true;
        } else {
            return false;
        }

    }

    public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest req, HttpServletResponse resp, Object o, Exception e) throws Exception {

    }
}
