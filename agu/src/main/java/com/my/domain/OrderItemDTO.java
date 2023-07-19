package com.my.domain;

public class OrderItemDTO {

	/* 주문 번호 */
	private String orderId;
	
	/* 상품 번호 */
    private int productnum;
    
	/* 주문 수량 */
    private int productCount;
    
	/* vam_orderItem 기본키 */
    private int orderItemId;
    
	/* 상품 한 개 가격 */
    private int productprice;
    
    
	/* DB테이블 존재 하지 않는 데이터 */
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;


	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public int getProductnum() {
		return productnum;
	}


	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}


	public int getProductCount() {
		return productCount;
	}


	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}


	public int getOrderItemId() {
		return orderItemId;
	}


	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}


	public int getProductprice() {
		return productprice;
	}


	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	@Override
	public String toString() {
		return "OrderItemDTO [orderId=" + orderId + ", productnum=" + productnum + ", productCount=" + productCount
				+ ", orderItemId=" + orderItemId + ", productprice=" + productprice + ", totalPrice=" + totalPrice
				+ "]";
	}
    
	public void initSaleTotal() {
		this.totalPrice = this.productprice*this.productCount;
	}
   
}
