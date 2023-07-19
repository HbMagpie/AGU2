package com.my.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.domain.CartDTO;
import com.my.domain.Files;
import com.my.domain.OrderPageItemDTO;
import com.my.mapper.OrderMapper;
import com.my.mapper.ProductMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	
	@Override
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders) {
		
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();		
		
		for(OrderPageItemDTO ord : orders) {
			
			OrderPageItemDTO goodsInfo = orderMapper.getGoodsInfo(ord.getProductnum());			

			goodsInfo.setProductCount (ord.getProductCount());	
			
			goodsInfo.initSaleTotal();
			
			// 제품에 대한 이미지 정보 가져오기
			
			List<Files> fileList = productMapper.getFile();
			goodsInfo.setFileList(fileList);
			
			result.add(goodsInfo);	
		}		
		
		return result;
	}

}
