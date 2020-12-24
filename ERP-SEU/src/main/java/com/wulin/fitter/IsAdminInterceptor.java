package com.wulin.fitter;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IsAdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //如果是登录页面则放行
        if(request.getRequestURI().indexOf("index")>=0){
            return true;
        }
        HttpSession session = request.getSession();
        //如果有管理员权限也放行
        if((boolean)session.getAttribute("isAdmin") == true){
            return true;
        }
        //用户没有管理员权限
        request.getRequestDispatcher("/WEB-INF/pages/not_admin.jsp").forward(request, response);
        return false;
    }
}
