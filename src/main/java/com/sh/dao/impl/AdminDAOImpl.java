package com.sh.dao.impl;

import com.sh.dao.AdminDAO;
import com.sh.dao.AdminDAO;
import com.sh.model.Admin;
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
public class AdminDAOImpl implements AdminDAO {
    private SqlSessionFactory sessionFactory;
    private SqlSession session;
    private AdminDAO adminDao;

    public AdminDAOImpl() {
        String resource = "mybatis-conf.xml";
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
            session = sessionFactory.openSession();
            adminDao = session.getMapper(AdminDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public int insert(Admin record){
        int num =   adminDao.insert(record);
        session.commit();
        return num;
    }

    public int delete(Integer id){
        int num = adminDao.delete(id);
        session.commit();
        return num;
    }

    public int update(Admin record){
        int num =  adminDao.update(record);
        session.commit();
        return num;
    }

    public List<Admin> findAll(){
        return adminDao.findAll();
    }

    public Admin select(Integer id){
        return adminDao.select(id);
    }

    public Admin getAdminByName(String username){
        return  adminDao.getAdminByName(username);
    }

    public int count(){
        return adminDao.count();
    }
}
