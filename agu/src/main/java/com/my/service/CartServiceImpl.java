package com.my.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.domain.CartDTO;
import com.my.domain.Files;
import com.my.mapper.CartMapper;
import com.my.mapper.ProductMapper;

@Service
public class CartServiceImpl implements CartService {


	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public int addCart(CartDTO cart) {
		
		//장바구니 데이터 체크
		CartDTO checkCart = cartMapper.checkCart(cart);
		
		if(checkCart != null) {
			return 2;
		}
		
		//장바구니 등록 & 에러 시 0 반환
		try {
			return cartMapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}
	public List<CartDTO> getCartList(String useremail) {
	    List<CartDTO> cart = cartMapper.getCart(useremail);
	    List<Files> fileList = new ArrayList<>();

	    for (CartDTO dto : cart) {
	        dto.initSaleTotal();
	        // 이미지 정보 얻기
	        List<Files> files = productMapper.getFile(); // 파일 정보를 가져오는 메서드 호출
	        fileList.addAll(files);
	    }
		
		return cart;
	}
	
	@Override
	public int modifyCount(CartDTO cart) {
		
		return cartMapper.modifyCount(cart);
	}
	
	@Override
	public int deleteCart(int cartId) {

		return cartMapper.deleteCart(cartId);
	}
	
	
}
