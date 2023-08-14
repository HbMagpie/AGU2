<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="/resources/css/styles.css" rel="stylesheet" />
	<link href="/resources/css/admin/join.css" rel="stylesheet" />
</head>
<body>
<!-- header 영역 -->
		<!-- header 시작 -->
		<%@include file="../user/nav.jsp" %>
		<!-- header 끝 -->
<div class="container mb-3">
	<form name="joinForm" id="joinForm" method="post">
		<table id="container">
			<tr>
				<td id="result" colspan="2"></td>
			</tr>			
			<tr>
				<th><label for="adminemail">아이디</label></th>
				<td><input type="text" name="adminemail" id="adminemail" placeholder="example@000.com" oninput="checkId()">
				<br><span class="idCheck" id="idCheck"></span></td>
			</tr>
			<tr>
				<th><label for="adminpw">비밀번호</label></th>
				<td><input type="password" name="adminpw" id="adminpw" placeholder="8자리 이상 써주세요" oninput="checkPw()">
				<br><span class ="pwCheck"></span></td>
			</tr>
			<tr>
				<th><label for="adminpw_re">비밀번호 확인</label></th>
				<td><input type="password" name="adminpw_re" id="adminpw_re" oninput="checkPW()">
				<br><span class="pwRe"></span></td>
			</tr>
			<tr>
				<th><label for="adminname">이름</label></th>
				<td><input type="text" name="adminname" id="adminname"></td>
			</tr>
			<tr class="zipcode_area">
				<th>우편번호</th>
				<td>
					<input readonly name="postnum" type="text" id="postnum" placeholder="우편번호"><input type="button" onclick="DaumPostcode()" value="우편번호 찾기">
				</td>
			</tr>
			<tr class="addr_area">
				<th>주소</th>
				<td><input readonly name="addr" type="text" id="addr" placeholder="주소"></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input name="detailaddress" type="text" id="detailaddress" placeholder="상세주소"></td>
			</tr>
			<tr>
				<th>참고항목</th>
				<td><input readonly name="seealso" type="text" id="seealso" placeholder="참고항목"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" id="joinSubmit" value="가입 완료">
				</th>
			</tr>
		</table>
	</form>
</div>
	<form id="phoneNumber" action="/admin/message">
	</form>
	 <!-- Footer-->
        <footer>
            <div class="container"><p class="m-0 text-center text-white" style="color:#000000 !important;">Copyright ⓒ All Rights Reserved By AGU</p></div>
        </footer>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/join.js"></script>
</body>
</html>







