package com.sh.service.impl;

import com.sh.dao.ProductDAO;
import com.sh.dao.impl.ProductDAOImpl;
import com.sh.model.Product;
import com.sh.service.ProductService;

import java.util.List;

/**
 * Created by tao on 2017/5/29 0029.
 */
public class ProductServiceImpl implements ProductService {
    private ProductDAO productDao ;

    public ProductServiceImpl(){
        productDao = new ProductDAOImpl();
    }
    //添加商品
    public boolean add (Product product) {
        return  productDao.insert(product) == 1;
    }
    //删除商品
    public boolean delete(Integer id){
        return productDao.delete(id) == 1;
    }
    //修改商品
    public boolean update(Product product) {
        return productDao.update(product) == 1;
    }
    //按照id查询商品
    public Product findById(Integer id){
        return productDao.select(id);
    }
    //按照名称查询商品
    public List<Product> findByName(String name) {
        return productDao.getProductByLikeName(name);
    }
    //按照类别id查询商品
    public List<Product> findByKid(Integer kid) {
        return productDao.listByKid(kid);
    }
    //按照用户id查询商品
    public List<Product> findByUid(Integer uid) {
        return productDao.listByUid(uid);
    }
    //查询所有商品
    public List<Product> findAll() {
        return productDao.findAll();
    }

}
