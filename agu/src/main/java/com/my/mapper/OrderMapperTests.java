package com.my.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.domain.OrderDTO;
import com.my.domain.OrderItemDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTests {

	@Autowired
	private OrderMapper mapper;


	/* 상품 정보(주문 처리) */
	@Test
	public void getOrderInfoTest() {
		
		 OrderItemDTO orderInfo = mapper.getOrderInfo(61);
		 
		 System.out.println("result : " + orderInfo);
	}
	
	/* buy_order 테이블 등록 */
	@Test
	public void enrollOrderTest() {
		
		OrderDTO ord = new OrderDTO();
		List<OrderItemDTO> orders = new ArrayList();
		
		OrderItemDTO order1 = new OrderItemDTO();
		
		order1.setProductnum(61);
		order1.setProductCount(5);
		order1.setProductprice(70000);
		order1.initSaleTotal();
		
		
		
		ord.setOrders(orders);
		
		ord.setOrderId("2021_test1");
		ord.setAddressee("test");
		ord.setUseremail("admin");
		ord.setPostnum("test");
		ord.setAddr("test");
		ord.setDetailaddress("test");
		ord.setOrderState("배송준비");
		ord.getOrderPriceInfo();
		
		mapper.enrollOrder(ord);		
		
	}
	
	/* buy_orderitem 테이블 등록 */
	@Test
	public void enrollOrderItemTest() {
		
		OrderItemDTO oid = new OrderItemDTO();
		
		oid.setOrderId("2021_test1");
		oid.setProductnum(1);
		oid.setProductCount(2);
		oid.setProductprice(3000);
				
		oid.initSaleTotal();
		
		mapper.enrollOrderItem(oid);
		
	}	
	
}
