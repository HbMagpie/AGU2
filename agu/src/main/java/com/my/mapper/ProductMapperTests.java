package com.my.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.domain.Criteria;
import com.my.domain.ProductDTO2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {

	@Autowired
	private ProductMapper mapper;
	
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
}
