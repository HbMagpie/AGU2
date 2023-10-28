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
<!-- nav 시작 -->
<%@include file="../admin/nav.jsp" %>
<!-- nav 끝 -->

<div id="wrap">
    <div id="container">
        <div class="inner">
<h2>FAQ</h2>
	<table width="100%" class="table01">
		<colgroup>
             <col width="10%" />
             <col width="25%" />
             <col width="10%" />
             <col width="15%" />
             <col width="20%" />
        </colgroup>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
			</tr>
		</thead>
		<tbody id="tbody">
        </tbody>   
        
			<c:forEach items="${list}" var="faq">
            <tr>
            	<td><c:out value="${faq.bno}"/></td>
            	
                <td>
                	<a class="move" href="<c:out value='${faq.bno}'/>">
        				<c:out value="${faq.title}"/>
                    </a>
                </td>
                <td><c:out value="${faq.writer}"/></td>
                <td><c:out value="${faq.regdate}"/></td>
                <td><c:out value="${faq.updateDate}"/></td>
            </tr>
            <!-- FAQ 아이템에 대한 답변을 여기에 추가 -->
        <c:if test="${not empty faq.reply}">
        <tr>
            <td><c:out value="${faq.reply.bno}"/></td>
            <td>
                <a class="r_move" href="${faq.reply.bno}">
                    <c:out value="${faq.reply.title}"/>
                </a>
            </td>
            <td><c:out value="${faq.reply.writer}"/></td>
            <td><c:out value="${faq.reply.regdate}"/></td>
            <td><c:out value=""/></td>
        </tr>
        </c:if>
        </c:forEach>
	</table>
	<div class="pageInfo_wrap" >
        <div class="pageInfo_area">
        	<ul id="pageInfo" class="pageInfo">
        	
        		<!-- 이전페이지 버튼 -->
                <c:if test="${pageMaker.prev}">
                    <li class="custom-pageInfo-btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                </c:if>
                
        		<!-- 각 번호 페이지 버튼 -->
            	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            		<li class="custom-pageInfo-btn ${pageMaker.cri.pageNum == num ? 'active' : ''}"><a href="${num}">${num}</a></li>
            	</c:forEach>
            	
            	<!-- 다음페이지 버튼 -->
                <c:if test="${pageMaker.next}">
                    <li class="custom-pageInfo-btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                </c:if> 	
 			</ul>
        </div>
      </div>
       <form id="moveForm" method="get">    
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">  
    </form>
    
   				 <!-- 회원만 질문 가능 -->
				<c:if test="${loginUserid != null}">
					<div class="btn_right mt15">
       					  <a href="/faq/enroll" class="btn black mr5">작성하기</a>
   					 </div>
				</c:if>

  </div> 
</div>
</div>

<script>
$(document).ready(function(){

    let result =  '<c:out value="${result}"/>'
    
	checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            return;
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
    moveForm.attr("action", "/faq/get");
    moveForm.submit();
});

$(".pageInfo a").on("click", function(e){
	 
    e.preventDefault();
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    moveForm.attr("action", "/faq/list");
    moveForm.submit();
        
});

$(".r_move").on("click", function(e){
    e.preventDefault();
    
    moveForm.append("<input type='hidden' name='reply_id' value='"+ $(this).attr("href")+ "'>");
    moveForm.attr("action", "/faq/getReply");
    moveForm.submit();
});

</script>

</body>

</html>