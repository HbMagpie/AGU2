package com.my.mapper;

import com.my.domain.OrderPageItemDTO;

public interface OrderMapper {

	/* 주문 상품 정보 */	
	public OrderPageItemDTO getGoodsInfo(int productnum);
}
