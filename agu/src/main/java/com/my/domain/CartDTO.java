package com.my.domain;

public class CartDTO {

	private int cartId;
	private String useremail;
	private int productnum;
	private int productCount;
	
	//상품
	private String productname;
	private int productprice;
	private double productDiscount;
	
	private int salePrice;
	private int totalPrice;
	
	
	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getUserEmail() {
		return useremail;
	}

	public void setUserEmail(String useremail) {
		this.useremail = useremail;
	}

	public int getProductNum() {
		return productnum;
	}

	public void setProductNum(int productnum) {
		this.productnum = productnum;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getProductName() {
		return productname;
	}

	public void setProductName(String productname) {
		this.productname = productname;
	}

	public int getProductPrice() {
		return productprice;
	}

	public void setProductPrice(int productprice) {
		this.productprice = productprice;
	}
	
	public double getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(double productDiscount) {
		this.productDiscount = productDiscount;
	}
	
	public int getSalePrice() {
		return salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void initSaleTotal() {
		this.salePrice = (int) (this.productprice * (1-this.productDiscount));
		this.totalPrice = this.salePrice*this.productCount;
	}
	
	
	
	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", useremail=" + useremail + ", productnum=" + productnum + ", productCount="
				+ productCount + ", productDiscount=" + productDiscount +", productname=" + productname + ", productprice=" + productprice + ", salePrice=" + salePrice +", totalPrice=" + totalPrice + "]";
	}
}
