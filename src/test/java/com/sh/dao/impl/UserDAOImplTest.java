package com.sh.dao.impl; 

import com.sh.dao.UserDAO;
import com.sh.model.User;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

/** 
* UserDAOImpl Tester. 
* 
* @author <Authors name> 
* @since <pre>���� 15, 2017</pre> 
* @version 1.0 
*/ 
public class UserDAOImplTest { 

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: insert(User record) 
* 
*/ 
@Test
public void testInsert() throws Exception { 
//TODO: Test goes here...
    //测试通过
    User user = new User();
    user.setUsername("testAdd");
    user.setPassword("123456");
    user.setEmail("test@test.com");
    user.setLevel(1);
    user.setScore(0);
    user.setSex("男");
    user.setTel("1943843248234");

    UserDAO userDao = new UserDAOImpl();
    int num = userDao.insert(user);
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
    //测试通过
    UserDAO userDao = new UserDAOImpl();
    Integer id = new Integer(10006);
    int num = userDao.delete(id);
    assertEquals(1,num);
} 

/** 
* 
* Method: update(User record) 
* 
*/ 
@Test
public void testUpdate() throws Exception { 
//TODO: Test goes here...
    //测试通过
    UserDAO userDao = new UserDAOImpl();
    Integer id = new Integer(10002);
    User user = userDao.select(id);
    user.setTel("111111111");
    int num = userDao.update(user);
    assertEquals(1,num);
} 

/** 
* 
* Method: findAll() 
* 
*/ 
@Test
public void testFindAll() throws Exception { 
//TODO: Test goes here...
    //测试通过
    UserDAO userDao = new UserDAOImpl();
    List<User> list = userDao.findAll();
    for(User u :list){
        System.out.println(u);
    }
    assertNotNull(list);
} 

/** 
* 
* Method: select(Integer id) 
* 
*/ 
@Test
public void testSelect() throws Exception { 
//TODO: Test goes here...
    //测试通过
    UserDAO userDao = new UserDAOImpl();
    Integer id = new Integer(10000);
    User user = userDao.select(id);
    System.out.println(user);
    assertNotNull(user);
}

/**
 * Method: getPasswordByName()
 *
 */
@Test
public void testGetUserByName(){
    //测试通过
    UserDAO userDao = new UserDAOImpl();
    String name = "litao";
    User user = userDao.getUserByName(name);
    assertNotNull(user);
}

    /**
* 
* Method: count() 
* 
*/ 
@Test
public void testCount() throws Exception { 
//TODO: Test goes here...
    //测试通过
    UserDAO userDao = new UserDAOImpl();
    int count = userDao.count();
    System.out.println(count);
    assertNotEquals(0,count);
} 


} 
