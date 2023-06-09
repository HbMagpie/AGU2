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
<h2>Notice 수정/삭제</h2>
	<form id="modifyForm" action="/notice/modify" method="post">
		<table width="100%" class="table02">
                <colgroup>
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <tbody id="tbody">
                    	 <tr>
                    	 	<td colspan="2"><strong><span class="t_red">*</span> 표시는 수정 가능한 항목입니다.</strong></td>
                        </tr>
                        <tr>
                            <th>게시판 번호</th>
                            <td><input id="board_bno" name="bno" readonly="readonly" class="tbox01" value='<c:out value="${pageInfo.bno}"/>' ></td>
                        </tr>
                        <tr>
                            <th>제목<span class="t_red">*</span></th>
                            <td><input id="board_subject" name="title" class="tbox01" value='<c:out value="${pageInfo.title}"/>'></td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td><input id="board_writer" name="writer" readonly="readonly" class="tbox01" value='<c:out value="${pageInfo.writer}"/>'></td>
                        </tr>
                        <tr>
                            <th>내용<span class="t_red">*</span></th>
                            <td><textarea id="board_content" name="content" cols="10" rows="5" class="textarea01"><c:out value="${pageInfo.content}"/></textarea></td>
                        </tr>
                         
                    </tbody>
                </table>  
                
                <!-- 관리자만 공지사항 등록,삭제,수정 가능 -->
				<c:if test="${loginAdminid != null}">
					 <div class="btn_right mt15">
						<a class="btn black mr5" id="list_btn">목록으로</a> 
				        <a class="btn black mr5" id="modify_btn">수정완료</a>
				        <a class="btn black mr5" id="delete_btn">삭제하기</a>
				        <a class="btn black mr5" id="cancel_btn">수정취소</a>
					</div>
				</c:if>                	
	
	</form>
	<form id="infoForm" action="/notice/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
	</form>

</div>
    </div>
</div>
	
<script>
	let form = $("#infoForm");     // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");  // 페이지 데이터 수정 from
	
	/* 목록 페이지 이동 버튼 */
	$("#list_btn").on("click", function(e){
	    form.find("#bno").remove();
	    form.attr("action", "/notice/list");
	    form.submit();
	});
	
	/* 수정 하기 버튼 */
	$("#modify_btn").on("click", function(e){
	    mForm.submit();
	});
	
	/* 취소 버튼 */
	$("#cancel_btn").on("click", function(e){
	    form.attr("action", "/notice/get");
	    form.submit();
	});    
	
	/* 삭제 버튼 */
    $("#delete_btn").on("click", function(e){
        form.attr("action", "/notice/delete");
        form.attr("method", "post");
        form.submit();
    });
</script>

</body>
</html>