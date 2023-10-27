package com.my.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.domain.Criteria;
import com.my.domain.FaqDTO;
import com.my.domain.ReplyDTO;

public interface FaqMapper {

	/* 작성자 등록 */
    public void enroll(FaqDTO faq);
    
    /* 게시판 목록(페이징 적용) */
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
    
   /* 게시판 답변 등록 */
    public void addReply(ReplyDTO reply);
    
   /* 게시판 답변 조회 */
    public ReplyDTO getReplyRead(int raply_id);
    
    public List<FaqDTO> getListWithAnswers();
    
    /* 답변 수정 */
    public int modifyReply(ReplyDTO reply);

    /* 답변 삭제 */
    public int deleteReply(int reply_id);
    
}
