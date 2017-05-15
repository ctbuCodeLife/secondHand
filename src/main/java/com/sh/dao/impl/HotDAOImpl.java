package com.sh.dao.impl;

import com.sh.dao.HotDAO;
import com.sh.dao.HotDAO;
import com.sh.model.Hot;
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
public class HotDAOImpl implements HotDAO {
    private SqlSessionFactory sessionFactory;
    private SqlSession session;
    private HotDAO hotDao;

    public HotDAOImpl() {
        String resource = "mybatis-conf.xml";
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
            session = sessionFactory.openSession();
            hotDao = session.getMapper(HotDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public int insert(Hot record){
        int num =   hotDao.insert(record);
        session.commit();
        return num;
    }

    public int delete(Integer id){
        int num = hotDao.delete(id);
        session.commit();
        return num;
    }

    public List<Hot> findAll(){
        return hotDao.findAll();
    }

    public Hot select(Integer id){
        return hotDao.select(id);
    }

    public int count(){
        return hotDao.count();
    }
}
