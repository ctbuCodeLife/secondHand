package com.sh.dao.impl;

import com.sh.dao.ProductDAO;
import com.sh.model.Product;
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
public class ProductDAOImpl implements ProductDAO {
    private SqlSessionFactory sessionFactory;
    private SqlSession session;
    private ProductDAO productDao;

    public ProductDAOImpl() {
        String resource = "mybatis-conf.xml";
        try {
            Reader reader = Resources.getResourceAsReader(resource);
            sessionFactory = new SqlSessionFactoryBuilder().build(reader);
            session = sessionFactory.openSession();
            productDao = session.getMapper(ProductDAO.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public int insert(Product record){
        int num =   productDao.insert(record);
        session.commit();
        return num;
    }

    public int delete(Integer id){
        int num = productDao.delete(id);
        session.commit();
        return num;
    }

    public int update(Product record){
        int num =  productDao.update(record);
        session.commit();
        return num;
    }

    public List<Product> findAll(){
        return productDao.findAll();
    }

    public List<Product> listByUid(Integer uid){
        return productDao.listByUid(uid);
    }

    public List<Product> listByKid( Integer kid){
        return productDao.listByKid(kid);
    }

    public List<Product> listByStatus(Integer status){
        return productDao.listByStatus(status);
    }

    public List<Product> listByUidAndStatus(Integer userid, Integer status){
        return productDao.listByUidAndStatus(userid,status);
    }

    public Product select(Integer id){
        return productDao.select(id);
    }

    public List<Product> getProductByLikeName( String productname){
        return productDao.getProductByLikeName(productname);
    }

    public List<Product> getProductByUidAndLikeName(Integer uid, String productname){
        return productDao.getProductByUidAndLikeName(uid,productname);
    }

    public Product getProductByName(String productname){
        return  productDao.getProductByName(productname);
    }

    public int count(){
        return productDao.count();
    }
}
