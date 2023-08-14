<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AGU</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />

<link href="/resources/css/styles.css" rel="stylesheet"/>
<link rel="stylesheet" href="/resources/css/main.css"/>
<style>
	.heading{
		color:#000000;
	}
	.loginForm{
		width:50%;
		margin:0 auto;
	}
	.loginForm h3{
		float:left;
		width:30%;
		color:#000000;
		line-height: 3.24rem;
	}
	.loginForm input[type=text], .loginForm input[type=password]{
		float:right;
		width:70%;
	}
	.loginForm>.col-12::after{
		display:block;
		content:"";
		height:50px;
		clear:both;
	}
</style>
</head>
<body style="background-color: rgb(245,246,247);">
<c:if test="${f != null}">
	<script>
		alert("로그인에 실패하였습니다. 아이디와 비밀번호를 다시 확인해주세요");
	</script>
</c:if>
 <!-- header 영역 -->
		<!-- header 시작 -->
		<%@include file="../user/nav.jsp" %>
		<!-- header 끝 -->
	<div id="main">
				<div class="wrapper style1 special">
					<div class="inner">
						<h2 class="heading alt"></h2>
						<br>
						<form class="loginForm" name="loginForm" id="loginForm" action="/admin/login" method="post">
							<div class="col-12">
								<h3>관리자 아이디</h3>
								<input type="text" name = "adminemail">							
							</div>
							<div class="col-12">
								<h3>관리자 비밀번호</h3>
								<input type="password" name = "adminpw">							
							</div>
							<div class="col-12" style="text-align: center">
								<input type="submit" value="로그인" class="primary">
							</div>
						</form>
					</div>
				</div>
			</div>
	
	<!-- Footer-->
    <footer>
        <div class="container"><p class="m-0 text-center text-white" style="color:#000000 !important;">Copyright ⓒ All Rights Reserved By AGU</p></div>
    </footer>
</body>
<script src="/resources/js/scripts.js"></script>
<script>
</script>
</html>