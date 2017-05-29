package com.sh.controller;

import com.sh.model.Admin;
import com.sh.model.Product;

import com.sh.model.User;
import com.sh.service.ProductService;
import com.sh.service.impl.ProductServiceImpl;
import com.sh.util.Message;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by tao on 2017/5/15 0015.
 */
@RestController
@RequestMapping("/api/product")
public class ProductController {
    private ProductService service;

    public ProductController() {
        service = new ProductServiceImpl();
    }

    @RequestMapping(value = "/add", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String add(HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
        Message msg = new Message();
        List<Object> data = new ArrayList<Object>();
        Product product = new Product();
        //设置uid
        User user = (User) session.getAttribute("user");
        Integer uid = new Integer(0);
        if (user == null || user.getId() == null) {
            //用户未登录,跳转到登录页面
            msg.setStatus(3);//用户未登录
            data.add("您还未登录,请登录后再发布商品,3秒后自动跳转到登录页面");
            msg.setData(data);
            msg.setAutoReturn("login.jsp");
        } else {
            //用户已登录,可以发布商品
            uid = user.getId();
            String pName = request.getParameter("pName");
            Integer kId = Integer.parseInt(request.getParameter("kindId"));
            String pDesc = request.getParameter("pDesc");
            Integer pNum = Integer.parseInt(request.getParameter("pNum"));
            String pImage = "img/show/sanxing.jpg";
            Integer originPrice = Integer.parseInt(request.getParameter("originPrice"));
            Integer realPrice = Integer.parseInt(request.getParameter("realPrice"));

            product.setUid(uid);
            product.setPname(pName);
            product.setKid(kId);
            product.setPdesc(pDesc);
            product.setPimage(pImage);
            product.setPnum(pNum);

            product.setOriginprice(originPrice);
            product.setRealprice(realPrice);

            boolean result = service.add(product);

            if (result == true) {
                msg.setStatus(1);
                data.add("发布成功,3秒后自动跳转到发布商品页面");
                msg.setData(data);
                msg.setAutoReturn("user_product.jsp");
            } else {
                msg.setStatus(1);
                data.add("发布失败,3秒后自动跳转到发布商品页面");
                msg.setData(data);
                msg.setAutoReturn("user_product.jsp");
            }
        }
        return msg.toString();
    }

    @RequestMapping(value = "/delete", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String delete(HttpServletRequest request, HttpSession session) {
        Message msg = new Message();
        List<Object> data = new ArrayList<Object>();
        Integer productId = Integer.parseInt(request.getParameter("id"));
        boolean result = service.delete(productId);

        if (result == true) {
            msg.setStatus(1);
            data.add("删除商品成功,3秒后自动跳转到发布商品页面");
            msg.setData(data);
            msg.setAutoReturn("listProduct.jsp");
        } else {
            msg.setStatus(0);
            data.add("删除商品失败,3秒后自动跳转到发布商品页面");
            msg.setData(data);
            msg.setAutoReturn("listProduct.jsp");
        }
        return msg.toString();
    }

    @RequestMapping(value = "/update", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String update(HttpServletRequest request) {
        return "";
    }

    @RequestMapping(value = "/findByName", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findByName(HttpServletRequest request) {
        Message msg = new Message();

        String productName = request.getParameter("name");
        List<Product> list = service.findByName(productName);
        //此处定义data是为了返回前台统一使用msg
        List<Object> data = new ArrayList<Object>();
        for (int i = 0; i < list.size(); i++) {
            data.add(list.get(i));
        }
        int status = 0;
        if (list != null && list.size() > 0) {
            status = 1;
        } else {
            status = 0;
        }

        msg.setStatus(status);
        msg.setData(data);
        return msg.toString();
    }

    @RequestMapping(value = "/listAll", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findAll() {
        List<Product> list = new ArrayList<Product>();
        list = service.findAll();

        //此处定义data是为了返回前台统一使用msg
        List<Object> data = new ArrayList<Object>();
        for (int i = 0; i < list.size(); i++) {
            data.add(list.get(i));
        }

        int status = 0;
        if (list != null) {
            status = 1;
        } else {
            status = 0;
        }

        Message msg = new Message();
        msg.setStatus(status);
        msg.setData(data);
        return msg.toString();
    }

    @RequestMapping(value = "listUnaudit", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findAllUnaudit(){

    }
    @RequestMapping(value = "listUnaudit", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findAllUp(){

    }
}
