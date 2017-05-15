package com.sh.dao.impl; 

import com.sh.dao.ProductDAO;
import com.sh.model.Product;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

import java.util.List;

/** 
* ProductDAOImpl Tester. 
* 
* @author <Authors name> 
* @since <pre>���� 15, 2017</pre> 
* @version 1.0 
*/ 
public class ProductDAOImplTest { 

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: insert(Product record) 
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
* Method: update(Product record) 
* 
*/ 
@Test
public void testUpdate() throws Exception { 
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
    ProductDAO productDao = new ProductDAOImpl();
    List<Product> list = productDao.findAll();
    for(Product product :list){
        System.out.println(product);
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
* Method: getProductByName(String productname) 
* 
*/ 
@Test
public void testGetProductByName() throws Exception { 
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
