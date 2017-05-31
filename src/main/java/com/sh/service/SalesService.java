package com.sh.service;

import com.sh.model.Sales;

import java.util.List;

/**
 * Created by tao on 2017/5/30 0030.
 */
public interface SalesService  {
    //添加订单
    public boolean add (Sales sales);
    //删除订单
    public boolean delete(Integer id);
    //修改订单
    public boolean update(Sales sales);
    //按照id查询订单
    public Sales findById(Integer id);
    //按照用户id查询订单
    public List<Sales> findByUid(Integer uid);
    //按照商品id查询订单
    public List<Sales> findByPid(Integer pid);
    //按照订单状态查询订单
    public List<Sales> findByStatus(String orderStatus);
    //按照用户id和订单状态查询订单
    public List<Sales> findByUidAndStatus(Integer uid, String orderStatus);
    //查询所有订单
    public List<Sales> findAll();
}
