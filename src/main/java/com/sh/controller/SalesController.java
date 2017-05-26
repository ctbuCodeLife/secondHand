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
import java.sql.Timestamp;

/**
 * Created by tao on 2017/5/15 0015.
 */
@RestController
@RequestMapping("/api/sales")
public class SalesController {
    private SalesDAO salesDao;

    public SalesController() {
        salesDao = new SalesDAOImpl();
    }

    @RequestMapping("/add")
    @ResponseBody
    public ModelAndView add(HttpServletRequest request, HttpSession session) {
        ModelAndView view = new ModelAndView();
        Sales sales = new Sales();//订单信息
        String msg = "";//提示信息
        String autoReturn = "";//自动跳转的页面
        //获取用户
        User user = (User) session.getAttribute("user");
        if (user == null || user.getId() == null) {
            //用户未登录,跳转到登录页面
            msg = "您还未登录,请登录后再删除购物车,3秒后自动跳转到登录页面";
            autoReturn = "login.jsp";
            session.setAttribute("msg", msg);
            session.setAttribute("autoReturn", autoReturn);
            view.setViewName("redirect:/info.jsp");
            return view;
        } else {
            //用户已登录
            String cidParam = request.getParameter("cid");
            //获取请求参数
            String pidParam = request.getParameter("pid");
            String countParam = request.getParameter("count").trim();
            String addrParam = request.getParameter("addr");
            String peopleParam = request.getParameter("people");
            String telParam = request.getParameter("tel");
            if (pidParam == null || countParam == null) {
                //没有输入 跳转到info页面提示
                msg = "请求参数错误,3秒后自动跳转到首页.";
                autoReturn = "index.jsp";
                session.setAttribute("msg", msg);
                session.setAttribute("autoReturn", autoReturn);
                view.setViewName("redirect:/info.jsp");
                return view;
            } else {
//                    //获取购物车id
//                    int scid = Integer.parseInt(scidParam);
                //获取商品id
                int pid = Integer.parseInt(pidParam);
                //获取商品数量
                int count = Integer.parseInt(countParam);
                //获取商品
                ProductDAO pd = new ProductDAOImpl();
                Product product = pd.select(pid);
                if (product == null || product.getId() == null) {
                    //获取商品失败
                    msg = "没有该商品信息,3秒后自动跳转到订单列表页.";
                    autoReturn = "order_list.jsp";
                    session.setAttribute("msg", msg);
                    session.setAttribute("autoReturn", autoReturn);
                    view.setViewName("redirect:/info.jsp");
                    return view;
                }
                //要判断库存是否足够
                if(product.getPnum() < count){
                    //库存不足,不能添加购物车
                    msg = "库存不足,不能添加购物车,3秒后自动跳转到商品详情页.";
                    autoReturn = "product_info.jsp?id="+product.getId();
                    session.setAttribute("msg", msg);
                    session.setAttribute("autoReturn", autoReturn);
                    view.setViewName("redirect:/info.jsp");
                    return view;
                }
                //获取收货信息
//                String contactMan = request.getParameter("count");
//                String contactTel = request.getParameter("count");
//                String contactAddr = request.getParameter("count");

                int totalPrice = 0;
                int unitPrice = product.getRealprice();
                totalPrice = unitPrice * count;
                Timestamp orderDate = new Timestamp(System.currentTimeMillis());//下单时间
                String invoiceNO = String.valueOf(System.currentTimeMillis());//订单流水号
                String orderStatus = "已提交";//订单状态

                //设置sales对象
                sales.setUid(user.getId());
                sales.setPid(pid);
                sales.setContactaddr(addrParam);
                sales.setContactman(peopleParam);
                sales.setContacttel(telParam);
                sales.setCount(count);
                sales.setTotalprice(totalPrice);
                sales.setOrderdate(orderDate);
                sales.setInvoiceno(invoiceNO);
                sales.setOrderstatus(orderStatus);

                //插入到sales表
                SalesDAO sd = new SalesDAOImpl();
                int result = sd.insert(sales);
                if (result > 0) {
                    //插入成功,要删除购物车

                    //查找购物车
                    CartDAO scd = new CartDAOImpl();
                    int cid = Integer.parseInt(cidParam);
                    Cart cart = scd.select(cid);
                    scd.delete(cart.getId());

                    msg = "下单成功,3秒后自动跳转到订单页面.";
                    autoReturn = "order_list.jsp";
                    session.setAttribute("msg", msg);
                    session.setAttribute("autoReturn", autoReturn);
                    view.setViewName("redirect:/info.jsp");
                    return view;
                } else {
                    //插入失败
                    msg = "提交失败,3秒后自动跳转到购物车页面.";
                    autoReturn = "order_info.jsp";
                    session.setAttribute("msg", msg);
                    session.setAttribute("autoReturn", autoReturn);
                    view.setViewName("redirect:/info.jsp");
                    return view;
                }
            }

        }
    }

