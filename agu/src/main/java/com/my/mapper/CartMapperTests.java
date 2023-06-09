package com.my.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.domain.CartDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTests {

	@Autowired
	private CartMapper mapper;
	
	/* 카트 등록 
	
	@Test
	public void addCart() {
		String useremail = "test1234@naver.com";
		int productnum = 2;
		int count = 2;
		
		CartDTO cart = new CartDTO();
		cart.setUseremail(useremail);
		cart.setProductnum(productnum);
		cart.setProductCount(count);
		
		int result = 0;
		try {
			result = mapper.addCart(cart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("결과 : " + result);
		
	}  */

	
	/* 카트 삭제  

	@Test
	public void deleteCartTest() {
		int cartId = 1;
		
		mapper.deleteCart(cartId);
	} */
	
	/* 카트 수량 수정 

	@Test
	public void modifyCartTest() {
		int cartId = 1;
		int count = 5;
		
		CartDTO cart = new CartDTO();
		cart.setCartId(cartId);
		cart.setProductCount(count);
		
		mapper.modifyCount(cart);
		
	}  */

	
	/* 카트 목록  

	@Test
	public void getCartTest() {
		String useremail = "test1234@naver.com";

		List<CartDTO> list = mapper.getCart(useremail);
		
		for(CartDTO cart : list) {
			System.out.println(cart);
			System.out.println("init cart : " + cart);
		} 
	}   */
		
	/* 카트 확인 */ 

	@Test
	public void checkCartTest() {
		
		String useremail = "test1234@naver.com";
		int productnum = 1;
		
		CartDTO cart = new CartDTO();
		cart.setUseremail(useremail);
		cart.setProductnum(productnum);
		
		CartDTO resutlCart = mapper.checkCart(cart);
		System.out.println("결과 : " + resutlCart);
		
	}  
	
}
