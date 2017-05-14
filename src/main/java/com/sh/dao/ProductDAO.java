package com.sh.dao;

import com.sh.model.Product;

import java.util.List;

import org.apache.ibatis.annotations.*;

public interface ProductDAO {

    @Insert("insert into `product`(`uId`,`kId`,`pName`,`pDesc`,`pNum`,`pImage`,`realPrice`,`originPrice`) VALUES (#{uid},#{kid},#{pname},#{pdesc},#{pnum},#{pimage},#{realprice},#{originprice})")
    public int insert(Product record);

    @Delete("delete from `product` where id = #{id}")
    public int delete(Integer id);

    @Update("update `product` set `uid`=#{uid},`kId`=#{kid},`pName`=#{pname},`pDesc`=#{pdesc},`pNum`=#{pnum},`pImage`=#{pimage},`realprice`=#{realprice},`originprice`=#{originprice}) where id=#{id}")
    public int update(Product record);

    @Select("select * from `product`")
    public List<Product> findAll();

    @Select("select * from `product` where uId = #{uid}")
    public List<Product> listByUid(Integer uid);

    @Select("select * from `product` where kId = #{kid}")
    public List<Product> listByKid(Integer kid);

    @Select("select * from `product` where id = #{id}")
    public Product select(Integer id);

    @Select("select * from `product` where `pName` = #{pname}")
    public Product getProductByName(String productname);

    @Select("select count(id) from `product`")
    public int count();

}