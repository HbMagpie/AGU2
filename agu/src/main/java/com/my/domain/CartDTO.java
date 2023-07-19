package com.my.domain;

import java.util.List;

public class CartDTO {

	private int cartId;
	private String useremail;
	private int productnum;
	private int productCount;
	
	//상품
	private String productname;
	private int productprice;
	
	private int totalPrice;
	
	//상품 이미지
	private List<Files> filelist;
	
	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
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
	
	public List<Files> getFileList() {
		return filelist;
	}

	public void setFileList(List<Files> filelist) {
		this.filelist = filelist;
	}

	public void initSaleTotal() {
		this.totalPrice = this.productprice*this.productCount;
	}
	
	
	
	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", useremail=" + useremail + ", productnum=" + productnum + ", productCount="
				+ productCount + ", productname=" + productname + ", productprice=" + productprice + ", totalPrice=" + totalPrice + ", filelist=" + filelist + "]";
	}
}
