package com.my.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.domain.Criteria;
import com.my.domain.FaqDTO;
import com.my.domain.PageMakerDTO;
import com.my.service.FaqService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/faq/*")
public class FaqController {
	
	@Autowired
    private FaqService fservice;
	
	/* @Setter(onMethod_ = @Autowired)
	private FaqService services; */
    
	/* 게시판 목록 페이지 접속(페이징 적용) */
    @GetMapping("/list")
    public void faqListGET(Model model, Criteria cri) {
        
    	/*  log.info("faqListGET"); */
        
        model.addAttribute("list", fservice.getListPaging(cri));
        
        int total = fservice.getTotal();
        
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        
        model.addAttribute("pageMaker", pageMake);
        
    }
    
	/* 게시판 등록 페이지 접속 */
    @GetMapping("/enroll")
    // => @RequestMapping(value="enroll", method=RequestMethod.GET)
    public void faqEnrollGET() {
        
    	/*  log.info("게시판 등록 페이지 진입"); */ 
        
    }
    
    /* 게시판 등록 */
    @PostMapping("/enroll")
    public String faqEnrollPOST(FaqDTO faq, RedirectAttributes rttr) {
        
       /* log.info("FaqDTO : " + faq); */
        
        fservice.enroll(faq);
        
        rttr.addFlashAttribute("result", "enrol success");
        
        return "redirect:/faq/list";
    }
    
    /* 게시판 조회 */
    @GetMapping("/get")
    public void faqGetPageGET(int bno, Model model, Criteria cri) {
        
        model.addAttribute("pageInfo", fservice.getPage(bno));
        
        model.addAttribute("cri", cri);
        
    }
    
    /* 수정 페이지 이동 */
    @GetMapping("/modify")
    public void faqModifyGET(int bno, Model model, Criteria cri) {
        
        model.addAttribute("pageInfo", fservice.getPage(bno));
        
        model.addAttribute("cri", cri);
        
    }
    
    /* 페이지 수정 */
    @PostMapping("/modify")
    public String faqModifyPOST(FaqDTO faq, RedirectAttributes rttr) {
        
        fservice.modify(faq);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/faq/list";
        
    }
    
    /* 페이지 삭제 */
    @PostMapping("/delete")
    public String faqDeletePOST(int bno, RedirectAttributes rttr) {
        
        fservice.delete(bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/faq/list";
    }

}


