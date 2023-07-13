package com.my.controller;


import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String addCartPOST(CartDTO cart, Integer productnum,
			HttpServletRequest request) {
		
		// 로그인 체크
				HttpSession session = request.getSession();
				String useremail = (String)session.getAttribute("loginUserid");
				if(useremail == null) {
					return "5";
				
	}
				
				// 카트 등록
				cart.setUseremail(useremail);
				cart.setProductnum(productnum);
				int result = cartService.addCart(cart);
				return result + "" ;
				
	}
	

	@GetMapping("/cart/{useremail:.+}")
	public String cartPageGET(@PathVariable("useremail") String encodedUseremail, Model model) {
	    String useremail = URLDecoder.decode(encodedUseremail, StandardCharsets.UTF_8);
	    
		List<CartDTO> cartList = cartService.getCartList(useremail);
		model.addAttribute("cartInfo", cartList);
		
		
		return "product/cart";
	}
	
	/* 장바구니 수량 수정 */
	@PostMapping("/cart/update")
	public String updateCartPOST(CartDTO cart) {
		
		cartService.modifyCount(cart);
		
		return "redirect:/cart/" + cart.getUseremail();

	}
	
	/* 장바구니 삭제 */
	@PostMapping("/cart/delete")
	public String deleteCartPOST(CartDTO cart) {
		
		cartService.deleteCart(cart.getCartId());
		
		return "redirect:/cart/" + cart.getUseremail();
		
	}
}

