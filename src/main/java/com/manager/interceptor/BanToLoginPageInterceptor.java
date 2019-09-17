package com.manager.interceptor;

import com.manager.pojo.SystemUser;
import com.manager.sign.UrlConst;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BanToLoginPageInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("到了！");
        Object user = request.getSession().getAttribute("user");
        if (user instanceof SystemUser) {
            response.sendRedirect(request.getContextPath()+ UrlConst.MAIN);
            return false;
        }
        return true;
    }
}
