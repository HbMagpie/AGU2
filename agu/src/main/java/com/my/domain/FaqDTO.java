package com.my.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FaqDTO {
	
	
	/* 게시판 번호 */
    private int bno;
    
    /* 게시판 제목 */
    private String title;
    
    /* 게시판 내용 */
    private String content;
    
    /* 게시판 작성자 */
    private String writer;
    
    /* 등록 날짜 */
    private Date regdate;
    
    /* 수정 날짜 */
    private Date updateDate;
    
    /* 게시판 답변 */
    private ReplyDTO reply;
    
    /* 답변 ID */
    private int reply_id;

    public int getReply_id() {
        return reply_id;
    }

    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
    }
}



