package com.my.service;


import java.util.List;

import com.my.domain.Criteria;
import com.my.domain.ReviewDTO;
import com.my.domain.UserDTO;

public interface UserService {
	boolean reviewDelete(int reviewnum);
	int checkId(String useremail);
	boolean join(UserDTO user);
	UserDTO login(String useremail, String userpw);
	UserDTO getUser(String useremail);
	boolean pwChanges(String useremail, String userpw);
	String getPw(String useremail);
	boolean nameCn(String useremail, String username);
	boolean zipCn(UserDTO user);
	boolean review(ReviewDTO review);
	int getReviewnum();
	boolean reviewModify(ReviewDTO review);
	boolean bye(String useremail);
	
	/* 회원 목록 */
    public List<UserDTO> getList();
    
    /* 회원 목록(페이징 적용) */
    public List<UserDTO> getListPaging(Criteria cri);
    
    /* 전체 회원수 */
    public int getTotal();
    
    /* 회원 삭제 */
    public String userDelete(String useremail);
    
    /* 주문자 정보 */
	public UserDTO getUserInfo(String useremail);

}
