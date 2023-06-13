package com.my.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.domain.BuyProductDTO;
import com.my.domain.Criteria;
import com.my.domain.ReviewDTO;
import com.my.domain.UserDTO;

public interface UserMapper {
	int checkId(String useremail);
	int join(UserDTO user);
	UserDTO login(@Param("useremail")String useremail, @Param("userpw")String userpw);
	UserDTO getUser(String useremail);
	int pwChanges(@Param("useremail")String useremail, @Param("userpw")String userpw);
	String getPw(String useremail);
	int nameCn(@Param("useremail")String useremail, @Param("username")String username);
	int zipCn(UserDTO user);
	int buyProduct(BuyProductDTO buy);
	int review(ReviewDTO review);
	int getReviewnum();
	boolean reviewDelete(int reviewnum);
	boolean reviewModify(ReviewDTO review);
	int bye(String useremail);
	
	/* 회원 목록 */
    public List<UserDTO> getList();
    
    /* 회원 목록(페이징 적용) */
    public List<UserDTO> getListPaging(Criteria cri);
    
    /* 전체 회원수 */
    public int getTotal();
    
    /* 회원 삭제 */
    public String userDelete(String useremail);
    
}
