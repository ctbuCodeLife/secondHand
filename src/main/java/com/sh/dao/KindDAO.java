package com.sh.dao;

import com.sh.model.Kind;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface KindDAO {


    int deleteByPrimaryKey(Integer id);

    int insert(Kind record);

    int insertSelective(Kind record);


    Kind selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(Kind record);

    int updateByPrimaryKey(Kind record);
}