package com.sh.dao;

import com.sh.model.Kind;

import java.util.List;

import com.sh.model.Kind;
import org.apache.ibatis.annotations.*;

public interface KindDAO {
    @Insert("insert into `kind`(`kName`) VALUES (#{kName})")
    public int insert(Kind record);

    @Delete("delete from `kind` where id = #{id}")
    public int delete(Integer id);

    @Update("update `kind` set `kName`=#{kName}, where id=#{id}")
    public int update(Kind record);

    @Select("select * from `kind`")
    public List<Kind> findAll();

    @Select("select * from `kind` where id = #{id}")
    public Kind select(Integer id);

    @Select("select * from `kind` where `kName` = #{kName}")
    public Kind getKindByName(String kName);

    @Select("select count(id) from `kind`")
    public int count();
}