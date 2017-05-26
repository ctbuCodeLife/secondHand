package com.sh.controller;

import com.sh.dao.CartDAO;
import com.sh.dao.ProductDAO;
import com.sh.dao.impl.CartDAOImpl;
import com.sh.dao.impl.ProductDAOImpl;
import com.sh.model.Cart;
import com.sh.model.Product;
import com.sh.model.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by tao on 2017/5/15 0015.
 */
@RestController
@RequestMapping("/api/cart")
public class CartController {
    private CartDAO cartDao;
    public CartController(){
        cartDao = new CartDAOImpl();
    }
    @RequestMapping("/add")
    @ResponseBody
    public ModelAndView add(HttpServletRequest request, HttpSession session){
        ModelAndView view = new ModelAndView();
        Cart cart = new Cart();
        CartDAO cartDao = new CartDAOImpl();
        //设置uid
        User user = (User)session.getAttribute("user");
        Integer uid = new Integer(0);
        if(user == null || user.getId() == null){
            //用户未登录,跳转到登录页面
            session.setAttribute("msg", "您还未登录,请登录后再加入购物车,3秒后自动跳转到登录页面");
            session.setAttribute("autoReturn", "login.jsp");
            view.setViewName("redirect:/info.jsp");
            return view;
        }else {
            //用户已登录,可以加入购物车
            uid = user.getId();
            Integer pid = Integer.parseInt(request.getParameter("pId"));
            Integer count = Integer.parseInt(request.getParameter("count"));

            //cart = cartDao.selectByUidAndPid(uid,pid);
//            if(cart != null || cart.getId() != null){
//                //购物车记录已存在
//                //将数量加入到已存在的记录中
//                cart.setCount(cart.getCount()+count);
//            }else{
//                cart.setCount(count);
//            }
            cart.setCount(count);
            cart.setUid(uid);
            cart.setPid(pid);
            cart.setIsbuy("否");
            //设置totalPrice
            ProductDAO productDao = new ProductDAOImpl();
            Product product = productDao.select(cart.getPid());
            Integer totalPrice = product.getRealprice() * cart.getCount();
            cart.setTotalprice(totalPrice);

            boolean result = (1 == cartDao.insert(cart));

            if (result == true) {
                session.setAttribute("msg", "添加成功,3秒后自动跳转到商品页面");
                session.setAttribute("autoReturn", "product_info.jsp?id="+product.getId());
            } else {
                session.setAttribute("msg", "您已经添加过购物车了,请删除后再次添加,3秒后自动跳转到商品页面");
                session.setAttribute("autoReturn", "product_info.jsp?id="+product.getId());
            }
            view = new ModelAndView();
            view.setViewName("redirect:/info.jsp");
            return view;
        }
    }
    @RequestMapping("/delete")
    @ResponseBody
    public ModelAndView delete(HttpServletRequest request, HttpSession session){
        ModelAndView view = new ModelAndView();
        Cart cart = new Cart();
        //设置uid
        User user = (User)session.getAttribute("user");
        Integer uid = new Integer(0);
        if(user == null || user.getId() == null){
            //用户未登录,跳转到登录页面
            session.setAttribute("msg", "您还未登录,请登录后再删除购物车,3秒后自动跳转到登录页面");
            session.setAttribute("autoReturn", "login.jsp");
            view.setViewName("redirect:/info.jsp");
            return view;
        }else {
            //用户已登录,可以删除购物车
           Integer cartId = Integer.parseInt(request.getParameter("id"));

            boolean result = (1 == cartDao.delete(cartId));

            if (result == true) {
                session.setAttribute("msg", "删除成功,3秒后自动跳转到购物车页面");
                session.setAttribute("autoReturn", "cart.jsp");
            } else {
                session.setAttribute("msg", "删除失败,3秒后自动跳转到购物车页面");
                session.setAttribute("autoReturn", "cart.jsp");
            }
            view = new ModelAndView();
            view.setViewName("redirect:/info.jsp");
            return view;
        }
    }
}
