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
    public boolean registe(User user){
        return   userDao.insert(user) == 1;
    }
    //用户登录
    public boolean login(String name, String password){
        User user = new User();
        user = userDao.getUserByName(name);
        if (user != null && user.getPassword().equals(password)){
            //表明用户密码正确,登录成功.
            return true;
        }
        return false;
    }
    //所用用户
    public List<User> findAll(){
        return userDao.findAll();
    }
    //根据用户名查找用户
    public User getUserByName(String username){
        return userDao.getUserByName(username);
    }
}
