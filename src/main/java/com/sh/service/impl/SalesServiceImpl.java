package com.sh.service.impl;

import com.sh.dao.SalesDAO;
import com.sh.dao.impl.SalesDAOImpl;
import com.sh.model.Sales;
import com.sh.service.SalesService;

import java.util.List;

/**
 * Created by tao on 2017/5/30 0030.
 */
public class SalesServiceImpl implements SalesService {
    private SalesDAO salesDao;

    public SalesServiceImpl(){
        salesDao = new SalesDAOImpl();
    }
    //添加订单
    public boolean add (Sales sales){
        return  1 == salesDao.insert(sales);
    }
    //删除订单
    public boolean delete(Integer id){
        return 1 == salesDao.delete(id);
    }
    //修改订单
    public boolean update(Sales sales){
        return 1 == salesDao.update(sales);
    }
    //按照id查询订单
    public Sales findById(Integer id){
        return salesDao.select(id);
    }
    //按照用户id查询订单
    public List<Sales> findByUid(Integer uid){
        return salesDao.listByUid(uid);
    }
    //按照商品id查询订单
    public List<Sales> findByPid(Integer pid){
        return salesDao.listByPid(pid);
    }
    //按照订单状态查询订单
    public List<Sales> findByStatus(String orderStatus){
        return salesDao.listByStatus(orderStatus);
    }
    //按照用户id和订单状态查询订单
    public List<Sales> findByUidAndStatus(Integer uid, String orderStatus){
        return salesDao.listByUidAndStatus(uid,orderStatus);
    }
    //查询所有订单
    public List<Sales> findAll(){
        return salesDao.listAll();
    }
}
