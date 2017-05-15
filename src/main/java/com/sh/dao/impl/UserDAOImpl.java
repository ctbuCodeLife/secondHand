package com.sh.dao.impl;

import com.sh.dao.UserDAO;
import com.sh.model.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

/**
 * Created by tao on 2017/5/15 0015.
 */
public class UserDAOImpl implements UserDAO {
    private SqlSessionFactory sessionFactory;
    private SqlSession session;
    private UserDAO userDao;

    public UserDAOImpl() {
        String resource = "mybatis-conf.xml";
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
            session = sessionFactory.openSession();
            userDao = session.getMapper(UserDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public int insert(User record){
        int num =   userDao.insert(record);
        session.commit();
        return num;
    }

    public int delete(Integer id){
        int num = userDao.delete(id);
        session.commit();
        return num;
    }

    public int update(User record){
        int num =  userDao.update(record);
        session.commit();
        return num;
    }

    public List<User> findAll(){
        return userDao.findAll();
    }

    public User select(Integer id){
        return userDao.select(id);
    }

    public User getUserByName(String username){
        return  userDao.getUserByName(username);
    }

    public int count(){
        return userDao.count();
    }
}
