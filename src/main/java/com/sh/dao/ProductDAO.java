package com.sh.dao;

import com.sh.model.Product;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductDAO {


    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);



    Product selectByPrimaryKey(Integer id);




    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKeyWithBLOBs(Product record);

    int updateByPrimaryKey(Product record);
}