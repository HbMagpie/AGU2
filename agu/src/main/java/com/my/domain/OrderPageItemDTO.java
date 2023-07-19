package com.my.domain;

import java.util.List;

public class OrderPageItemDTO {

	/* 뷰로부터 전달받을 값 */
    private int productnum;
    
    private int productCount;
    
	/* DB로부터 꺼내올 값 */
    private String productname;
    
    private int productprice;
    
	/* 만들어 낼 값 */
    
    private int totalPrice;
    
    //상품 이미지
    private List<Files> filelist;

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

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
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
	
	public void initSaleTotal() {
		this.totalPrice = this.productprice*this.productCount;
	}
	
	public List<Files> getFileList() {
		return filelist;
	}

	public void setFileList(List<Files> filelist) {
		this.filelist = filelist;
	}

	@Override
	public String toString() {
		return "OrderDTO [productnum=" + productnum + ", productCount=" + productCount + ", productname=" + productname
				+ ", productprice=" + productprice + ", totalPrice=" + totalPrice + "]";
	}
    
}
