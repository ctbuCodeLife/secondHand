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
    ProductDAO productDAO = new ProductDAOImpl();
    int result   = productDAO.delete(new Integer(00027));
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
} 

/** 
* 
* Method: listByUid(Integer uid) 
* 
*/ 
@Test
public void testListByUid() throws Exception { 
//TODO: Test goes here...
    ProductDAO productDAO = new ProductDAOImpl();
    List<Product> list = productDAO.listByUid(10000);
    System.out.println(list);
} 

/** 
* 
* Method: listByKid(Integer kid) 
* 
*/ 
@Test
public void testListByKid() throws Exception { 
//TODO: Test goes here... 
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
* Method: getProductByLikeName(String productname) 
* 
*/ 
@Test
public void testGetProductByLikeName() throws Exception { 
//TODO: Test goes here...
    ProductDAO pd = new ProductDAOImpl();
    List<Product> productList = pd.getProductByLikeName("魅族");
    for (Product p:productList){
        System.out.println(p);
    }
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
