package com.my.mapper;

import java.util.List;

import com.my.domain.OrderDTO;
import com.my.domain.OrderItemDTO;
import com.my.domain.OrderPageItemDTO;

public interface OrderMapper {

	/* 주문 상품 정보 */	
	public OrderPageItemDTO getGoodsInfo(int productnum);
	
	/* 주문 상품 정보(주문 처리) */
	public OrderItemDTO getOrderInfo(int productnum);
	
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderDTO ord);
	
	/*주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDTO orid);
	
	/* 주문 취소 */
	public int orderCancle(String orderId);
	
	/* 주문 상품 정보(주문취소) */
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	/* 주문 정보(주문취소) */
	public OrderDTO getOrder(String orderId);
}
