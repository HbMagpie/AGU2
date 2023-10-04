package com.my.service;

import java.util.List;

import com.my.domain.Files;

public interface AttachService {
	
	/* 이미지 데이터 반환 */
	public List<Files> getAttachList(int productnum);	

}