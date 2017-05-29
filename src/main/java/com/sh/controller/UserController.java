package com.sh.controller;

import com.alibaba.fastjson.JSON;
import com.sh.model.User;
import com.sh.service.UserService;
import com.sh.service.impl.UserServiceImpl;
import com.sh.util.Message;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tao on 2017/5/15 0015.
 */
@RequestMapping("/api/user")
@RestController
public class UserController {
    private UserService service  = new UserServiceImpl();

    @RequestMapping(value = "/register",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String register(User user, HttpSession session){
        Message msg = new Message();

        user.setLevel(1);
        user.setScore(0);
        user.setSex("保密");
        String name = user.getUsername();
        User u = service.getUserByName(name);
        if(u != null && u.getId() != null){
            msg.setStatus(0);
            List data = new ArrayList();
            data.add("注册失败,用户名已存在,3秒后自动跳转到注册页面");
            msg.setData(data);
            msg.setAutoReturn("register.jsp");
        }else {
            boolean result = service.registe(user);

            if (result == true) {
                msg.setStatus(1);
                List data = new ArrayList();
                data.add("注册成功,3秒后自动跳转到主页");
                msg.setData(data);
                msg.setAutoReturn("index.jsp");
            }
        }
        return msg.toString();
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String login(String username,String password,HttpSession session) {
        Message msg = new Message();//返回的json数据

        boolean result = service.login(username, password);

        if (result == true) {
            User user = service.getUserByName(username);
            session.setAttribute("user", user);
            msg.setStatus(1);
            List data = new ArrayList();
            data.add("登录成功,3秒后自动跳转到主页");
            msg.setData(data);
            msg.setAutoReturn("index.jsp");
        } else {
            msg.setStatus(0);
            List data = new ArrayList();
            data.add("登录失败,3秒后自动跳转到登录页面");
            msg.setData(data);
            msg.setAutoReturn("login.jsp");
        }
        return msg.toString();
    }

    @RequestMapping(value = "/logout",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String logout(HttpSession session){
        Message msg = new Message();

        User user = (User)session.getAttribute("user");
        if (user != null && user.getId() != null) {
            //用户已登录
            session.removeAttribute("user");
            msg.setStatus(1);
            List data = new ArrayList();
            data.add("注销成功,3秒后自动跳转到主页");
            msg.setData(data);
            msg.setAutoReturn("index.jsp");
        }else {
            msg.setStatus(0);
            List data = new ArrayList();
            data.add("注销失败,3秒后自动跳转到主页");
            msg.setData(data);
            msg.setAutoReturn("index.jsp");
        }
       return msg.toString();
    }

    @RequestMapping(value = "/getUserByName",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getUserByName(HttpServletRequest request, HttpServletResponse response){
        response.setHeader("Cache-Control", "no-cache");
        Message msg = new Message();
        String name = request.getParameter("name");
        User user = service.getUserByName(name);
        if(user == null || user.getId() == null){
            msg.setStatus(0);
            List data = new ArrayList();
            data.add("用户名不存在，可以注册");
            msg.setData(data);
        } else {
            msg.setStatus(1);
            List data = new ArrayList();
            data.add("用户已存在，请重新输入。");
            msg.setData(data);
        }
        return  msg.toString();
    }
}
