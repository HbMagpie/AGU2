package com.my.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.my.domain.CartDTO;
import com.my.domain.Files;
import com.my.domain.OrderCancelDTO;
import com.my.domain.OrderDTO;
import com.my.domain.OrderItemDTO;
import com.my.domain.OrderPageItemDTO;
import com.my.domain.UserDTO;
import com.my.mapper.CartMapper;
import com.my.mapper.OrderMapper;
import com.my.mapper.ProductMapper;
import com.my.mapper.UserMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	
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
	
	@Override
	@Transactional
	public void order(OrderDTO ord) {
		/* 사용할 데이터가져오기 */
		/* 회원 정보 */
		UserDTO userDTO = userMapper.getUserInfo(ord.getUseremail());
		
		/* 주문 정보 */
		List<OrderItemDTO> ords = new ArrayList<>();
		for(OrderItemDTO oit : ord.getOrders()) {
			OrderItemDTO orderItem = orderMapper.getOrderInfo(oit.getProductnum());
			// 수량 셋팅
			orderItem.setProductCount(oit.getProductCount());
			// 기본정보 셋팅
			orderItem.initSaleTotal();
			//List객체 추가
			ords.add(orderItem);
		}
		/* OrderDTO 셋팅 */
		ord.setOrders(ords);
		ord.getOrderPriceInfo();
		
	
	/*DB 주문,주문상품(,배송정보) 넣기*/
	
		/* orderId만들기 및 OrderDTO객체 orderId에 저장 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = ord.getUseremail() + format.format(date);
		ord.setOrderId(orderId);
		
		/* db넣기 */
		orderMapper.enrollOrder(ord);		//buy_order 등록
		for(OrderItemDTO oit : ord.getOrders()) {		//buy_orderItem 등록
			oit.setOrderId(orderId);
			orderMapper.enrollOrderItem(oit);			
			}
	
	/* 장바구니 제거 */
	for(OrderItemDTO oit : ord.getOrders()) {
		CartDTO dto = new CartDTO();
		dto.setUseremail(ord.getUseremail());
		dto.setProductnum(oit.getProductnum());
		
		cartMapper.deleteOrderCart(dto);
		}
	
	}
	/* 주문취소 */
	@Override
	@Transactional
	public void orderCancle(OrderCancelDTO dto) {
		
	/* 주문, 주문상품 객체 */
		/*회원*/
			UserDTO userDTO = userMapper.getUserInfo(dto.getUseremail());
		/*주문상품*/
			List<OrderItemDTO> ords = orderMapper.getOrderItemInfo(dto.getOrderId());
			for(OrderItemDTO ord : ords) {
				ord.initSaleTotal();
			}
		/* 주문 */
			OrderDTO orw = orderMapper.getOrder(dto.getOrderId());
			orw.setOrders(ords);
			
			orw.getOrderPriceInfo();
			
	/* 주문상품 취소 DB */
			orderMapper.orderCancle(dto.getOrderId());
			
	}
}
