package com.my.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.domain.AdminDTO;
import com.my.domain.Criteria;
import com.my.domain.OrderCancelDTO;
import com.my.domain.OrderDTO;
import com.my.domain.PageDTO;
import com.my.service.AdminService;
import com.my.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminService services;
	
	@Autowired
	private OrderService orderService;

	@GetMapping({"/login","/join"})
	public void goLogin() {
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest resq) {
		HttpSession session = resq.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/join")
	public String join(AdminDTO admin, HttpServletResponse ra, RedirectAttributes rar) {
		if(services.join(admin)) {
			Cookie joinid = new Cookie("joinid", admin.getAdminemail());
			joinid.setMaxAge(300);
			ra.addCookie(joinid);
			rar.addFlashAttribute("joinid", ra);
			return "/admin/login";
		}
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(String adminemail, String adminpw, HttpServletRequest resq, RedirectAttributes ra) {
		HttpSession session = resq.getSession();
		AdminDTO loginAdmin = services.login(adminemail, adminpw);
		if(loginAdmin != null) {
			session.setAttribute("loginAdminid", loginAdmin.getAdminemail());
			session.setAttribute("loginAdminname", loginAdmin.getAdminname());
			session.setAttribute("adminpw", loginAdmin.getAdminpw());
			session.setAttribute("adminphone", loginAdmin.getAdminphone());
			session.setAttribute("postnum", loginAdmin.getPostnum());
			session.setAttribute("addr", loginAdmin.getAddr());
			session.setAttribute("detailaddress", loginAdmin.getDetailaddress());
			session.setAttribute("seealso", loginAdmin.getSeealso());
		}
		else if(loginAdmin == null) {
			ra.addFlashAttribute("f", "실패임");
			return "redirect:/admin/login";
		}
		return "redirect:/";
	}
	
	@PostMapping("/checkId")
	@ResponseBody
	public int checkId(@RequestParam("adminemail") String adminemail) {
	int cnt = services.checkId(adminemail);
	return cnt;
	}
	
	@PostMapping("/pwChanges")
	public String pwChanges(String adminemail, String adminpw, RedirectAttributes ra, HttpServletRequest resq) {
		if(services.pwChanges(adminemail,adminpw)) {
			ra.addFlashAttribute("t","성공");
			HttpSession session = resq.getSession();
			session.removeAttribute("adminpw");
			session.setAttribute("adminpw", adminpw);
		}
		else {
			ra.addFlashAttribute("f", "실패");
		}
		return "redirect:/";
	}
	
	@PostMapping("/nameCn")
	public String nameCn(String adminemail, String adminname, RedirectAttributes ra, HttpServletRequest resq) {
		if(services.nameCn(adminemail,adminname)) {
			ra.addFlashAttribute("T", "성공");
			HttpSession session = resq.getSession();
			session.removeAttribute("loginAdminname");
			session.setAttribute("loginAdminname", adminname);
		}
		else {
			ra.addFlashAttribute("F", "실패");
		}
		return "redirect:/";
	}
	
	@PostMapping("/zipCn")
	public String zipCn(AdminDTO admin, RedirectAttributes ra, HttpServletRequest resq) {
		if(services.zipCn(admin)) {
			ra.addFlashAttribute("tT","tt");
			HttpSession session = resq.getSession();
			session.removeAttribute("postnum");
			session.removeAttribute("addr");
			session.removeAttribute("detailaddress");
			session.removeAttribute("seealso");
			session.setAttribute("postnum", admin.getPostnum());
			session.setAttribute("addr", admin.getAddr());
			session.setAttribute("detailaddress", admin.getDetailaddress());
			session.setAttribute("seealso", admin.getSeealso());
		}
		else {
			ra.addFlashAttribute("fF","ff");
		}
		return "redirect:/";
	}
	
	@PostMapping("/getPw")
	public String getPw(String adminemail) {
		String adminpw = services.getPw(adminemail);
		return adminpw;
	}
	
	@PostMapping("/bye")
	public String bye(String adminemail, RedirectAttributes ra, HttpServletRequest resq) {
		if(services.bye(adminemail)) {
			HttpSession session = resq.getSession();
			session.invalidate();
			ra.addFlashAttribute("byeSuc", "성공");
		}
		else {
			ra.addFlashAttribute("byeF", "실패");
		}
		return "redirect:/";
	}
	
	// Tiles body페이지 변경
    @RequestMapping(value="/myInfo")
    public String testPage() {
        return "/tiles/myInfo";
    }
    
    @RequestMapping(value="/pwchange")
    public String testPages() {
    	return "/tiles/pwchange";
    }
    
    @RequestMapping(value ="/bye")
    public String byePage() {
    	return "/tiles/bye";
    }
    
    /* 개인정보 취급방침 & 이용약관 */
    @GetMapping({"/pers","/use"})
	public void goPers() {
	}

    /* 주문 현황 페이지 */
	@GetMapping("/orderList")
	public String orderListGET(Criteria cri, Model model) {

		List<OrderDTO> list = services.getOrderList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri,services.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		return "/admin/orderList";
	}
	
	/* 주문삭제 */
	@PostMapping("/orderCancle")
	public String orderCanclePOST(OrderCancelDTO dto) {
		
		orderService.orderCancle(dto);
		
		return "redirect:/admin/orderList?keyword=" + dto.getKeyword() + "&amount=" + dto.getAmount() + "&pageNum=" + dto.getPageNum();

	}
}


