package com.my.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.domain.CartDTO;
import com.my.domain.UserDTO;
import com.my.service.CartService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
    private CartService cservice;
	
	/* @Setter(onMethod_ = @Autowired)
	privateCartService cservice; */
    
	@PostMapping("/add")
	@ResponseBody
	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		UserDTO udto = (UserDTO)session.getAttribute("user");
		if(udto == null) {
			return "5";
		}
		
		// 카트 등록
		
		int result = cservice.addCart(cart);
		
		return result + "";
	}
	
	// 장바구니 데이터 전송
	@GetMapping("/{useremail}")
	public String cartPageGET(@PathVariable("useremail") String useremail, Model model) {
		
		model.addAttribute("cartInfo", cservice.getCartList(useremail));
		
		return "redirect:/cart";
	}
	
}



