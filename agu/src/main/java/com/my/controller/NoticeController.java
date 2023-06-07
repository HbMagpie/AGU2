package com.my.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.domain.Criteria;
import com.my.domain.NoticeDTO;
import com.my.domain.PageMakerDTO;
import com.my.service.NoticeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
    private NoticeService nservice;
	
	/* @Setter(onMethod_ = @Autowired)
	private NoticeService services; */
	
	/* 게시판 목록 페이지 접속(페이징 적용) */
    @GetMapping("/list")
    public void noticeListGET(Model model, Criteria cri) {
        
        log.info("noticeListGET");
        
        model.addAttribute("list", nservice.getListPaging(cri));
        
        int total = nservice.getTotal();
        
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
        
    }
    
	/* 게시판 등록 페이지 접속 */
    @GetMapping("/enroll")
    // => @RequestMapping(value="enroll", method=RequestMethod.GET)
    public void noticeEnrollGET() {
        
        log.info("게시판 등록 페이지 진입");
        
    }
    
    /* 게시판 등록 */
    @PostMapping("/enroll")
    public String noticeEnrollPOST(NoticeDTO notice, RedirectAttributes rttr) {
        
        log.info("NoticeDTO : " + notice);
        
        nservice.enroll(notice);
        
        rttr.addFlashAttribute("result", "enrol success");
        
        return "redirect:/notice/list";
    }
    
    /* 게시판 조회 */
    @GetMapping("/get")
    public void noticeGetPageGET(int bno, Model model, Criteria cri) {
        
        model.addAttribute("pageInfo", nservice.getPage(bno));
        
        model.addAttribute("cri", cri);
        
    }
    
    /* 수정 페이지 이동 */
    @GetMapping("/modify")
    public void noticeModifyGET(int bno, Model model, Criteria cri) {
        
        model.addAttribute("pageInfo", nservice.getPage(bno));
        
        model.addAttribute("cri", cri);
        
    }
    
    /* 페이지 수정 */
    @PostMapping("/modify")
    public String noticeModifyPOST(NoticeDTO notice, RedirectAttributes rttr) {
        
        nservice.modify(notice);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/notice/list";
        
    }
    
    /* 페이지 삭제 */
    @PostMapping("/delete")
    public String noticeDeletePOST(int bno, RedirectAttributes rttr) {
        
        nservice.delete(bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/notice/list";
    }

}


