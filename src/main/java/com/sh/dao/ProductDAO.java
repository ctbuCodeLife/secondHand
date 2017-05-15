package com.sh.dao;

import com.sh.model.Product;

import java.util.List;

import com.sh.model.Product;
import org.apache.ibatis.annotations.*;

public interface ProductDAO {

    @Insert("insert into `product`(`uId`,`kId`,`pName`,`pDesc`,`pNum`,`pImage`,`realPrice`,`originPrice`) VALUES (#{uid},#{kid},#{pName},#{pDesc},#{pNum},#{pImage},#{realPrice},#{originPrice})")
    public int insert(Product record);

    @Delete("delete from `product` where id = #{id}")
    public int delete(Integer id);

    @Update("update `product` set `uid`=#{uId},`kId`=#{kId},`pName`=#{pName},`pDesc`=#{pDesc},`pNum`=#{pNum},`pImage`=#{pImage},`realPrice`=#{realPrice},`originPrice`=#{originPrice}) where id=#{id}")
    public int update(Product record);

    @Select("select * from `product`")
    public List<Product> findAll();

    @Select("select * from `product` where id = #{id}")
    public Product select(Integer id);

    @Select("select * from `product` where `pName` = #{pName}")
    public Product getProductByName(String productname);

    @Select("select count(id) from `product`")
    public int count();

}