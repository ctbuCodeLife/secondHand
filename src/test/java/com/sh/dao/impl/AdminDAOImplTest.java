package com.sh.dao.impl;

import com.sh.dao.AdminDAO;
import com.sh.model.Admin;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

/**
 * AdminDAOImpl Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>���� 15, 2017</pre>
 */
public class AdminDAOImplTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: insert(Admin record)
     */
    @Test
    public void testInsert() throws Exception {
//TODO: Test goes here... 
        //测试通过
        Admin admin = new Admin();
        admin.setUsername("testAdd");
        admin.setPassword("123456");
        admin.setEmail("test@test.com");
        admin.setLevel(1);

        AdminDAO adminDao = new AdminDAOImpl();
        int num = adminDao.insert(admin);
        assertEquals(1, num);
    }

    /**
     * Method: delete(Integer id)
     */
    @Test
    public void testDelete() throws Exception {
//TODO: Test goes here...
        //测试通过
        AdminDAO adminDao = new AdminDAOImpl();
        Integer id = new Integer(4);
        int num = adminDao.delete(id);
        assertEquals(1, num);
    }

    /**
     * Method: update(Admin record)
     */
    @Test
    public void testUpdate() throws Exception {
//TODO: Test goes here...
        //测试通过
        AdminDAO adminDao = new AdminDAOImpl();
        Integer id = new Integer(2);
        Admin admin = adminDao.select(id);
        admin.setEmail("hhh@test.com");
        int num = adminDao.update(admin);
        assertEquals(1, num);
    }

    /**
     * Method: findAll()
     */
    @Test
    public void testFindAll() throws Exception {
//TODO: Test goes here...
        //测试通过
        AdminDAO adminDao = new AdminDAOImpl();
        List<Admin> list = adminDao.findAll();
        for (Admin u : list) {
            System.out.println(u);
        }
        assertNotNull(list);
    }

    /**
     * Method: select(Integer id)
     */
    @Test
    public void testSelect() throws Exception {
//TODO: Test goes here...
        //测试通过
        AdminDAO adminDao = new AdminDAOImpl();
        Integer id = new Integer(1);
        Admin admin = adminDao.select(id);
        System.out.println(admin);
        assertNotNull(admin);
    }

    /**
     * Method: getPasswordByName()
     */
    @Test
    public void testGetAdminByName() {
        //测试通过
        AdminDAO adminDao = new AdminDAOImpl();
        String name = "root";
        Admin admin =adminDao.getAdminByName(name);
        assertNotNull(admin);
    }

    /**
     * Method: count()
     */
    @Test
    public void testCount() throws Exception {
//TODO: Test goes here...
        //测试通过
        AdminDAO adminDao = new AdminDAOImpl();
        int count = adminDao.count();
        System.out.println(count);
        assertNotEquals(0, count);
    }


}
