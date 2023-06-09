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
             <col width="25%" />
             <col width="15%" />
             <col width="15%" />
             <col width="20%" />
             <col width="15%" />
        </colgroup>
		<thead>
			<tr>
				<th class="useremail_width">이메일</th>
				<th class="username_width">이름</th>
				<th class="postnum_width">우편 번호</th>
				<th class="addr_width">주소</th>
				<th class="detailaddress_width">상세주소</th>
				<th class="seealso_width">참고항목</th>
			</tr>
		</thead>
		<tbody id="tbody">
        </tbody>   
        
			<c:forEach items="${list}" var="list">
            <tr>
            	<td><c:out value="${list.useremail}"/></td>
            	
                <td>
                	<a class="move" href='<c:out value="${list.useremail}"/>'>
                        <c:out value="${list.username}"/>
                    </a>
                </td>
                <td><c:out value="${list.postnum}"/></td>
                <td><c:out value="${list.addr}"/></td>
                <td><c:out value="${list.detailaddress}"/></td>
                <td><c:out value="${list.seealso}"/></td>
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
       <form id="moveForm" method="get">    
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">  
    </form>
		<!-- <div class="btn_right mt15">
       		 <a href="/notice/enroll" class="btn black mr5">작성하기</a>
   		</div> -->
  </div> 
</div>
</div>

<script>
	$(document).ready(function() {

		let result = '<c:out value="${result}"/>'

		checkAlert(result);

		function checkAlert(result) {

			if (result === '') {
				reutrn;
			}

			if (result === "enrol success") {
				alert("등록이 완료되었습니다.");
			}

			if (result === "modify success") {
				alert("수정이 완료되었습니다.");
			}

			if (result === "delete success") {
				alert("삭제가 완료되었습니다.");
			}

		}

	});

	let moveForm = $("#moveForm");

	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();

				moveForm.append("<input type='hidden' name='bno' value='"
						+ $(this).attr("href") + "'>");
				moveForm.attr("action", "/notice/get");
				moveForm.submit();
			});

	$(".pageInfo a").on("click", function(e) {

		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/notice/list");
		moveForm.submit();

	});
</script>

</body>

</html>