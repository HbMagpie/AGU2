package com.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.domain.Criteria;
import com.my.domain.NoticeDTO;
import com.my.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServiceImpl implements NoticeService{
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	/* 게시판 등록 */
	@Override
    public void enroll(NoticeDTO notice) {
        
        mapper.enroll(notice);
        
    }

	/* 게시판 목록(페이징 적용) */
    @Override
    public List<NoticeDTO> getListPaging(Criteria cri) {
        
        return mapper.getListPaging(cri);
    } 
    
    /* 게시물 총 갯수 */
    @Override
    public int getTotal() {
        
        return mapper.getTotal();
    }  
	
	/* 게시판 조회 */
    @Override
    public NoticeDTO getPage(int bno) {
         
        return mapper.getPage(bno);
    }
    
    /* 게시판 수정 */
    @Override
    public int modify(NoticeDTO notice) {
        
        return mapper.modify(notice);
    }
    
    /* 게시판 삭제 */
    @Override
    public int delete(int bno) {
        
        return mapper.delete(bno);
    } 
}








