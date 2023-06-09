package com.my.domain;


import lombok.Data;

@Data
public class CartDTO {
	
	// cart 부분
	
	private int cartId;
    
    private String useremail;
    
    private int productnum;
    
    private int productCount;
    
    // product 부분
    
    private String productname;
    
    private int productprice;
}



