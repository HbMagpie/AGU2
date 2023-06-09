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
			<h2>Notice 상세</h2>
			<table width="100%" class="table02">
                <colgroup>
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <tbody id="tbody">
                        <tr>
                            <th>제목<span class="t_red">*</span></th>
                            <td><input id="board_subject" name="title" readonly="readonly" class="tbox01" value='<c:out value="${pageInfo.title}"/>'></td>
                        </tr>
                        <tr>
                            <th>작성자<span class="t_red">*</span></th>
                            <td><input id="board_writer" name="writer" readonly="readonly" class="tbox01" value='<c:out value="${pageInfo.writer}"/>'></td>
                        </tr>
                        <tr>
                            <th>내용<span class="t_red">*</span></th>
                            <td><textarea id="board_content" name="content" readonly="readonly" cols="10" rows="5" class="textarea01"><c:out value="${pageInfo.content}"/></textarea></td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- 관리자만 공지사항 등록,삭제,수정 가능 -->
				<c:if test="${loginAdminid != null}">
					 <div class="btn_right mt15">
         				 <button class="btn black mr5" id="list_btn">목록으로</button>
         				 <button class="btn black mr5" id="modify_btn">수정/삭제</button>
    				</div>
				</c:if>
				<c:if test="${loginUserid != null}">
					 <div class="btn_right mt15">
         				 <button class="btn black mr5" id="list_btn">목록으로</button>
    				</div>
				</c:if>  	
				   
	<form id="infoForm" action="/notice/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
	</form>
 </div>
    </div>
</div>
	
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/notice/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/notice/modify");
		form.submit();
	});	
</script>

</body>
</html>