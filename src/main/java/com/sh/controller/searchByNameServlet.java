package com.sh.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.sh.dao.ProductDAO;
import com.sh.dao.impl.ProductDAOImpl;
import com.sh.model.Product;
import com.sh.model.User;
import com.sh.service.UserService;
import com.sh.service.impl.UserServiceImpl;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by tao on 2017/5/15 0015.
 */
@WebServlet(name = "searchByNameServlet",urlPatterns = "/searchByName")
public class searchByNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ProductDAO pd = new ProductDAOImpl();
            String paramName = request.getParameter("name");
            Product pt= pd.getProductByName(paramName);
            PrintWriter out = response.getWriter();
            response.setCharacterEncoding("UTF-8");
            //将list的数据转换成JSON返回给前台
            //JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd";
            //SerializerFeature.WriteDateUseDateFormat用来将日期格式化成yyyy-MM-dd的形式
            String json = JSON.toJSONString(pt, SerializerFeature.WriteDateUseDateFormat, SerializerFeature.PrettyFormat, SerializerFeature.DisableCircularReferenceDetect);
            out.println(json);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
