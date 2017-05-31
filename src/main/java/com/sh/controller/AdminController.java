package com.sh.controller;

import com.sh.dao.AdminDAO;
import com.sh.dao.impl.AdminDAOImpl;
import com.sh.model.Admin;
import com.sh.model.User;
import com.sh.service.UserService;
import com.sh.service.impl.UserServiceImpl;
import com.sh.util.Message;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tao on 2017/5/26 0026.
 */
@RestController
@RequestMapping("/api/admin")
public class AdminController {
    private AdminDAO adminDAO;
    private UserService userService;
    public AdminController(){
        adminDAO = new AdminDAOImpl();
        userService = new UserServiceImpl();
    }
    @RequestMapping(value = "/login", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String login(HttpServletRequest request,HttpSession session){
        Message msg = new Message();
        List<Object> data = new ArrayList<Object>();

        String username = request.getParameter("name");
        String password = request.getParameter("password");

        Admin admin = new Admin();
        String pwd = adminDAO.getPasswordByName(username);
        if(password.equals(pwd)){
            //登录成功
            admin = adminDAO.getAdminByName(username);
        }
        if(admin == null || admin.getId() == null){
            //管理员登录失败
            if(userService.login(username,password) == true){
                //卖家登录成功
                User saleser= userService.getUserByName(username);
                session.setAttribute("saleser",saleser);
                msg.setStatus(2);
                data.add("卖家登录成功，3秒后自动跳转到卖家主页。");
                msg.setData(data);
                msg.setAutoReturn("saleser.jsp");
            } else {
                msg.setStatus(0);
                data.add("帐号或者密码错误！，3秒后自动跳转到登录页面。");
                msg.setData(data);
                msg.setAutoReturn("login.jsp");
            }
        } else {
            //管理员登录成功
            session.setAttribute("admin",admin);
            msg.setStatus(1);
            data.add("管理员登录成功，3秒后自动跳转到管理员主页。");
            msg.setData(data);
            msg.setAutoReturn("index.jsp");
        }
        return msg.toString();
    }

    @RequestMapping(value = "/logout", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String logout(HttpSession session){
        Message msg = new Message();
        Admin admin = (Admin)session.getAttribute("admin");
        if (admin != null && admin.getId() != null) {
            //管理已登录
            session.removeAttribute("user");
            msg.setStatus(1);
            List data = new ArrayList();
            data.add("注销成功,3秒后自动跳转到登录页面");
            msg.setData(data);
            msg.setAutoReturn("login.jsp");
        }else {
            //管理员未登录
            User saleser = (User)session.getAttribute("saleser");
            if (saleser != null && saleser.getId() != null) {
                //用户已登录
                session.removeAttribute("user");
                msg.setStatus(1);
                List data = new ArrayList();
                data.add("注销成功,3秒后自动跳转到主页");
                msg.setData(data);
                msg.setAutoReturn("login.jsp");
            }else {
                msg.setStatus(0);
                List data = new ArrayList();
                data.add("注销失败,3秒后自动跳转到主页");
                msg.setData(data);
                msg.setAutoReturn("index.jsp");
            }
        }
        return msg.toString();
    }

    @RequestMapping(value = "/listAll", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findAll() {
        List<Admin> list = new ArrayList<Admin>();
        list = adminDAO.findAll();

        //此处定义data是为了返回前台统一使用msg
        List<Object> data = new ArrayList<Object>();
        for (int i = 0; i < list.size(); i++) {
            data.add(list.get(i));
        }

        int status = 0;
        if (list != null) {
            status = 1;
        } else {
            status = 0;
        }

        Message msg = new Message();
        msg.setStatus(status);
        msg.setData(data);
        return msg.toString();
    }
}
