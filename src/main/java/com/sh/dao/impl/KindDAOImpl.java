package com.sh.dao.impl;

import com.sh.dao.KindDAO;
import com.sh.model.Kind;
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
public class KindDAOImpl implements KindDAO {
    private SqlSessionFactory sessionFactory;
    private SqlSession session;
    private KindDAO userDao;

    public KindDAOImpl() {
        String resource = "mybatis-conf.xml";
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
            session = sessionFactory.openSession();
            userDao = session.getMapper(KindDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public int insert(Kind record){
        int num =   userDao.insert(record);
        session.commit();
        return num;
    }

    public int delete(Integer id){
        int num = userDao.delete(id);
        session.commit();
        return num;
    }

    public int update(Kind record){
        int num =  userDao.update(record);
        session.commit();
        return num;
    }

    public List<Kind> findAll(){
        return userDao.findAll();
    }

    public Kind select(Integer id){
        return userDao.select(id);
    }

    public Kind getKindByName(String username){
        return  userDao.getKindByName(username);
    }

    public int count(){
        return userDao.count();
    }
}
