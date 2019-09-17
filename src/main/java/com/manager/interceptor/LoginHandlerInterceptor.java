package com.manager.interceptor;

import com.manager.pojo.SystemUser;
import com.manager.sign.UrlConst;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginHandlerInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("user");
        if (user instanceof SystemUser) {
            SystemUser u = (SystemUser) user;
            u.setPassword(null);
            request.getSession().setAttribute("user",user);
            return true;
        }

        response.sendRedirect(request.getContextPath()+UrlConst.LOGIN);
        return false;
    }
}
