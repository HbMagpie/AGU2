package com.my.service;


import java.util.List;

import com.my.domain.AdminDTO;
import com.my.domain.Criteria;
import com.my.domain.OrderDTO;
import com.my.domain.ReviewDTO;

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
	boolean review(ReviewDTO review);
	int getReviewnum();
	boolean reviewModify(ReviewDTO review);
	boolean bye(String adminemail);
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
}
