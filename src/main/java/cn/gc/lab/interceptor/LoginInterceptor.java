package cn.gc.lab.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by tristan on 16/4/6.
 */
public class LoginInterceptor implements HandlerInterceptor {


    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object o) throws Exception {


        HttpSession session = req.getSession();
        Object user = session.getAttribute("user");
        if (user != null) {
            return true;

        } else {
            resp.sendRedirect(req.getContextPath() + "/page-login.html");
            return false;
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
