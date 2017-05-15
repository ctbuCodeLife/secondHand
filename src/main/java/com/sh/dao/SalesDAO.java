package com.sh.dao;

import com.sh.model.Sales;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SalesDAO {

    int deleteByPrimaryKey(Long id);

    int insert(Sales record);

    int insertSelective(Sales record);


    Sales selectByPrimaryKey(Long id);



    int updateByPrimaryKeySelective(Sales record);

    int updateByPrimaryKey(Sales record);
}