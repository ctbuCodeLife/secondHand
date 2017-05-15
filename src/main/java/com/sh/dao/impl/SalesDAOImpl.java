package com.sh.dao.impl;

import com.sh.dao.SalesDAO;
import com.sh.model.Sales;
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
public class SalesDAOImpl implements SalesDAO {
    private SqlSessionFactory sessionFactory;
    private SqlSession session;
    private SalesDAO salesDao;

    public SalesDAOImpl() {
        String resource = "mybatis-conf.xml";
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
            session = sessionFactory.openSession();
            salesDao = session.getMapper(SalesDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public int insert(Sales record){
        int num =   salesDao.insert(record);
        session.commit();
        return num;
    }

    public int delete(Integer id){
        int num = salesDao.delete(id);
        session.commit();
        return num;
    }

    public int update(Sales record){
        int num =  salesDao.update(record);
        session.commit();
        return num;
    }

    public List<Sales> findAll(){
        return salesDao.findAll();
    }

    public Sales select(Integer id){
        return salesDao.select(id);
    }

    public int count(){
        return salesDao.count();
    }
}
