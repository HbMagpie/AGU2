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
<link href="/resources/css/board/common.css" rel="stylesheet" />
</head>
<body>


<h1>Notice</h1>

<div class="table_wrap">
	<a href="/notice/enroll" class="top_btn">게시판 등록</a>
	<table class="table01">
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
			</tr>
		</thead>
			<c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.bno}"/></td>
                <td>
                	<a class="move" href='<c:out value="${list.bno}"/>'>
                        <c:out value="${list.title}"/>
                    </a>
                </td>
                <td><c:out value="${list.writer}"/></td>
                <td><c:out value="${list.regdate}"/></td>
                <td><c:out value="${list.updateDate}"/></td>
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
    
</div>

<script>
$(document).ready(function(){

    let result =  '<c:out value="${result}"/>'
    
	checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            reutrn;
        }
        
        if(result === "enrol success"){
            alert("등록이 완료되었습니다.");
        }
        
        if(result === "modify success"){
            alert("수정이 완료되었습니다.");
        }
        
        if(result === "delete success"){
            alert("삭제가 완료되었습니다.");
        }
        
    }   

});

let moveForm = $("#moveForm");

$(".move").on("click", function(e){
    e.preventDefault();
    
    moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
    moveForm.attr("action", "/notice/get");
    moveForm.submit();
});

$(".pageInfo a").on("click", function(e){
	 
    e.preventDefault();
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.attr("action", "/notice/list");
    moveForm.submit();
        
});

</script>

</body>
</html>