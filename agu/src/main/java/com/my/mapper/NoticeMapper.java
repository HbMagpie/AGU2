package com.my.mapper;

import java.util.List;

import com.my.domain.Criteria;
import com.my.domain.NoticeDTO;

public interface NoticeMapper {

	/* 작성자 등록 */
    public void enroll(NoticeDTO notice);
    
    /* 게시판 목록(페이징 적용) */
    public List<NoticeDTO> getListPaging(Criteria cri);
    
    /* 게시판 총 갯수 */
    public int getTotal();
    
    /* 게시판 조회 */
    public NoticeDTO getPage(int bno);
    
    /* 게시판 수정 */
    public int modify(NoticeDTO notice);
    
    /* 게시판 삭제 */
    public int delete(int bno);
}
