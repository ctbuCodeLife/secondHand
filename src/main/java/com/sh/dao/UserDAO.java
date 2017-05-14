package com.sh.dao;

import com.sh.model.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserDAO {
    @Insert("INSERT INTO `user`(`username`,`password`,`email`,`tel`,`sex`,`level`,`score`) VALUES (#{username},#{password},#{email},#{tel},#{sex},#{level},#{score})")
    public int insert(User record);

    @Delete("delete from `user` where id = #{id}")
    public int delete(Integer id);

    @Update("update `user` set `username`=#{username},`password`=#{password},`tel`=#{tel},`sex`=#{sex},`level`=#{level},`score`=#{score} where id=#{id}")
    public int update(User record);

    @Select("select * from `user`")
    public List<User> findAll();

    @Select("select * from `user` where id = #{id}")
    public User select(Integer id);

    @Select("select * from `user` where `username` = #{username}")
    public User getUserByName(String username);

    @Select("select count(id) from `user`")
    public int count();

}