package com.my.controller;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.my.domain.OrderDTO;
import com.my.domain.OrderPageDTO;
import com.my.service.OrderService;
import com.my.service.UserService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/order/{useremail:.+}")
	public String orderPgaeGET(@PathVariable("useremail") String encodedUseremail, OrderPageDTO opd, Model model) {
		String useremail = URLDecoder.decode(encodedUseremail, StandardCharsets.UTF_8);
		
		model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));
		model.addAttribute("UserInfo", userService.getUserInfo(useremail));
		
		return "product/order";
}
	@PostMapping("/order")
	public String orderPagePost(OrderDTO od, HttpServletRequest request) {
		
		System.out.println(od);
		
		return "redirect:/";
	}
}
