package com.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.domain.Criteria;
import com.my.domain.FaqDTO;
import com.my.mapper.FaqMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FaqServiceImpl implements FaqService{
	@Setter(onMethod_ = @Autowired)
	private FaqMapper mapper;
	
	/* 게시판 등록 */
	@Override
    public void enroll(FaqDTO faq) {
        
        mapper.enroll(faq);
        
    }
	
	/* 게시판 목록 */
    @Override
    public List<FaqDTO> getList() {
    	
    	 return mapper.getList();
    }

	/* 게시판 목록(페이징 적용) */
    @Override
    public List<FaqDTO> getListPaging(Criteria cri) {
        
        return mapper.getListPaging(cri);
    } 
    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal() {
        
        return mapper.getTotal();
    }  
	
	/* 게시판 조회 */
    @Override
    public FaqDTO getPage(int bno) {
         
        return mapper.getPage(bno);
    }
    
    /* 게시판 수정 */
    @Override
    public int modify(FaqDTO faq) {
        
        return mapper.modify(faq);
    }
    
    /* 게시판 삭제 */
    @Override
    public int delete(int bno) {
        
        return mapper.delete(bno);
    } 
}








