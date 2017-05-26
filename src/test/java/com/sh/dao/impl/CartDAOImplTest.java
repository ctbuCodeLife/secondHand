package com.sh.dao.impl; 

import com.sh.dao.CartDAO;
import com.sh.model.Cart;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

import java.util.List;

import static junit.framework.TestCase.assertEquals;

/** 
* CartDAOImpl Tester. 
* 
* @author <Authors name> 
* @since <pre>���� 15, 2017</pre> 
* @version 1.0 
*/ 
public class CartDAOImplTest { 

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: insert(Cart record) 
* 
*/ 
@Test
public void testInsert() throws Exception { 
//TODO: Test goes here...
    Cart cart = new Cart();
    cart.setUid(10001);
    cart.setCount(1);
    cart.setIsbuy("否");
    cart.setPid(10001);
    cart.setTotalprice(999);
    CartDAO cartDao = new CartDAOImpl();
    int num = cartDao.insert(cart);
    assertEquals(1,num);
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
* Method: update(Cart record) 
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
    CartDAO cartDao = new CartDAOImpl();
    List<Cart> list = cartDao.findAll();
    for(Cart cart :list){
        System.out.println(cart);
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
@Test
public void testSelectByUidAndPid(){
    CartDAO cartDAO = new CartDAOImpl();
    Integer uid = new Integer(10008);
    Integer pid = new Integer(10000);
    Cart cart = cartDAO.selectByUidAndPid(10008,10000);
    System.out.println(cart);
}

} 
