package com.sh.service.impl;

import com.sh.dao.UserDAO;
import com.sh.dao.impl.UserDAOImpl;
import com.sh.model.User;
import com.sh.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by tao on 2017/5/15 0015.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    private UserDAO userDao ;

    public UserServiceImpl(){
        userDao = new UserDAOImpl();
    }

    //用户注册
    public void registe(User user){
        userDao.insert(user);
    }
    //用户登录
    public void login(String name, String password){
        User user = new User();
        user = userDao.getUserByName(name);
        if (user.getPassword().equals(password)){
            //表明用户密码正确,登录成功.

        }
    }
    //所用用户
    public List<User> findAll(){
        return userDao.findAll();
    }
}
