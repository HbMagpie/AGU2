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
	<form id="deleteForm" action="/user/delete" method="post">
	<table width="100%" class="table01">
		<colgroup>
             <col width="10%" />
             <col width="10%" />
             <col width="10%" />
             <col width="10%" />
             <col width="10%" />
             <col width="10%" />
             <col width="10%" />
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
	            <td><a class="btn black mr5" id="delete_btn">삭제</a></td>
			</tr>
      	  </c:forEach>        	
	</table>
	<div class="pageInfo_wrap" >
        <div class="pageInfo_area">
        	<ul id="pageInfo" class="pageInfo">
        	
        		<!-- 이전페이지 버튼 -->
                <c:if test="${pageMaker.prev}">
                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                </c:if>
                
        		<!-- 각 번호 페이지 버튼 -->
            	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            		<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
            	</c:forEach>
            	
            	<!-- 다음페이지 버튼 -->
                <c:if test="${pageMaker.next}">
                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                </c:if> 	
 			</ul>
        </div>
      </div>
     </form>
       <form id="moveForm" method="get">    
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">  
    </form>
  </div> 
</div>
</div>

<script>

let dForm = $("#deleteForm");  // 페이지 데이터 수정 from

$(document).ready(function() {

	let result = '<c:out value="${result}"/>'

	checkAlert(result);

	function checkAlert(result) {

		if (result === '') {
			reutrn;
		}

		if (result === "delete success") {
			alert("삭제가 완료되었습니다.");
		}

	}

});

let moveForm = $("#moveForm");


$(".pageInfo a").on("click", function(e) {

	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/user/userMng");
	moveForm.submit();

});

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
    form.attr("action", "/user/delete");
    form.attr("method", "post");
    form.submit();
});

</script>


</body>

</html>