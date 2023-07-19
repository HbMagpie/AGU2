package com.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.domain.Criteria;
import com.my.domain.ReviewDTO;
import com.my.domain.UserDTO;
import com.my.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService{
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Override
	public int checkId(String useremail) {
		return mapper.checkId(useremail);
	}
	
	@Override
	public boolean join(UserDTO user) {
		return mapper.join(user) == 1;
	}
	@Override
	public UserDTO login(String useremail, String userpw) {
		return mapper.login(useremail,userpw);
	}
	
	@Override
	public UserDTO getUser(String useremail) {
		return mapper.getUser(useremail);
	}
	
	@Override
	public boolean pwChanges(String useremail, String userpw) {
		return mapper.pwChanges(useremail, userpw) == 1;
	}
	
	@Override
	public String getPw(String useremail) {
		return mapper.getPw(useremail);
	}
	
	@Override
	public boolean nameCn(String useremail, String username) {
		return mapper.nameCn(useremail,username) == 1;
	}
	
	@Override
	public boolean zipCn(UserDTO user) {
		return mapper.zipCn(user) == 1;
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
	public boolean bye(String useremail) {
		return mapper.bye(useremail) == 1;
	}
	
	/* 회원 목록 */
    @Override
    public List<UserDTO> getList() {
    	
    	 return mapper.getList();
    }

	/* 회원 목록(페이징 적용) */
    @Override
    public List<UserDTO> getListPaging(Criteria cri) {
        
        return mapper.getListPaging(cri);
    }
    
    /* 전체 회원수 */
    @Override
    public int getTotal() {
        
        return mapper.getTotal();
    }
 
    /* 회원 삭제  */
	@Override
	public String userDelete(String useremail) {

		log.info("userDelete..........");
		
		return mapper.userDelete(useremail);
	}
	
	/* 주문자 정보 */
	@Override
	public UserDTO getUserInfo(String useremail) {
		
		return mapper.getUserInfo(useremail);
		
	}
}








