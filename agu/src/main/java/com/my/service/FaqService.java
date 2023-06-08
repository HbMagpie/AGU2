package com.my.service;

import java.util.List;

import com.my.domain.Criteria;
import com.my.domain.FaqDTO;

public interface FaqService {
	
	/* 게시판 등록 */
    public void enroll(FaqDTO faq);
    
    /* 게시판 목록 */
    public List<FaqDTO> getList();
    
    /* 게시판 목록(페이징 적용) */
    public List<FaqDTO> getListPaging(Criteria cri);
    
    /* 게시판 총 갯수 */
    public int getTotal();
    
    /* 게시판 조회 */
    public FaqDTO getPage(int bno);
    
    /* 게시판 수정 */
    public int modify(FaqDTO faq);
    
    /* 게시판 삭제 */
    public int delete(int bno);
}
