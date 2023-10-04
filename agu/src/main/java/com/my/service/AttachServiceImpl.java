package com.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.mapper.AttachMapper;
import com.my.domain.Files;

import lombok.extern.log4j.Log4j;

@Service
@Log4j

	public class AttachServiceImpl implements AttachService{

		@Autowired
		private AttachMapper attachMapper;
		
		
		/* 이미지 데이터 반환 */
		@Override
		public List<Files> getAttachList(int productnum) {
			
			log.info("getAttachList.........");
			
			return attachMapper.getAttachList(productnum);
		}
		

	}
