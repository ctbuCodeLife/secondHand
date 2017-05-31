package com.sh.dao;

import com.sh.model.Admin;

import java.util.List;

import com.sh.model.Admin;
import org.apache.ibatis.annotations.*;

public interface AdminDAO {

    @Insert("insert into `admin`(`username`,`password`,`email`,`level`) VALUES (#{username},#{password},#{email},#{level})")
    public int insert(Admin record);

    @Delete("delete from `admin` where id = #{id}")
    public int delete(Integer id);

    @Update("update `admin` set `username`=#{username},`password`=#{password},`level`=#{level} where id=#{id}")
    public int update(Admin record);

    @Select("select * from `admin`")
    public List<Admin> findAll();

    @Select("select * from `admin` where id = #{id}")
    public Admin select(Integer id);

    @Select("select * from `admin` where `username` = #{username}")
    public Admin getAdminByName(String username);

    @Select("select * from `admin` where `username`=#{username} and `password`=#{password}")
    public Admin getAdminByNameAndPassword(String username,String password);

    @Select("select `password` from `admin` where `username` = #{username}")
    public String getPasswordByName(String username);

    @Select("select count(id) from `admin`")
    public int count();
}