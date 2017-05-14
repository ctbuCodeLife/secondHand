package com.sh.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

/**
 * Created by tao on 2017/5/15 0015.
 */
@WebServlet(name = "AddSalesServlet",urlPatterns = "/AddSales")
public class AddSalesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            //提示信息的页面
            String redirectPage = "info.jsp";
            //自动跳转目录
            String autoReturnPage = "order_list.jsp";//重定向页面自动跳转的页面,默认为首页
            String msg = ""; //返回的提示信息
            //获取session
            HttpSession session = request.getSession();
            //获取用户
            User user = (User) session.getAttribute("user");
            if (user == null) {
                //未登录;
                msg = "您还没有登录沃,请登录后再添加购物车吧.3秒后自动跳转到主页.";
                autoReturnPage = "login.jsp";
            } else {
                //用户已登录
                String cidParam =  request.getParameter("cid");
                //获取请求参数
                String pidParam = request.getParameter("pid");
                System.out.println(pidParam);
                String countParam = request.getParameter("count").trim();
                System.out.println(countParam);
                String addrParam = request.getParameter("addr");
                String peopleParam = request.getParameter("people");
                String telParam = request.getParameter("tel");
                if(pidParam == null ||countParam == null ){
                    //没有输入 跳转到info页面提示
                    msg = "请求参数错误,3秒后自动跳转到首页.";
                    autoReturnPage = "index.jsp";
                }else{
//                    //获取购物车id
//                    int scid = Integer.parseInt(scidParam);
                    //获取商品id
                    int pid = Integer.parseInt(pidParam);
                    //获取商品数量
                    int count = Integer.parseInt(countParam);
                    //获取商品
                    ProductDAO pd = new ProductDAOImpl();
                    Product product = pd.select(pid);
                    if(product == null){
                        //获取商品失败
                        msg = "没有该商品信息,3秒后自动跳转到首页.";
                        autoReturnPage = "order_list.jsp";
                    }
                    //获取收货信息
                    String contactMan = request.getParameter("count");
                    String contactTel = request.getParameter("count");
                    String contactAddr = request.getParameter("count");

                    int totalPrice = 0;
                    int unitPrice = product.getRealprice();
                    totalPrice = unitPrice * count;
                    Timestamp orderDate = new Timestamp(System.currentTimeMillis());//下单时间
                    String invoiceNO = String.valueOf(System.currentTimeMillis());//订单流水号
                    String orderStatus = "已提交";//订单状态


                    //设置sales对象
                    Sales sales = new Sales();
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
                    if(result > 0){
                        //插入成功,要删除购物车
                        msg = "下单成功,3秒后自动跳转到订单页面.";
                        autoReturnPage = "order_list.jsp";
                        //查找购物车
                        CartDAO scd = new CartDAOImpl();
                        int cid = Integer.parseInt(cidParam);
                        Cart cart = scd.select(cid);
                        scd.delete(cart.getId());
                    }else {
                        //插入失败
                        msg = "提交失败,3秒后自动跳转到购物车页面.";
                        autoReturnPage = "order_info.jsp";
                    }

                }
                session.setAttribute("msg",msg);
                session.setAttribute("autoReturn",autoReturnPage);
                response.sendRedirect(redirectPage);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}