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
			<h2>FAQ 등록</h2>
			<form action="/faq/enroll" method="post">                        
			<table width="100%" class="table02">
                <colgroup>
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <tbody id="tbody">
                    	 <tr>
                    	 	<td colspan="2"><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></td>
                        </tr>
                        <tr>
                            <th>제목<span class="t_red">*</span></th>
                            <td><input id="board_subject" name="title" value="" class="tbox01"/></td>
                        </tr>
                        <tr>
                            <th>작성자<span class="t_red">*</span></th>
                            <td><input id="board_writer" name="writer" readonly="readonly" value="${loginUserid}" class="tbox01"/></td>
                        </tr>
                        <tr>
                            <th>내용<span class="t_red">*</span></th>
                            <td><textarea id="board_content" name="content" cols="10" rows="5" class="textarea01"></textarea></td>
                        </tr>
                    </tbody>
                </table>    
    <div class="btn_right mt15">
          <button class="btn black mr5">등록하기</button>
    </div>
</form>
</div> 
</div>
</div>
</body>
</html>