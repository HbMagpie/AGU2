package com.my.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.domain.Criteria;
import com.my.domain.FaqDTO;
import com.my.service.ProductServiceImpl;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FaqMapperTests {

	@Autowired
	private FaqMapper mapper;
	
	/* 게시판 등록 테스트  */
	@Test
    public void testEnroll() {
        
		FaqDTO dto = new FaqDTO();
        
        dto.setTitle("mapper test2");
        dto.setContent("mapper test2");
        dto.setWriter("mapper test2");
        
        mapper.enroll(dto);
        
    } 
	
	/* 게시판 목록 테스트 
    @Test
    public void testGetList() {
        
        
        List list = mapper.getList();
       /* 일반적 for문 
        for(int i = 0; i < list.size();i++) {
            log.info("" + list.get(i));
        } */
        
       /* foreach문(향상된 for문) 
        for(Object a : list) {
            log.info("" + a);
        } */
        
       /* foreach문 & 람다식 */
        /* list.forEach(notice -> log.info("" + notice));
        
    } */

		/* 게시판 조회 테스트 
		@Test
		public void testGetPage() {
		
		   int bno = 3;
		   
		   log.info("" + mapper.getPage(bno));
		   
		} */
	
	/* 게시판 수정 테스트(성공:1, 실패:0)
    @Test
    public void testModify() {
        
    	NoticeDTO notice = new NoticeDTO();
    	notice.setBno(3);
    	notice.setTitle("수정 제목");
    	notice.setContent("수정 내용");
        
        int result = mapper.modify(notice);
        log.info("result : " +result);
        
    }  */
		
	 /* 게시판 삭제 (성공:1, 실패:0) 
    @Test
    public void testDelete() {
        
        int result = mapper.delete(6);
        log.info("result : " + result);
        
    } */
	
	/* 게시판 목록(페이징 적용)테스트
    @Test
    public void testGetListPaging() {
        
        Criteria cri = new Criteria();
        
        cri.setPageNum(2); // 페이지 번호
                         
        List list = mapper.getListPaging(cri);
        
        list.forEach(notice -> log.info("" + notice));
    }  */

}
