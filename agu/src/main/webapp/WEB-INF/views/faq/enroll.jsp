<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AGU</title>

<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="/resources/css/styles.css" rel="stylesheet" /> 
<link href="/resources/css/board/faq.css" rel="stylesheet" />
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
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
                    </ul>
                    <c:if test="${loginUserid != null}">
                    	<form class="d-flex">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/user/myInfo" class="nav-link">내정보</a></li>
                    		<li class="nav-item"><a href="/product/addproduct" class="nav-link">상품 등록</a></li>
                    		<li class="nav-item"><a href="/user/logout"class="nav-link">로그아웃</a></li>
                    	</ul>
                    	</form>
                    </c:if>
                    <c:if test="${loginUserid == null }">
                    	<script>
                    		alert("로그인 후 이용해주세요");
                    		history.go(-1);
                    	</script>
                    </c:if>
                    <c:if test="${f != null}">
                    	<script>
                    		alert("상품 등록 실패");
                    		return false;
                    	</script>
                    </c:if>
                </div>
            </div>
        </nav>
        <!-- nav 끝 -->
<div id="wrap">
    <div id="container">
        <div class="inner">
			<h2>FAQ 등록</h2>
			<form action="/faq/enroll" method="post">                        
			<table width="100%" class="table02">
                <colgroup>
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <tbody id="tbody">
                    	 <tr>
                    	 	<td colspan="2"><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></td>
                        </tr>
                        <tr>
                            <th>제목<span class="t_red">*</span></th>
                            <td><input id="board_subject" name="title" value="" class="tbox01"/></td>
                        </tr>
                        <tr>
                            <th>작성자<span class="t_red">*</span></th>
                            <td><input id="board_writer" name="writer" readonly="readonly" value="${loginUsername}" class="tbox01"/></td>
                        </tr>
                        <tr>
                            <th>내용<span class="t_red">*</span></th>
                            <td><textarea id="board_content" name="content" cols="10" rows="5" class="textarea01"></textarea></td>
                        </tr>
                    </tbody>
                </table>    
    <div class="btn_right mt15">
          <button class="btn black mr5">등록하기</button>
    </div>
</form>
</div> 
</div>
</div>
</body>
</html>