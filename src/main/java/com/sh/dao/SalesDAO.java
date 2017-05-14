package com.sh.dao;

import com.sh.model.Sales;

import java.util.List;

import com.sh.model.Sales;
import org.apache.ibatis.annotations.*;

public interface SalesDAO {
    @Insert("insert into `sales`(`uId`,`pId`,`count`,`totalPrice`,`orderDate`,`invoiceNo`,`orderStatus`,`delivDate`,`contactMan`,`contactTel`,`contactAddr`) VALUES (#{uid},#{pid},#{count},#{totalprice},#{orderdate},#{invoiceno},#{orderstatus},#{delivdate},#{contactman},#{contacttel},#{contactaddr})")
    public int insert(Sales record);

    @Delete("delete from `sales` where id = #{id}")
    public int delete(Integer id);

    @Update("update `sales` set `uid`=#{uid},`pid`=#{pid},`count`=#{count},`totalprice`=#{totalprice},`orderdate`=#{orderdate},`invoiceno`=#{invoiceno},`orderstatus`=#{orderstatus},`delivdate`=#{delivdate},`contactman`=#{contactman},`contacttel`=#{contacttel},`contactaddr`=#{contactaddr} where id=#{id}")
    public int update(Sales record);

    @Select("select * from `sales`")
    public List<Sales> findAll();

    //级联查询
    @Select("select * from `sales` where sales.pId in (select pId from product where uid=#{uid})")
    public List<Sales> findAllReqOrder(Integer uid);

    @Select("select * from `sales` where id = #{id}")
    public Sales select(Integer id);

    @Select("select count(id) from `sales`")
    public int count();
}