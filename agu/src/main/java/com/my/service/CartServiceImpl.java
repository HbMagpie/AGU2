package com.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.domain.CartDTO;
import com.my.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartServiceImpl implements CartService{
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	/* 장바구니 추가 */
	@Override
	public int addCart(CartDTO cart) {
		
		// 장바구니 데이터 체크
			CartDTO checkCart = mapper.checkCart(cart);
				
			if(checkCart != null) {
				return 2;
			}
				
		// 장바구니 등록 & 에러 시 0반환
			try {
				return mapper.addCart(cart);
			} catch (Exception e) {
				return 0;
			}

	}
	
	/* 장바구니 정보 리스트 */
	@Override
	public List<CartDTO> getCartList(String useremail) {
		
		List<CartDTO> cart = mapper.getCart(useremail);

		return cart;
	}
	
}








