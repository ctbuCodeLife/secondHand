package com.sh.dao;

import com.sh.model.Cart;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CartDAO {


    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);


    Cart selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
}