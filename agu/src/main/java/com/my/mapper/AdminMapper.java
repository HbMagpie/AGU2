package com.my.mapper;

import org.apache.ibatis.annotations.Param;


import com.my.domain.ReviewDTO;
import com.my.domain.AdminDTO;

public interface AdminMapper {
	int checkId(String adminemail);
	int join(AdminDTO admin);
	AdminDTO login(@Param("adminemail")String adminemail, @Param("adminpw")String adminpw);
	AdminDTO getAdmin(String adminemail);
	int pwChanges(@Param("adminemail")String adminemail, @Param("adminpw")String adminpw);
	String getPw(String adminemail);
	int nameCn(@Param("adminemail")String adminemail, @Param("adminname")String adminname);
	int zipCn(AdminDTO admin);
	int review(ReviewDTO review);
	int getReviewnum();
	boolean reviewDelete(int reviewnum);
	boolean reviewModify(ReviewDTO review);
	int bye(String adminemail);
}
