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
        
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <link href="/resources/css/styles.css" rel="stylesheet" />
</head>
<style>
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
* {font-family: 'SUITE-Regular';}
</style>
<body>
 <c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">AGU</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/notice/list">Notice</a></li>
                        <li class="nav-item"><a class="nav-link" href="/faq/list">FAQ</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/">All Product</a></li>
                                <li><hr class="dropdown-divider" /></li> 
                                <li><a class="dropdown-item" href="/product/search?keyword=best">Best</a></li>                             
                                <li><a class="dropdown-item" href="/product/search?keyword=new">New</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=dress">Dress</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=outer">Outer</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=blouse">Blouse</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=tee">Tee</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=knit">Knit</a></li>
                                <li><a class="dropdown-item" href="/product/search?keyword=bottom">Bottom</a></li>
                            </ul>
                        </li>
                    </ul>
                    <c:if test="${loginUserid != null}">
                    	<form class="d-flex">
                    	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    		<li class="nav-item"><a href="/user/myInfo" class="nav-link">내정보</a></li>
                    		<li class="nav-item"><a href="/product/addproduct" class="nav-link">상품 등록</a></li>
                    		<li class="nav-item"><a href="/user/logout"class="nav-link">로그아웃</a></li>
                    	</ul>
                    	</form>
                    </c:if>
                    <c:if test="${loginUserid == null }">
                    	<script>
                    		alert("로그인 후 이용해주세요");
                    		history.go(-1);
                    	</script>
                    </c:if>
                    <c:if test="${f != null}">
                    	<script>
                    		alert("상품 등록 실패");
                    		return false;
                    	</script>
                    </c:if>
                </div>
            </div>
        </nav>
        <!-- nav 끝 -->
	<form id="formsub" action="/" style="margin-left:50px">	
		<table id="container">
			<br><br>
			<tr>
				<td id="result" colspan="2"></td>
			</tr>	
			<!-- 카테고리 리스트
			<tr>
				<div class="cate_wrap">
					<span>카테고리</span>
					<select class="cate">
						<option selected value="none">선택</option>
					</select>
				</div>
			</tr> -->
			<tr>
				<th><label for="catename">카테고리명</label></th>
				<td><input type="text" name="catename" id="catename" placeholder="카테고리명을 입력해주세요"> <a style="color:red; font-size:18px;"> ※ (Best, New, Dress, Outer, Blouse, Tee, Knit, Bottom) 중 택1</a></td>
			</tr>		
			<tr>
				<th><label for="productname">상품명</label></th>
				<td><input type="text" name="productname" id="productname" placeholder="상품명을 입력해주세요"><a style="color:red; font-size:18px;"> ※ 반드시 카테고리명을 포함해서 작성해주세요.</a> </td>
			</tr>	
			<tr>
				<th><label for="productprice">가격</label></th>
				<td><input type="text" name="productprice" id="productprice" placeholder="가격을 적어주세요"></td>
			</tr>
			<tr>
				<th><label for="productcontents">상품 정보</label></th>
				<td><textarea name="productcontents" id="productcontents" cols="50" rows="20"></textarea></td>
			</tr>
			<tr>
				<th><label for="useremail">작성자</label></th>
				<td><input type="text" name="useremail" id="useremail" value="${loginUserid}" readonly></td>
			</tr>
			<tr>
				<th><label for="files"> 이미지 파일</label></th>
				<td><input type="file" multiple  name="files" id="files">
				<div class="select_img"></div></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" id="submitButn" value="등록하기">
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
$(document).ready(function(){
	$("#submitButn").on("click",function(){
		var catename = $("#catename").val();
		var productname = $("#productname").val();
		var productcontents = $("#productcontents").val();
		var productprice = $("#productprice").val();
		var useremail = $("#useremail").val();
		var formData = new FormData(); 
		
		if(catename == ""){
			alert("카테고리명을 입력해주세요");
			return false;
		}
		else if(productname == ""){
			alert("상품명을 입력해주세요");
			return false;
		}
		else if(productprice == ""){
			alert("상품 가격을 입력해주세요");
			return false;
		}
		else if(isNaN(productprice) == true){
			alert("숫자만 입력해주세요");
			return false;
		}
		else if(productcontents == ""){
			alert("상품 내용을 입력해주세요");
			return false;
		}
		else{
			var inputFile = $("input[name='files']");
			var files = inputFile[0].files;
					
			for (var i = 0; i < files.length; i++) {
				formData.append("files",files[i]);
			}
			formData.append("catename",catename);
			formData.append("productname",productname);
			formData.append("productcontents",productcontents);
			formData.append("productprice",productprice);
			formData.append("useremail",useremail);
			console.log(formData);
			$.ajax({
				url: '/product/uploadFile',
				processData : false,
				contentType : false,
				data : formData,
				datatype : JSON,
				type : "POST",
				success : function(data){
					if(data == "f"){
						alert("파일 업로드 실패");
					}
					else{
						$("#formsub").submit();
					}
				}
			});
		}
	});
});

/*
	// JSON 변환 확인
	$(document).ready(function(){
	console.log('${cateList}');
}); */

/* $(document).ready(function(){
console.log(cateArray);
}); */

/* 카테고리 리스트
let cateList = JSON.parse('${cateList}');

let cateArray = new Array();
let cateObj = new Object();

let cateSelect = $(".cate");		

for(let i = 0; i < cateList.length; i++){

		cateObj = new Object();
		
		cateObj.catename = cateList[i].catename;
		cateObj.catenum = cateList[i].catenum;		
		
		cateArray.push(cateObj);				
	
}	



for(let i = 0; i < cateArray.length; i++){
	cateSelect.append("<option value='"+cateArray[i].catenum+"'>" + cateArray[i].catename + "</option>");
} */

</script>
</html>







