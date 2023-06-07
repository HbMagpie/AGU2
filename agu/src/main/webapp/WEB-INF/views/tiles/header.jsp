<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AGU</title>
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
<div id="wrap" class="wrap shoppingid">
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
                </div>
            </div>
        </nav>
</body>
</html>