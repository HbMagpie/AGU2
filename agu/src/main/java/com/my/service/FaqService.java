package com.my.service;

import java.util.List;

import com.my.domain.Criteria;
import com.my.domain.FaqDTO;
import com.my.domain.ReplyDTO;

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
    
    /* FAQ 답변 등록 */
    void addReply(ReplyDTO reply);
    
    /* FAQ에 대한 답변 내용 가져오기 */
    public ReplyDTO getReplyRead(int reply_id);
    
    /* FAQ 답변 수정 */
    public int modifyReply(ReplyDTO reply);

    /* FAQ 답변 삭제 */
    public int deleteReply(int reply_id);
}
