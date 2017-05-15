package com.sh.dao.impl; 

import com.sh.dao.HotDAO;
import com.sh.model.Hot;
import org.junit.Test; 
import org.junit.Before; 
import org.junit.After;

import java.util.List;

/** 
* HotDAOImpl Tester. 
* 
* @author <Authors name> 
* @since <pre>���� 15, 2017</pre> 
* @version 1.0 
*/ 
public class HotDAOImplTest { 

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: insert(Hot record) 
* 
*/ 
@Test
public void testInsert() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: delete(Integer id) 
* 
*/ 
@Test
public void testDelete() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: findAll() 
* 
*/ 
@Test
public void testFindAll() throws Exception { 
//TODO: Test goes here... 
    HotDAO productDao = new HotDAOImpl();
    List<Hot> list = productDao.findAll();
    for(Hot hot :list){
        System.out.println(hot);
    }
} 

/** 
* 
* Method: select(Integer id) 
* 
*/ 
@Test
public void testSelect() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: count() 
* 
*/ 
@Test
public void testCount() throws Exception { 
//TODO: Test goes here... 
} 


} 
