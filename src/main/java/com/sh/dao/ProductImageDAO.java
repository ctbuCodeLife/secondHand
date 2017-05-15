package com.sh.dao;

import com.sh.model.ProductImage;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductImageDAO {


    int deleteByPrimaryKey(Integer id);

    int insert(ProductImage record);

    int insertSelective(ProductImage record);



    ProductImage selectByPrimaryKey(Integer id);




    int updateByPrimaryKeySelective(ProductImage record);

    int updateByPrimaryKeyWithBLOBs(ProductImage record);

    int updateByPrimaryKey(ProductImage record);
}