package com.my.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.domain.Criteria;
import com.my.domain.FaqDTO;
import com.my.domain.PageMakerDTO;
import com.my.domain.ReplyDTO;
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
	    List<FaqDTO> faqList = fservice.getListPaging(cri); // FAQ 목록을 가져옴
	    
	    for (FaqDTO faq : faqList) {
	        // 해당 FAQ의 답변을 가져오기
	        ReplyDTO reply = fservice.getReplyRead(faq.getReply_id());
	        
	        if (reply != null) {
	            // 답변이 존재하는 경우, ReplyDTO를 FAQDTO에 설정
	            faq.setReply(reply);
	        }
	    }
	    int total = fservice.getTotal();
	    PageMakerDTO pageMake = new PageMakerDTO(cri, total);

	    model.addAttribute("list", faqList);
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
    
    
    
    /* reply 등록 */

    // 게시물의 답변을 등록하는 페이지로 이동
    @GetMapping("/addReplyForm")
    public String showAddReplyForm(@RequestParam("bno") int bno, Model model) {
    	FaqDTO faq = fservice.getPage(bno); // 해당 게시물 정보 가져오기
        // 게시물 번호를 모델에 추가하여 화면에 전달
        model.addAttribute("faq", faq);
        return "faq/addReplyForm";
    }

    @PostMapping("/addReply")
    public String addReply(@ModelAttribute ReplyDTO reply) {
        fservice.addReply(reply);
        return "redirect:/faq/list"; // 답변 등록 후 목록 페이지로 리다이렉션
    }
    
    @GetMapping("/getReply")
    public void getReplyRead(int reply_id, Model model, Criteria cri) {
        
        model.addAttribute("reply",  fservice.getReplyRead(reply_id));
        model.addAttribute("cri", cri);
        
    }
    
    /* 답변 수정 페이지로 이동 */
    @GetMapping("/modifyReply")
    public void modifyReplyGET(int reply_id, Model model, Criteria cri) {
       
            model.addAttribute("reply",  fservice.getReplyRead(reply_id));
            model.addAttribute("cri", cri);
          
    }
    
    /* 답변 수정 */
    @PostMapping("/modifyReply")
    public String modifyReplyPOST(@RequestParam("reply_id") Integer reply_id, ReplyDTO reply, RedirectAttributes rttr) {

    	if (reply_id != null) {
            // reply_id가 null이 아닌 경우에만 실행될 코드를 작성하세요.
    		reply.setReply_id(reply_id);
            fservice.modifyReply(reply);
        }
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/faq/list";
        
    }
    
    
    /* 답변 삭제 */
    @PostMapping("/deleteReply") // DELETE 요청으로 답변 삭제
    public String deleteReplyPOST(int reply_id, RedirectAttributes rttr) {
        
        fservice.delete(reply_id);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/faq/list";
    }

}



