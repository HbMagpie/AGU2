package com.my.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.domain.Criteria;
import com.my.domain.ProductDTO;
import com.my.domain.ProductDTO2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {

	@Autowired
	private ProductMapper mapper;
	private String New;
	
	/*
	@Test
	public void getProductListTest() {
		
		Criteria cri = new Criteria();
		// 테스트 키워드
		//cri.setKeyword("test");
		System.out.println("cri : " + cri);
		
		List<ProductDTO2> list = mapper.getProductList(cri);
		System.out.println("list : " + list);
		
		System.out.println("==========");	
		int productTotal = mapper.productGetTotal(cri);
		System.out.println("totla : " + productTotal);
	}
	*/
	
	/*
	// 상품 삭제 테스트
	@Test
	public void productDeleteTest() {
		
		int productnum = 2;
		
		int result = mapper.productDelete(productnum); 
				
		if(result == 1) {
			System.out.println("삭제 성공");
		}
	} */
	
	/* 카테고리 리스트
	@Test
	public void cateListTest() throws Exception{
		
		System.out.println("cateList()..........." + mapper.cateList());
		
	} */
	
	/* 상품 등록 테스트
	@Test
	public void setProductTest() throws Exception{
		
		ProductDTO product = new ProductDTO();
		
		product.setProductname("mapper 테스트");
		product.setCatename("BEST");
		product.setProductprice("30000");
		product.setProductcontents("여름");
		product.setUseremail("test1234@naver.com");
				
		mapper.setProduct(product);
	} */
	
	/* 상품 조회 페이지 */
	@Test
	public void productGetDetailTest() {
		
		String catename = "New";
		
		ProductDTO result = mapper.productGetDetail(catename);
		
		System.out.println("상품 조회 데이터 : " + result);
		
		
	}
	
}
