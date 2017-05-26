package com.sh.dao.impl;

import com.sh.dao.CartDAO;
import com.sh.dao.CartDAO;
import com.sh.model.Cart;
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
public class CartDAOImpl implements CartDAO {
    private SqlSessionFactory sessionFactory;
    private SqlSession session;
    private CartDAO cartDao;

    public CartDAOImpl() {
        String resource = "mybatis-conf.xml";
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
            session = sessionFactory.openSession();
            cartDao = session.getMapper(CartDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public int insert(Cart record){
        int num =   cartDao.insert(record);
        session.commit();
        return num;
    }

    public int delete(Integer id){
        int num = cartDao.delete(id);
        session.commit();
        return num;
    }

    public int update(Cart record){
        int num =  cartDao.update(record);
        session.commit();
        return num;
    }

    public List<Cart> findAll(){
        return cartDao.findAll();
    }

    public Cart select(Integer id){
        return cartDao.select(id);
    }

    public Cart selectByUidAndPid(Integer uId, Integer pId){
        return cartDao.selectByUidAndPid(uId, pId);
    }

    public int count(){
        return cartDao.count();
    }
}
