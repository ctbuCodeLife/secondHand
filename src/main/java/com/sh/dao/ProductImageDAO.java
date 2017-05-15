package com.sh.dao;

import com.sh.model.ProductImage;

import java.util.List;

import com.sh.model.User;
import org.apache.ibatis.annotations.*;

public interface ProductImageDAO {
    @Insert("insert into `product_image`(`pId`,`imageType`,`imageName`,`imageSrc`) VALUES (#{pId},#{imageType},#{imageName},#{imageSrc})")
    public int insert(User record);

    @Delete("delete from `product_image` where id = #{id}")
    public int delete(Integer id);

    @Update("update `product_image` set `pId`=#{pId},`imageType`=#{imageType},`imageName`=#{imageName},`imageSrc`=#{imageSrc} where id=#{id}")
    public int update(User record);

    @Select("select * from `product_image`")
    public List<User> findAll();

    @Select("select * from `product_image` where id = #{id}")
    public User select(Integer id);

    @Select("select count(id) from `product_image`")
    public int count();

}