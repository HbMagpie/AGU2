package com.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.domain.ReviewDTO;
import com.my.domain.AdminDTO;
import com.my.domain.Criteria;
import com.my.domain.OrderDTO;
import com.my.mapper.AdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Override
	public int checkId(String adminemail) {
		return mapper.checkId(adminemail);
	}
	
	@Override
	public boolean join(AdminDTO admin) {
		return mapper.join(admin) == 1;
	}
	@Override
	public AdminDTO login(String adminemail, String adminpw) {
		return mapper.login(adminemail,adminpw);
	}
	
	@Override
	public AdminDTO getAdmin(String adminemail) {
		return mapper.getAdmin(adminemail);
	}
	
	@Override
	public boolean pwChanges(String adminemail, String adminpw) {
		return mapper.pwChanges(adminemail, adminpw) == 1;
	}
	
	@Override
	public String getPw(String adminemail) {
		return mapper.getPw(adminemail);
	}
	
	@Override
	public boolean nameCn(String adminemail, String adminname) {
		return mapper.nameCn(adminemail,adminname) == 1;
	}
	
	@Override
	public boolean zipCn(AdminDTO admin) {
		return mapper.zipCn(admin) == 1;
	}
	
	@Override
	public boolean review(ReviewDTO review) {
		return mapper.review(review) == 1;
	}
	
	@Override
	public int getReviewnum() {
		return mapper.getReviewnum();
	}
	
	@Override
	public boolean reviewDelete(int reviewnum) {
		return mapper.reviewDelete(reviewnum);
	}
	
	@Override
	public boolean reviewModify(ReviewDTO review) {
		return mapper.reviewModify(review);
	}
	
	@Override
	public boolean bye(String adminemail) {
		return mapper.bye(adminemail) == 1;
	}
	
	/* 주문 상품 리스트 */
	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		return mapper.getOrderList(cri);
	}
	
	/* 주문 총 갯수 */
	@Override
	public int getOrderTotal(Criteria cri) {
		return mapper.getOrderTotal(cri);
	}
}








