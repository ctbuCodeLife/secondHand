package com.sh.controller;

import com.sh.dao.CartDAO;
import com.sh.dao.ProductDAO;
import com.sh.dao.SalesDAO;
import com.sh.dao.impl.CartDAOImpl;
import com.sh.dao.impl.ProductDAOImpl;
import com.sh.dao.impl.SalesDAOImpl;
import com.sh.model.Cart;
import com.sh.model.Product;
import com.sh.model.Sales;
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
@RequestMapping("/api/sales")
public class SalesController {
    private SalesDAO salesDao;
    public SalesController(){
        salesDao = new SalesDAOImpl();
    }
    @RequestMapping("/recieve")
    @ResponseBody
    public ModelAndView recieve(HttpServletRequest request, HttpSession session){
        ModelAndView view = new ModelAndView();
        Sales sales = new Sales();
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
            //用户已登录,可以收货
            Integer salesId = Integer.parseInt(request.getParameter("id"));

            sales = salesDao.select(salesId);
            sales.setOrderstatus("已收货");
            int result =  salesDao.update(sales);
            if (result == 1) {
                session.setAttribute("msg", "收货成功,3秒后自动跳转到购物车页面");
                session.setAttribute("autoReturn", "order_list.jsp");
            } else {
                session.setAttribute("msg", "收货失败,3秒后自动跳转到购物车页面");
                session.setAttribute("autoReturn", "order_list.jsp");
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
        Sales sales = new Sales();
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
            //用户已登录,可以删除订单
            Integer salesId = Integer.parseInt(request.getParameter("id"));

            boolean result = (1 == salesDao.delete(salesId));

            if (result == true) {
                session.setAttribute("msg", "删除成功,3秒后自动跳转到购物车页面");
                session.setAttribute("autoReturn", "order_list.jsp");
            } else {
                session.setAttribute("msg", "删除失败,3秒后自动跳转到购物车页面");
                session.setAttribute("autoReturn", "order_list.jsp");
            }
            view = new ModelAndView();
            view.setViewName("redirect:/info.jsp");
            return view;
        }
    }
}
