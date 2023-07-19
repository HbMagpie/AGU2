package com.my.domain;

import java.util.Date;
import java.util.List;

public class OrderDTO {

	/* 주문 번호 */
	private String orderId;
	
	/* 배송 받는이 */
	private String addressee;
	
	/* 주문 회원 아이디 */
	private String useremail;
	
	/* 우편번호 */
	private String postnum;
	
	/* 회원 주소 */
	private String addr;
	
	/* 회원 상세주소 */
	private String detailaddress;
	
	/* 주문 상태 */
	private String orderState;
	
	/* 주문 상품 */
	private List<OrderItemDTO> orders;	
	
	/* 배송비 */
	private int deliveryCost;
	
	/* 주문 날짜 */
	private Date orderDate;
	
	/* DB테이블 존재 하지 않는 데이터 */
	
	/* 판매가(모든 상품 비용) */
	private int orderProductprice;
	
	/* 최종 판매 비용 */
	private int orderFinalSalePrice;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getAddressee() {
		return addressee;
	}

	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public List<OrderItemDTO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderItemDTO> orders) {
		this.orders = orders;
	}

	public int getDeliveryCost() {
		return deliveryCost;
	}

	public void setDeliveryCost(int deliveryCost) {
		this.deliveryCost = deliveryCost;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderProductprice() {
		return orderProductprice;
	}

	public void setOrderProductprice(int orderProductprice) {
		this.orderProductprice = orderProductprice;
	}

	public int getOrderFinalSalePrice() {
		return orderFinalSalePrice;
	}

	public void setOrderFinalSalePrice(int orderFinalSalePrice) {
		this.orderFinalSalePrice = orderFinalSalePrice;
	}

	@Override
	public String toString() {
		return "OrderDTO [orderId=" + orderId + ", addressee=" + addressee + ", useremail=" + useremail + ", postnum="
				+ postnum + ", addr=" + addr + ", detailaddress=" + detailaddress + ", orderState=" + orderState
				+ ", orders=" + orders + ", deliveryCost=" + deliveryCost + ", orderDate=" + orderDate
				+ ", orderProductprice=" + orderProductprice + ", orderFinalSalePrice=" + orderFinalSalePrice + "]";
	}
	
	public void getOrderPriceInfo() {
		/* 상품 비용 & 적립포인트 */
			for(OrderItemDTO order : orders) {
				orderProductprice += order.getTotalPrice();
			}
		/* 배송비용 */
			if(orderProductprice >= 30000) {
				deliveryCost = 0;
			} else {
				deliveryCost = 3000;
			}
		/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
			orderFinalSalePrice = orderProductprice + deliveryCost;
	}
}
