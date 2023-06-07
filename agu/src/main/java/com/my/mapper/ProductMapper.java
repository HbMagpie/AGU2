package com.my.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.domain.CateDTO;
import com.my.domain.Criteria;
import com.my.domain.Files;
import com.my.domain.ProductDTO;
import com.my.domain.ProductDTO2;
import com.my.domain.ReviewDTO;

public interface ProductMapper {
	int setProduct(ProductDTO prod);
	List<ProductDTO> getProduct();
	List<Files> getFile();
	int getProductnum();
	boolean setFile(@Param("fileurl")String fileurl, @Param("filerealname")String filerealname, @Param("filename")String filename, @Param("productnum")int productnum, @Param("safefile")String safefile);
	String getFilename(int productnum);
	ProductDTO getproduct(int productnum);
	List<ReviewDTO> getReview(int productnum);
	
	/* 상품 검색 */
	List<ProductDTO2> getProductList(Criteria cri);

	/* 상품 총 갯수 */
	int productGetTotal(Criteria cri);
	
	/* 상품 정보 삭제 */
	int productDelete(int productnum);
	
	/* 카테고리 리스트 */
	public List<CateDTO> cateList();
	
	/* 상품 조회 페이지 */
	public ProductDTO productGetDetail(String catename);
}
