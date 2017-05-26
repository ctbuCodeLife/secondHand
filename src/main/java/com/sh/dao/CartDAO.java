package com.sh.dao;

import com.sh.model.Cart;

import java.util.List;

import com.sh.model.Cart;
import org.apache.ibatis.annotations.*;

public interface CartDAO {

    @Insert("insert into `cart`(`uId`,`pId`,`count`,`isBuy`,`totalPrice`) VALUES (#{uid},#{pid},#{count},#{isbuy},#{totalprice})")
    public int insert(Cart record);

    @Delete("delete from `cart` where id = #{id}")
    public int delete(Integer id);

    @Update("update `cart` set `uId`=#{uId},`pId`=#{pId},`count`=#{count},`isBuy`=#{isbuy},`totalPrice`=#{totalprice} where id=#{id}")
    public int update(Cart record);

    @Select("select * from `cart`")
    public List<Cart> findAll();

    @Select("select * from `cart` where id = #{id}")
    public Cart select(Integer id);

    @Select("select * from `cart` where `uId` = #{uId} and `pId` = #{pId}")
    public Cart selectByUidAndPid(Integer uId, Integer pId);

    @Select("select count(id) from `cart`")
    public int count();
}