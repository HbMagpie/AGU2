package com.my.service;


import com.my.domain.BuyProductDTO;
import com.my.domain.ReviewDTO;
import com.my.domain.AdminDTO;

public interface AdminService {
	boolean reviewDelete(int reviewnum);
	int checkId(String adminemail);
	boolean join(AdminDTO admin);
	AdminDTO login(String adminemail, String adminpw);
	AdminDTO getAdmin(String adminemail);
	boolean pwChanges(String adminemail, String adminpw);
	String getPw(String adminemail);
	boolean nameCn(String adminemail, String adminname);
	boolean zipCn(AdminDTO admin);
	boolean buyProduct(BuyProductDTO buy);
	boolean review(ReviewDTO review);
	int getReviewnum();
	boolean reviewModify(ReviewDTO review);
	boolean bye(String adminemail);
}
