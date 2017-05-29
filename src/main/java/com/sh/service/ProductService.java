package com.sh.service;

import com.sh.model.Product;

import java.util.List;

/**
 * Created by tao on 2017/5/29 0029.
 */
public interface ProductService {
    //添加商品
    public boolean add (Product product);
    //删除商品
    public boolean delete(Integer id);
    //修改商品
    public boolean update(Product product);
    //按照id查询商品
    public Product findById(Integer id);
    //按照名称查询商品
    public List<Product> findByName(String name);
    //按照类别id查询商品
    public List<Product> findByKid(Integer kid);
    //按照用户id查询商品
    public List<Product> findByUid(Integer uid);
    //按照商品状态查询商品
    public List<Product> findByStatus(Integer status);
    //按照用户id和商品状态查询商品
    public List<Product> findByUidAndStatus(Integer uid, Integer status);
    //查询所有商品
    public List<Product> findAll();
}
