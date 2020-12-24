package com.wulin.controller;

import com.wulin.bean.SystemUser;
import com.wulin.service.SystemUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class UserController {

    @Autowired
    SystemUserService systemUserService;

    @RequestMapping(value = {"/userLogin"}, method = RequestMethod.POST)
    public String userLogin(HttpSession session, SystemUser systemUser){
        if (systemUserService.isSystemUser(systemUser)){
            session.setAttribute("isAdmin",systemUserService.isAdminUser(systemUser));
            return "system_management";
        }else {
            return "fail";
        }
    }

    @RequestMapping("/logout")
    public void userLogout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        session.invalidate();
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @RequestMapping("/welcome")
    public String welcome(){
        return "welcome";
    }
}
