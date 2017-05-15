package com.sh.dao;

import com.sh.model.Hot;

import java.util.List;

import com.sh.model.Hot;
import org.apache.ibatis.annotations.*;

public interface HotDAO {

    @Insert("INSERT INTO `hot`(`pid`) VALUES (#{pid}")
    public int insert(Hot record);

    @Delete("delete from `hot` where id = #{id}")
    public int delete(Integer id);

    @Select("select * from `hot`")
    public List<Hot> findAll();

    @Select("select * from `hot` where id = #{id}")
    public Hot select(Integer id);

    @Select("select count(id) from `hot`")
    public int count();

}