package com.sh.dao.impl; 

import com.sh.dao.ProductDAO;
import com.sh.model.Product;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

import java.util.List;

import static org.junit.Assert.assertEquals;

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
    //测试通过
//    Product product = new Product();
//    product.setUid(10000);
//    product.setPname("发撒旦法");
//    product.setKid(2);
//    product.setPdesc("挥洒都结婚了骄傲受到了房间啊你说的");
//    product.setPnum(1);
//    product.setPimage("img/show/sanxing.jpg");
//    product.setOriginprice(1000);
//    product.setRealprice(999);
//
//    ProductDAO productDao = new ProductDAOImpl();
//    int num = productDao.insert(product);
//    assertEquals(1,num);
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

@Test
public void testListByUid(){
    ProductDAO productDao = new ProductDAOImpl();
    Integer uid = new Integer(10000);
    List<Product> list = productDao.listByUid(uid);
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
    ProductDAO productDao = new ProductDAOImpl();
    Integer id = new Integer(10000);
    Product product = productDao.select(id);
    System.out.println(product);

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
