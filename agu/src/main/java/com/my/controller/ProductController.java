package com.my.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.my.domain.Criteria;
import com.my.domain.PageDTO;
import com.my.domain.ProductDTO;
import com.my.domain.ProductDTO2;
import com.my.domain.ReviewDTO;
import com.my.service.ProductService;
import com.my.service.UserService;
import com.my.service.AdminService;
import com.my.service.AttachService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
public class ProductController {
	
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	
	/* Start! 상품 검색 */
	@GetMapping("/search")
	public String searchProductGET(Criteria cri, Model model) {
		
		log.info("cri : " + cri);
		
		List<ProductDTO2> list = service.getProductList(cri);
		log.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			log.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "search";
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, service.productGetTotal(cri)));
		
		
		return "search";
		
	}
	/* End! 상품 검색 */
	
	/* 상품 등록 */
	@GetMapping("/addproduct")
	public void addproduct(Model model) throws Exception {
		
		ObjectMapper objm = new ObjectMapper();
		
		List list = service.cateList();
		
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
		/* JSON 변환 확인
		log.info("변경 전.........." + list);
		log.info("변경 후.........." + cateList); */
		
	}
	
	@PostMapping("/uploadFile")
	public  String insertinto(MultipartFile [] files, String catename, String productname, String productcontents, String productprice, String adminemail,RedirectAttributes ra, HttpServletRequest request)throws IOException {
		log.info(files);
		ProductDTO prod = new ProductDTO();
		//상품 정보들을 먼저 테이블에 저장시켜 준다.
		prod.setCatename(catename);
		prod.setProductname(productname);
		prod.setProductcontents(productcontents);
		prod.setProductprice(productprice);
		prod.setAdminemail(adminemail);
		service.addProduct(prod);
		
		
		/* String fileurl = "D:\\1900_WEB_LHS\\my\\workspace\\Shopping\\src\\main\\webapp\\resources\\img\\";*/
		String fileurl = "C:\\Users\\hopei47\\git\\AGU\\agu\\src\\main\\webapp\\resources\\img\\";
        
        for (MultipartFile mf : files) {
        	//사용자가 업로드한 파일이 있다면 아래 로직 수행
            String filerealname = mf.getOriginalFilename(); // 원본 파일 명
            long filesSize = mf.getSize(); // 파일 사이즈

            
            //저장할 때 파일 이름이 겹치지 않도록 랜덤 id를 부여한다.
            UUID uuid = UUID.randomUUID();
            
            String filename = uuid+filerealname;
            String safefile = fileurl+uuid+filerealname;
            try {
            	//같이 넘어온 상품의 상품 번호를 가져온다.
            	int productnum = service.getProductnum();
            	//이미지 파일을 db에 저장시키는 것에 성공 하면
            	if(service.setFile(fileurl, filerealname, filename, productnum,safefile)) {
            		//지정해둔 경로에 이미지를 업로드시킨 후 메인 화면으로 보낸다.
            		mf.transferTo(new File(safefile));
            		ra.addFlashAttribute("suc","tt");
            	}
            	else {
            		ra.addFlashAttribute("f", "실패");
            	}
                
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/";
}
	
	
	@GetMapping("/board")
	public void goboard(ProductDTO productnum, Model model) {
		String filename = service.getFilename(productnum.getProductnum());
		ProductDTO prod = service.getproduct(productnum.getProductnum());
		List<ReviewDTO> review = service.getReview(productnum.getProductnum());
		//board.jsp로 넘겨줄 데이터
		model.addAttribute("filename", filename);
		model.addAttribute("product", prod);
		model.addAttribute("review", review);
	}
	
	/* 상품 정보 삭제 */
	@GetMapping("/productDelete")
	public String productDeletePOST(int productnum, RedirectAttributes rttr) {
		
		log.info("productDeletePOST..........");		
		
		int result = service.productDelete(productnum);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/";
		
	}
	
	/* 상품 조회 페이지 */
	@GetMapping("/productDetail")
	public void productGetInfoGET(String catename, Criteria cri, Model model) throws JsonProcessingException {
		
		log.info("productGetInfo()........." + catename);
		
		ObjectMapper mapper = new ObjectMapper();
		
		/* 카테고리 리스트 데이터 */
		model.addAttribute("cateList", mapper.writeValueAsString(service.cateList()));	
		
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		
		/* 조회 페이지 정보 */
		model.addAttribute("productInfo", service.productGetDetail(catename));
		
	}
	
	/* 이미지 출력 */
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String filename){
		
		log.info("getImage()........" + filename);
		
		File file = new File("C:\\Users\\hopei47\\git\\AGU\\agu\\src\\main\\webapp\\resources\\img\\" + filename);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

//	/* 이미지 정보 반환 */
//	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public ResponseEntity<List<com.my.domain.Files>> getAttachList(int productnum){
//		
//		log.info("getAttachList.........." + productnum);
//		
//		 List<com.my.domain.Files> attachments = attachService.getAttachList(productnum);
//		 return new ResponseEntity<List<com.my.domain.Files>>(attachments, HttpStatus.OK);
//		
//	}
	
}












