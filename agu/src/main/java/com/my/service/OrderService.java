package com.my.service;

import java.util.List;

import com.my.domain.OrderCancelDTO;
import com.my.domain.OrderDTO;
import com.my.domain.OrderPageItemDTO;

public interface OrderService {

	/* 주문 정보 */
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
	
	/* 주문 */
	public void order(OrderDTO orw);
	
	/* 주문 취소 */
	public void orderCancle(OrderCancelDTO dto);
}
