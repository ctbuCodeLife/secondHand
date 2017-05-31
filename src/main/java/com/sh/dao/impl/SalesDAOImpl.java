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

    public List<Sales> listAll(){
        return salesDao.listAll();
    }

    public List<Sales> listByUid(Integer uid){
        return salesDao.listByUid(uid);
    }

    public List<Sales> listByPid(Integer pid) {return salesDao.listByPid(pid);}

    public List<Sales> listByStatus(String orderStatus){
        return salesDao.listByStatus(orderStatus);
    }

    public List<Sales> listByUidAndPid(Integer uid,Integer pid) {return salesDao.listByUidAndPid(uid,pid);}

    public List<Sales> listByUidAndStatus(Integer uid,String orderStatus) {return salesDao.listByUidAndStatus(uid,orderStatus);}

    public List<Sales> listByUidAndPidAndStatus(Integer uid,Integer pid,String orderStatus){
        return salesDao.listByUidAndPidAndStatus(uid,pid,orderStatus);
    }

    public List<Sales> findAllReqOrder(Integer uid){
        return salesDao.findAllReqOrder(uid);
    }
    public Sales select(Integer id){
        return salesDao.select(id);
    }

    public int count(){
        return salesDao.count();
    }
}
