package com.my.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyDTO {
    private int reply_id;
    private int bno;
    private String title;
    private String writer;
    private String content;
    private Date regdate;

}
