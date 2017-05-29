package com.sh.service.impl; 

import com.sh.model.Product;
import com.sh.service.ProductService;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

import java.util.List;

/** 
* ProductServiceImpl Tester. 
* 
* @author <Authors name> 
* @since <pre>���� 30, 2017</pre> 
* @version 1.0 
*/ 
public class ProductServiceImplTest { 

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: add(Product product) 
* 
*/ 
@Test
public void testAdd() throws Exception { 
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
* Method: update(Product product) 
* 
*/ 
@Test
public void testUpdate() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: findById(Integer id) 
* 
*/ 
@Test
public void testFindById() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: findByName(String name) 
* 
*/ 
@Test
public void testFindByName() throws Exception { 
//TODO: Test goes here...
    ProductService service = new ProductServiceImpl();
    List<Product> list = service.findByName("fdsafasdjfjasdf");
    System.out.println(list);
} 

/** 
* 
* Method: findByKid(Integer kid) 
* 
*/ 
@Test
public void testFindByKid() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: findByUid(Integer uid) 
* 
*/ 
@Test
public void testFindByUid() throws Exception { 
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
} 


} 
