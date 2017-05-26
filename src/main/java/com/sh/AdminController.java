package com.sh;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by tao on 2017/5/26 0026.
 */
@RestController
@RequestMapping("/admin")
public class AdminController {
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView("indes.jsp");
        return  modelAndView;
    }
}
