package com.sh.dao;

import com.sh.model.Sales;

import java.util.List;

import com.sh.model.Sales;
import org.apache.ibatis.annotations.*;

public interface SalesDAO {
    @Insert("insert into `sales`(`uId`,`pId`,`count`,`totalPrice`,`orderDate`,`invoiceNo`,`orderStatus`,`delivDate`,`contactMan`,`contactTel`,`contactAddr`) VALUES (#{uId},#[pId},#{count},#{totalPrice},#{orderDate},#{invoiceNo},#{orderStatus},#{delivDate},#{contactMan},#{contactTel},#{contactAddr})")
    public int insert(Sales record);

    @Delete("delete from `sales` where id = #{id}")
    public int delete(Integer id);

    @Update("update `sales` set `uId`=#{uId},`pId`=#{pId},`count`=#{count},`totalPrice`=#{totalPrice},`orderDate`=#{orderDate},`invoiceNo`=#{invoiceNo},`orderStatus`=#{orderStatus},`delivDate`=#{delivDate},`contactMan`=#{contactMan},`contactTel`=#{contactTel},`contactAddr`=#{contactAddr} where id=#{id}")
    public int update(Sales record);

    @Select("select * from `sales`")
    public List<Sales> findAll();

    @Select("select * from `sales` where id = #{id}")
    public Sales select(Integer id);
    

    @Select("select count(id) from `sales`")
    public int count();
}