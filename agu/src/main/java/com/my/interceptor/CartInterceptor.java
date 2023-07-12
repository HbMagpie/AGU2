package com.my.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class CartInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Object loginUserObj = session.getAttribute("loginUserid");
		
		if (loginUserObj == null) {
            response.sendRedirect("/home"); // "/home"으로 리다이렉트
            return false;
		} 
			return true;
		}
}