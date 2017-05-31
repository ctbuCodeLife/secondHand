package com.sh.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by tao on 2017/4/9 0009.
 */
@WebFilter(filterName = "AdminLoginFilter",urlPatterns = "/admin/*")
public class AdminLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        //当前地址
        String currentURL = request.getRequestURI();
       // System.out.println("currentURL:"+currentURL);
        //应用地址
        String ctxPath = request.getContextPath();
        //System.out.println("ctxPath:"+ctxPath);
        //当前地址去除掉应用地址
        String targetURL = currentURL.substring(ctxPath.length());
        System.out.println("targetURL:"+targetURL);
        //登录页面
        String loginPage = "/admin/login.jsp";
        //登录的Servlet对应的url
        String loginServlet = "/api/admin/login";
        HttpSession session = request.getSession(false);
        //对静态资源过滤
        if(targetURL.indexOf(".js") != -1){
            chain.doFilter(request, response);
            //表明是静态资源、不过滤
            return;
        }

        if(targetURL.indexOf(".css") != -1){
            chain.doFilter(request, response);
            //表明是静态资源、不过滤
            return;
        }
        if(targetURL.indexOf(".jpg") != -1){
            chain.doFilter(request, response);
            //表明是静态资源、不过滤
            return;
        }
        if(targetURL.indexOf(".png") != -1){
            chain.doFilter(request, response);
            //表明是静态资源、不过滤
            return;
        }
        //对当前页面进行判断，如果当前页面不为登录页面
        if(loginPage.equals(targetURL)){
            //这里表示如果当前页面是登陆页面，跳转到登陆页面
            chain.doFilter(request, response);
            return;
        }else{

            if(loginServlet.equals(targetURL)){
                //Servlet验证
                chain.doFilter(request, response);
                return;
            }else{
                //在不为登陆页面时，再进行判断，如果不是登陆页面也没有session则跳转到登录页面，
                if(session == null || session.getAttribute("admin") == null || session.getAttribute("saleser") == null){
                    response.sendRedirect(ctxPath+loginPage);
                   // System.out.println("redirect:"+ctxPath+loginPage);
                    return;
                }else{
                    //这里表示正确，会去寻找下一个链，如果不存在，则进行正常的页面跳转
                    chain.doFilter(request, response);
                    return;
                }
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
