package com.sh.service;

import com.sh.model.User;

import java.util.List;

/**
 * Created by tao on 2017/5/15 0015.
 */
public interface UserService {
    //用户注册
    public void registe(User user);
    //用户登录
    public void login(String name, String password);
    //所用用户
    public List<User> findAll();
}
