package com.sh.controller;

import com.alibaba.fastjson.JSON;
import com.sh.model.User;
import com.sh.service.UserService;
import com.sh.service.impl.UserServiceImpl;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by tao on 2017/5/15 0015.
 */
@RequestMapping("/api/user")
@RestController
public class UserController {
    private UserService service  = new UserServiceImpl();

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView register(User user, HttpSession session){
        user.setLevel(1);
        user.setScore(0);
        boolean result = service.registe(user);

        if (result == true) {
            session.setAttribute("msg", "注册成功,3秒后自动跳转到主页");
            session.setAttribute("autoReturn", "index.jsp");
        }else {
            session.setAttribute("msg", "注册失败,3秒后自动跳转到注册页面");
            session.setAttribute("autoReturn", "register.jsp");
        }
        ModelAndView view = new ModelAndView();
        view.setViewName("redirect:/info.jsp");
        return view;
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView register(String username,String password,HttpSession session){
        boolean result = service.login(username,password);

        if (result == true) {
            User user = service.getUserByName(username);
            session.setAttribute("user", user);
            session.setAttribute("msg", "登录成功,3秒后自动跳转到主页");
            session.setAttribute("autoReturn", "index.jsp");
        }else {
            session.setAttribute("msg", "登录失败,3秒后自动跳转到登录页面");
            session.setAttribute("autoReturn", "login.jsp");
        }
        ModelAndView view = new ModelAndView();
        view.setViewName("redirect:/info.jsp");
        return view;
    }

}
