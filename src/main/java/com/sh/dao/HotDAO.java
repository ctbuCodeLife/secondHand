package com.sh.dao;

import com.sh.model.Hot;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HotDAO {


    int deleteByPrimaryKey(Integer id);

    int insert(Hot record);

    int insertSelective(Hot record);


    Hot selectByPrimaryKey(Integer id);


    int updateByPrimaryKeySelective(Hot record);

    int updateByPrimaryKey(Hot record);
}