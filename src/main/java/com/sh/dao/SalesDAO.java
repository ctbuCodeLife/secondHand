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

    @Select("select * from `sales` where id = #{id}")
    public Sales select(Integer id);

    @Select("select * from `sales`")
    public List<Sales> listAll();

    @Select("select * from `sales` where uId = #{uid}")
    public List<Sales> listByUid(Integer uid);

    @Select("select * from `sales` where pId = #{pid}")
    public List<Sales> listByPid(Integer pid);

    @Select("select * from `sales` where orderStatus like #{orderStatus}")
    public List<Sales> listByStatus(String orderStatus);

    @Select("select * from `sales` where uId = #{uid} and pId=#{pid}")
    public List<Sales> listByUidAndPid(Integer uid,Integer pid);

    @Select("select * from `sales` where uId = #{uid} and orderStatus like #{orderStatus}")
    public List<Sales> listByUidAndStatus(Integer uid,String orderStatus);


    @Select("select * from `sales` where uId = #{uid} and pId={pid} and orderStatus like #{orderStatus}")
    public List<Sales> listByUidAndPidAndStatus(Integer uid,Integer pid,String orderStatus);

    //级联查询
    @Select("select * from `sales` where sales.pId in (select id from product where uid=#{uid})")
    public List<Sales> findAllReqOrder(Integer uid);

    @Select("select count(id) from `sales`")
    public int count();
}