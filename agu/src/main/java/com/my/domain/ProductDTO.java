package com.my.domain;


public class ProductDTO {
	private int productnum;
	private String catename;
    private String productname;
    private String productprice;
    private String productcontents;
	private String adminemail;
	
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getCatename() {
		return catename;
	}
	public void setCatename(String catename) {
		this.catename = catename;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProductprice() {
		return productprice;
	}
	public void setProductprice(String productprice) {
		this.productprice = productprice;
	}
	public String getProductcontents() {
		return productcontents;
	}
	public void setProductcontents(String productcontents) {
		this.productcontents = productcontents;
	}
	public String getAdminemail() {
		return adminemail;
	}
	public void setAdminemail(String adminemail) {
		this.adminemail = adminemail;
	}
	@Override
	public String toString() {
		return "ProductDTO [productnum=" + productnum + ", catename=" + catename + ", productname=" + productname
				+ ", productprice=" + productprice + ", productcontents=" + productcontents + ", adminemail=" + adminemail + "]";
	}
	
	
}
