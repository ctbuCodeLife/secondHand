package com.sh.dao;

import com.sh.model.Admin;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminDAO {

    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);


    Admin selectByPrimaryKey(Integer id);


    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}