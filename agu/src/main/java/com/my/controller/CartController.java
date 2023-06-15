package com.my.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.domain.CartDTO;
import com.my.service.CartService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@PostMapping("/cart/add")
	@ResponseBody
	public String insert(@ModelAttribute CartDTO cart, int productnum, 
            HttpSession session) {
		// 로그인 체크
				String useremail = (String)session.getAttribute("loginUserid");
				if(useremail == null) {
					return "5";
	}
				// 카트 등록
				cart.setUserEmail(useremail);
				cart.setProductNum(productnum);
				int result = cartService.addCart(cart);
				return result + "" ;
	}
	@GetMapping("/cart/{useremail}")
	public String cartPageGET(@PathVariable("useremail") String useremail, Model model) {
		
		model.addAttribute("cartInfo", cartService.getCartList(useremail));
		
		return "product/cart";
	}
}
