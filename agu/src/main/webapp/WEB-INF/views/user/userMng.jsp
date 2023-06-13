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
<link href="/resources/css/board/notice.css" rel="stylesheet" />
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!-- nav 시작 -->
<%@include file="../admin/nav.jsp" %>
<!-- nav 끝 -->

<div id="wrap">
    <div id="container">
        <div class="inner">
<h2>회원 관리</h2>
	<table width="100%" class="table01">
		<colgroup>
             <col width="10%" />
             <col width="10%" />
             <col width="10%" />
             <col width="30%" />
             <col width="10%" />
             <col width="10%" />
             <col width="5%" />
        </colgroup>
		<thead>
			<tr>
				<th class="useremail_width">이메일</th>
				<th class="username_width">이름</th>
				<th class="postnum_width">우편 번호</th>
				<th class="addr_width">주소</th>
				<th class="detailaddress_width">상세주소</th>
				<th class="seealso_width">참고항목</th>
				<th>회원 삭제</th>
			</tr>
		</thead>
		<tbody id="tbody">
        </tbody>   
        
			<c:forEach items="${list}" var="list">
            <tr>
            	<td><c:out value="${list.useremail}"/></td>
                <td><c:out value="${list.username}"/></td>
                <td><c:out value="${list.postnum}"/></td>
                <td><c:out value="${list.addr}"/></td>
                <td><c:out value="${list.detailaddress}"/></td>
                <td><c:out value="${list.seealso}"/></td>
                <td>
                     <div class="text-center"><a class="btn black mr5" href="/user/userDelete?useremail=${list.useremail}">삭제</a></div>
                </td>
			</tr>
      	  </c:forEach>        	
	</table>
  </div> 
</div>
</div>

</body>

</html>