package com.sh.controller;

import com.alibaba.fastjson.JSON;
import com.sh.model.User;
import com.sh.service.UserService;
import com.sh.service.impl.UserServiceImpl;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by tao on 2017/5/15 0015.
 */
@RestController
public class UserController {
    private UserService service  = new UserServiceImpl();

    @RequestMapping("/show")
    public String showUser(){
        List<User> list = service.findAll();
        String json = JSON.toJSONString(list);
        return json;
    }
}
