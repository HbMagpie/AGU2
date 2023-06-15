<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AGU</title>
 <link href="/resources/css/styles.css" rel="stylesheet" />
 <link href="/resources/css/cart.css" rel="stylesheet" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <style>
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
* {font-family: 'SUITE-Regular';}
</style>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">AGU</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">모든 상품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">인기 상품</a></li>
                                <li><a class="dropdown-item" href="#!">새 상품</a></li>
                                <li><a class="dropdown-item" href="#!">Dress</a></li>
                                <li><a class="dropdown-item" href="#!">Outer</a></li>
                                <li><a class="dropdown-item" href="#!">Blouse</a></li>
                                <li><a class="dropdown-item" href="#!">Tee</a></li>
                                <li><a class="dropdown-item" href="#!">Knit</a></li>
                                <li><a class="dropdown-item" href="#!">Bottom</a></li>
                            </ul>
                        </li>
                        <!-- Start! 검색 기능
                        <li>
                        <div class="search_wrap">
                			<form id="searchForm" action="/product/search" method="get">
                				<div class="search_input">
                					<input type="text" name="keyword">
                    				<button class='btn search_btn'>검 색</button>                				
                				</div>
                			</form>
                		</div>
                        </li>
                        End! 검색 기능 -->
                    </ul>
                    <c:if test="${loginUserid != null}">
                    	<form class="d-flex">
                    	<input class= "useremail" type="hidden" value="${loginUserid}">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/user/myInfo" class="nav-link" id="myinfo">내정보</a></li>
                    		<li class="nav-item"><a href="/product/addproduct" class="nav-link">상품 등록</a></li>
                    		<li class="nav-item"><a href="/cart" class="nav-link">장바구니</a></li>
                    		<li class="nav-item"><a href="/user/logout"class="nav-link">로그아웃</a></li>
                    	</ul>
                    	</form>
                    </c:if>
                    <c:if test="${loginUserid == null }">
                    	<form class="d-flex">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/user/login" class="nav-link">로그인</a></li>
                    		<li class="nav-item"><a href="/user/join"class="nav-link">회원가입</a></li>
                    	</ul>
                    </form>
                    </c:if>
                </div>
            </div>
        </nav>
    <!-- 장바구니 -->
       	 <div class="content_area">
       	 
       	 <div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>
					
						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1"></td>
								<td class="td_width_2"></td>
								<td class="td_width_3">${ci.productname}</td>
								<td class="td_width_4 price_td">
									<del>정가 : <fmt:formatNumber value="${ci.productprice}" pattern="#,### 원" /></del><br>
									판매가 : <span class="red_color"><fmt:formatNumber value="${ci.salePrice}" pattern="#,### 원" /></span><br>
									<%-- 마일리지 : <span class="green_color"><fmt:formatNumber value="${ci.point}" pattern="#,###" /></span> --%>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ci.productCount}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.salePrice * ci.productCount}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
											<span class="totalPrice_span">70000</span> 원
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<span class="delivery_price">3000</span>원
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
										<td><span class="totalKind_span"></span>종 <span class="totalCount_span"></span>권</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 적립 예상 마일리지</strong>
											
											</td>
											<td>
												<span class="totalPoint_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a>주문하기</a>
			</div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; AGU 2023</p></div>
        </footer>
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
        <script src="/resources/js/swiper.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>

	<script>
	$(document).ready(function(){
		/* 종합 정보 섹션 정보 삽입 */
			let totalPrice = 0;			// 총 가격
			let totalCount = 0;			// 총 갯수
			let deliveryPrice = 0;		// 배송비
			let finalTotalPrice = 0;	// 최종 가격(총 가격 + 배송비)
			
			$(".cart_info_td").each(function(index, element){
			
				//총 가격
				totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
				//총 갯수
				totalCount += parseInt($(element).find(".individual_productCount_input").val());
			});
		/* 배송비 결정 */
		if(totalPrice >= 30000){
			deliveryPrice = 0;	
		} else if(totalPrice == 0) {
			deliveryPrice = 0;
		} else {
			deliveryPrice = 3000;
		}
		
		/* 최종 가격 */
		finalTotalPrice = totalPrice + deliveryPrice;
		
		/* 값 삽입 */
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 총 갯수
		$(".totalCount_span").text(totalCount);
		//배송비
		$(".delivery_price").text(deliveryPrice);
		//최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	
	});
	</script>
        
    </body>
</html>