    @RequestMapping("/recieve")
    @ResponseBody
    public ModelAndView recieve(HttpServletRequest request, HttpSession session) {
        ModelAndView view = new ModelAndView();
        Sales sales = new Sales();
        //设置uid
        User user = (User) session.getAttribute("user");
        Integer uid = new Integer(0);
        if (user == null || user.getId() == null) {
            //用户未登录,跳转到登录页面
            session.setAttribute("msg", "您还未登录,请登录后再删除购物车,3秒后自动跳转到登录页面");
            session.setAttribute("autoReturn", "login.jsp");
            view.setViewName("redirect:/info.jsp");
            return view;
        } else {
            //用户已登录,可以收货
            Integer salesId = Integer.parseInt(request.getParameter("id"));

            sales = salesDao.select(salesId);
            sales.setOrderstatus("已收货");
            int result = salesDao.update(sales);
            if (result == 1) {
                session.setAttribute("msg", "收货成功,3秒后自动跳转到订单页面");
                session.setAttribute("autoReturn", "order_list.jsp");
            } else {
                session.setAttribute("msg", "收货失败,3秒后自动跳转到订单页面");
                session.setAttribute("autoReturn", "order_list.jsp");
            }
            view = new ModelAndView();
            view.setViewName("redirect:/info.jsp");
            return view;
        }
    }

    @RequestMapping("/response")
    @ResponseBody
    public ModelAndView response(HttpServletRequest request, HttpSession session) {
        ModelAndView view = new ModelAndView();
        Sales sales = new Sales();
        //设置uid
        User user = (User) session.getAttribute("user");
        Integer uid = new Integer(0);
        if (user == null || user.getId() == null) {
            //用户未登录,跳转到登录页面
            session.setAttribute("msg", "您还未登录,请登录后再发货,3秒后自动跳转到登录页面");
            session.setAttribute("autoReturn", "login.jsp");
            view.setViewName("redirect:/info.jsp");
            return view;
        } else {
            //用户已登录,可以发货
            Integer salesId = Integer.parseInt(request.getParameter("id"));

            sales = salesDao.select(salesId);
            sales.setOrderstatus("已发货");
            int result = salesDao.update(sales);
            if (result == 1) {
                session.setAttribute("msg", "发货成功,3秒后自动跳转到订单请求页面");
                session.setAttribute("autoReturn", "requestOrder.jsp");
            } else {
                session.setAttribute("msg", "发货失败,3秒后自动跳转到订单请求页面");
                session.setAttribute("autoReturn", "requestOrder.jsp");
            }
            view = new ModelAndView();
            view.setViewName("redirect:/info.jsp");
            return view;
        }
    }

    @RequestMapping("/cancel")
    @ResponseBody
    public ModelAndView delete(HttpServletRequest request, HttpSession session) {
        ModelAndView view = new ModelAndView();
        Sales sales = new Sales();
        //设置uid
        User user = (User) session.getAttribute("user");
        Integer uid = user.getId();
        System.out.println(uid);

        if (user == null || user.getId() == null) {
            //用户未登录,跳转到登录页面
            session.setAttribute("msg", "您还未登录,请登录后再取消订单,3秒后自动跳转到登录页面");
            session.setAttribute("autoReturn", "login.jsp");
            view.setViewName("redirect:/info.jsp");
            return view;
        } else {
            //用户已登录,可以取消订单
            Integer salesId = Integer.parseInt(request.getParameter("id"));
            sales = salesDao.select(salesId);
            System.out.println(sales.getUid());
            if(!sales.getUid().equals(uid)){
                //是卖家
                sales.setOrderstatus("卖家已取消");
                boolean result = (1 == salesDao.update(sales));
                if (result == true) {
                    session.setAttribute("msg", "卖家取消成功,3秒后自动跳转到订单请求页面");
                    session.setAttribute("autoReturn", "requestOrder.jsp");
                } else {
                    session.setAttribute("msg", "卖家取消失败,3秒后自动跳转到订单请求页面");
                    session.setAttribute("autoReturn", "requestOrder.jsp");
                }
                view = new ModelAndView();
                view.setViewName("redirect:/info.jsp");
                return view;
            }else{
                sales.setOrderstatus("买家已取消");
                boolean result = (1 == salesDao.update(sales));
                if (result == true) {
                    session.setAttribute("msg", "买家取消成功,3秒后自动跳转到订单页面");
                    session.setAttribute("autoReturn", "order_list.jsp");
                } else {
                    session.setAttribute("msg", "买家取消失败,3秒后自动跳转到订单页面");
                    session.setAttribute("autoReturn", "order_list.jsp");
                }
                view = new ModelAndView();
                view.setViewName("redirect:/info.jsp");
                return view;
            }


        }
    }
}
