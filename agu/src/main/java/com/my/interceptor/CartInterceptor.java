package com.my.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.my.domain.UserDTO;

public class CartInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		UserDTO dto = (UserDTO)session.getAttribute("loginUserid");
		
		if(dto == null) {
			response.sendRedirect("/home");
			return false;
		} else {
			return true;
		}
	}

}