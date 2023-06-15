<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="kr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>AGU</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <link href="/resources/css/home.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    </head>
<style>
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
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
                        <li class="nav-item"><a class="nav-link" href="/notice/list">Notice</a></li>
                        <li class="nav-item"><a class="nav-link" href="/faq/list">FAQ</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/">All Product</a></li>
                                <li><hr class="dropdown-divider" /></li> 
                                <li><a class="dropdown-item" href="/product/search?keyword=best">Best</a></li>                             
                                <li><a class="dropdown-item" href="/product/search?keyword=new">New</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=dress">Dress</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=outer">Outer</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=blouse">Blouse</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=tee">Tee</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=knit">Knit</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=bottom">Bottom</a></li>
                            </ul>
                        </li>
                        <!-- Start! 검색 기능 -->
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
                        <!-- End! 검색 기능 -->           
                    </ul>
                    <c:if test="${loginAdminid != null}">
                    	<form class="d-flex">
                    	<input class= "adminemail" type="hidden" value="${loginAdminid}">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/user/userMng" class="nav-link" id="myinfo">회원 관리</a></li>
                    		<li class="nav-item"><a href="/product/addproduct" class="nav-link">상품 등록</a></li>
                    		<li class="nav-item"><a href="/admin/logout"class="nav-link">관리자 로그아웃</a></li>
                    	</ul>
                    	</form>
                    </c:if>
                    <c:if test="${loginUserid != null}">
                    	<form class="d-flex">
                    	<input class= "useremail" type="hidden" value="${loginUserid}">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/user/myInfo" class="nav-link" id="myinfo">내정보</a></li>
                    		<li class="nav-item"><a href="/" class="nav-link">장바구니</a></li>
                    		<li class="nav-item"><a href="/user/logout"class="nav-link">로그아웃</a></li>
                    	</ul>
                    	</form>
                    </c:if>
                    <c:if test="${loginUserid == null && loginAdminid == null }">
                    	<form class="d-flex">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/admin/login" class="nav-link">관리자 로그인</a></li>
                    		<li class="nav-item"><a href="/user/login" class="nav-link">로그인</a></li>
                    		<li class="nav-item"><a href="/user/join"class="nav-link">회원가입</a></li>
                    	</ul>
                    </form>
                    </c:if>
                </div>
            </div>
        </nav>
        	 
        <h2 style="text-align:center; margin-top:50px;">검색 결과💡</h2>
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${list}" var="list" varStatus="status">
                        <div class="card h-100">
                    <div class="col mb-5">
                	            <!-- Product image-->
                            <img class="card-img-top" src="/resources/img/${list.filename}"alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${list.productname}</h5>
                                    <!-- Product price-->
                                    ${list.productprice}원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product/board?productnum=${list.productnum}">구매하러 가기</a></div>
                            </div>
                            <c:if test="${loginAdminid != null}">
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            	<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product/productDelete?productnum=${list.productnum}">상품 삭제하기</a></div>
                            </div>
							</c:if>
                        </div>
                    </div>&nbsp;&nbsp;&nbsp;
                  </c:forEach>
                  </div>
                  </div>
                  </section>
        <!-- Start! footer 부분 -->      
 <footer>
 <hr color="#6aa888">
 <table>
	<tr>
	  <td style="cursor:pointer;" onClick="location.href='/'">Home</td>
	  <td></td>
	  <td><p style="text-align:right;">은행정보 : 국민 11111111-11-111111 / 예금주 : (주)AGU / P.000-0000-0000, E.agu123@naver.com</p></td>
	</tr>
	<tr>
	  <td style="cursor:pointer;" onClick="location.href='/notice/list'">공지사항</td>
	  <td></td>  
	  <td><p style="text-align:right;">통신판매업 신고번호 : 1111-ㅇㅇ-1111호[사업자정보확인]</p></td>
	</tr>
	<tr>	 
	  <td style="cursor:pointer;"onclick="window.open('/admin/pers', '개인정보 취급방침', 'width=500, height=600')">개인정보 취급방침</td>  
	  <td></td>
	  <td><p style="text-align:right;">대표이사 : 아구, 주소 : 서울특별시 ㅇㅇ구 ㅇㅇ동 ㅇㅇ빌딩 ㅇ층 ㅇㅇㅇ호</p></td>
	</tr>
	<tr>
	  <td style="cursor:pointer;" onClick="window.open('/admin/use', '개인정보 취급방침', 'width=500, height=600')">이용 약관</td>
	  <td></td>
	  <td><p style="text-align:right;">반품, 교환 수거신청 : CJ대한통운 서울특별시 ㅇㅇ구 ㅇㅇ동</p></td>
	</tr>
 </table>
  <br>
  <p>Copyright ⓒ All Rights Reserved By AGU<p>
  <br>
</footer>
<!-- End! footer 부분 -->
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
        <script src="/resources/js/swiper.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
    </body>
</html>