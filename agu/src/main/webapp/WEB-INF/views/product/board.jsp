<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AGU</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
 <link href="/resources/css/styles.css" rel="stylesheet" />
 <link href="/resources/css/product/board.css" rel="stylesheet" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css">
<style>
		.zipModal{
			position: absolute;
			width: 100%;
			height: 100%;
			background: rgba(0,0,0,0.8);
			top:0;
			left:0;
			display:none;
		}
		.zipModal_body {
		  position: absolute;
		  top: 50%;
		  left: 50%;
		  padding: 190px;
		  background-color: rgb(255, 255, 255);
		  border-radius: 10px;
		  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		  transform: translateX(-50%) translateY(-50%);
		  z-index: 1;
		}
		input[type="text"]{
			border-color: rgba(144, 144, 144, 0.25);
			height: 3.25rem;
			appearance: none;
		    border-radius: 4px;
		    border: solid 1px;
		    color: inherit;
		    outline: 0;
		    padding: 2px;
		    text-align: center;
		    width:15%;
		    text-decoration: none;
		}
		input{
			font-family: 'SLEIGothicTTF';
		    font-weight: 300;
		    font-size: 1rem;
		    line-height: 2.15;
		}
		form > :last-child {
		    margin-bottom: 0;
		}
		.wrapper.special {
		    text-align: center;
		}
		.wrapper {
		    padding: 6rem 0 4rem 0;
		}
		.py-5 .bg-dark{
			margin-top:90px;
		}
		.zipnum.inputt{
			width:100%;
		}
		.reviewBTN{
			float : right;
			margin-right:10px;
		}
		.inlinereview{
			display:inline;
			width:80%;
		}
</style>
</head>
<body>
<!-- nav 시작 -->
<%@include file="../user/nav.jsp" %>
<!-- nav 끝 -->
        <div class="main">
        	<div class="container">
        		<div class="row margin-bottom-40">
        			<div class="col-md-9 col-sm-7">
        				<div class="product-page">
        					<div class="row">
        						<div class="col-md-6 col-sm-6">
        							<div class="product-main-img" style="position: relative; overflow:hidden;">
        								<img src="/resources/img/${filename}" class="img-responsive">
        							</div>
        						</div>
        						<div class="col-md-6 col-sm-6">
        							<h1>${product.productname}</h1>
        							<div class="price-availability-block clearfix">
        								<div class="price">
        									<strong>
        										${product.productprice}원
        									</strong>
        								</div>
        							</div>
        							<form>
        							<div id="container" class="container">
										<div id="content" class="content">
											<div class="subindex_wrap" role="main">
			        							<div class="subindex_item">
													<div class="subindex_onebox">
														<div class="onebox_title desc">
															<h2 class="subindex_title">내 주소 보기</h2>
														</div>
														<button type="button" class="link_right">
															<span class="case">보러가기</span>
														</button>>
														<div class="subindex_desc">구매 하시기전에 배송지를 설정해주세요!</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									</form>
									
	      						   <!-- 장바구니 담기 -->
        							<div class="button">
                            	<div class="button_quantity">
                            		주문수량
                            		<input type="text" class="quantity_input" value="1" size="4">
                            		<span>
                            			<button class="plus_btn">+</button>
                            			<button class="minus_btn">-</button>
                            		</span>            
                            	</div>
                            	<div class="button_set">
                            		<a class="btn_cart">장바구니 담기</a>
                            		<a class="btn_buy">바로구매</a>
                            	</div>
                            	</div>
                            	</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
        <div class="textarea-div">
        <textarea rows="5" cols="5" readonly style="word-break:break-all;width:100%;text-align:center;font-size:30px;">${product.productcontents}</textarea>
        </div>
     
        
        <!-- 리뷰 작성 -->  
		<button class="btm btn-primary" type="button" name="review" id="onReview" style="margin-top:20px;">리뷰 작성하기</button>
		<div class="product-page-content" id="review" >
			<ul id="myTap" class="nav nav-tabs">
				<li class="active">
					<a href="#" data-togle="tab">리뷰</a>
				</li>
			</ul>
			 <div class="tab-content" style="width:100%;">
				<div class="tab-pane fade in active">
				<c:forEach items="${review}" var="review">
					<div class="review-item clearfix">
						<div class="review-item-submitted">
							<strong>${review.username}</strong>
							<em>${review.regdate}</em>
						</div>
						<div class="reivew-item-content">
							<input class="inlinereview" value = "${review.reviewcontents}" readonly>
							<c:if test="${loginUsername == review.username}">
							<a href="${review.reviewnum}" class="reviewBTN del">삭제</a>
							<a href="#" class="reviewBTN mdf" id="mdf">수정</a>
							<a href="${review.reviewnum}" class="reviewBTN mdfOk" id="mdfOk" style="display:none;">수정 완료</a>
 							</c:if>
 							
 							<!-- 관리자는 리뷰 삭제만 가능 -->
 							<c:if test="${loginAdminid != null }">
 							<a href="${review.reviewnum}" class="reviewBTN del">삭제</a>
 							</c:if>
						</div>
					</div>
				</c:forEach>
					<form class="reviews-form" role="form" style="display:none;">
						<h2>리뷰 작성</h2>
						<div class="form-group">
							<label for="username">
								이름
								<span class="require"></span>
							</label>
							<input type="text" class="form-control" id="username" value="${loginUsername}" readonly style="width:14%;">
						</div>
						<div class="form-group">
							<label for="useremail">Email</label>
							<input type="text" value="${loginUserid}" id="useremail" readonly>
						</div>
						<div class="form-group">
							<label for="review">리뷰</label>
							<textarea class="form-control" rows="8" id="reviewTxt" style="word-break:break-all;width:100%;text-align:center;"></textarea>
						</div>
						<div class="padding-top-20">
							<button type="submit" class="btn btn-primary reviewBtn">작성하기</button>
						</div>
					</form>
				</div>
			</div>
			<!-- 주문 form -->
			<form action="/order/${loginUserid}" method="get" class="order_form">
				<input type="hidden" name="orders[0].productnum" value="${product.productnum}">
				<input type="hidden" name="orders[0].productCount" value="">
			</form>
		</div>
		<!-- Footer 시작 -->
		<%@include file="../tiles/footer.jsp" %>
		<!-- Footer 끝 -->
        
        <!-- 우편번호 Modal -->
        <form action="/" method="get" class="buyForm">
        </form>
        <div class="zipModal">
			<div class="zipModal_body">
				<div class="wrapper style1 special">
					<div class="inner">
					<form name="buy">
						<input type="hidden" value="${loginUserid}" name="useremail">
							<table class = "zipnum-container">
								<tr class="zipcode_area">
									<th>우편번호</th>
									<td>
										<input readonly class="zipnum inputt" name="postnum" type="text" id="postnum" value="${postnum}"><input type="button" onclick="DaumPostcode()" value="우편번호 변경하기">
									</td>
								</tr>
								<tr class="addr_area">
									<th>주소</th>
									<td><input readonly class="zipnum inputt" name="addr" type="text" id="addr" value="${addr}"></td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td><input class="zipnum inputt" name="detailaddress" type="text" id="detailaddress" value="${detailaddress}"></td>
								</tr>
								<tr>
									<th>참고항목</th>
									<td><input readonly class="zipnum inputt" name="seealso" type="text" id="seealso" value="${seealso}"></td>
								</tr>
								<tr>
									<th colspan="2">
										<input type="submit" id="zipSubmit" value="이 배송지로 받기">
										<input type="submit" id="zipCancle" value="나가기">
									</th>
								</tr>
							</table>
					</form>
					</div>
				</div>
			</div>
		</div>
</body>
<script src="/resources/js/daum.js"></script>
<script src="/resources/js/board.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script>
let postnum = $("#postnum").val();
let addr = $("#addr").val();
let seealsos = $("#seealso").val();
let detailaddress = $("detailaddress").val();
let useremail = "${loginUserid}";
let productnum = "${product.productnum}";
let productname = "${product.productname}";
let productprice = "${product.productprice}";
let username = "${loginUsername}";
let buyForm = $(".buyForm");

   
// 주소 보러가기 클릭시 미 로그인 상태라면 alert창 띄움
$(".link_right").on("click",function(e){
	let useremail = "${loginUserid}";
	
	if(useremail == ""){
		alert("로그인 후 이용해주세요");
		return false;
	}
	
//로그인 되어있다면 모달창 띄우기
		e.preventDefault();
		$(".zipModal").show();
	});

//모달창 나가기 클릭시 모달창을 닫아주면서 입력 된 값들을 초기로 돌려준다.
$("#zipCancle").on("click",function(e){
	e.preventDefault();
	$(".zipModal").hide();
	$("[name = 'postnum']").val("${postnum}");
	$("[name = 'addr']").val("${addr}");
	$("[name = 'detailaddress']").val("${detailaddress}");
	$("[name = 'seealso']").val("${seealso}");
});

//이 주소로 받기 클릭시 유효성검사를하고 모두 통과한다면 모달창을 닫아준다.
$("#zipSubmit").on("click",function(e){
	e.preventDefault();
	const zipForm = $(".zipForm");
	
	let npostnum = $("#postnum").val();
	let ndetailaddress = $("#detailaddress").val();

	if(postnum ==""){
    	alert("우편번호를 입력해주세요");
    }
    else if(detailaddress == ""){
    	alert("상세주소를 입력해주세요");
    }
    else{
    	$(".zipModal").hide();
    }
});

//리뷰 작성 버튼 클릭시 리뷰 작성 폼 보여주거나 닫기
let flaut = false;
$("#onReview").on("click",function(e){
	if(flaut == true){
		$(".reviews-form").hide();
		$("#reviewTxt").val("");		
		flaut = false;
	}
	else{
	flaut = true;
	e.preventDefault();
	$(".reviews-form").show();
	}
})

//작성하기 버튼 클릭시 
$(".reviewBtn").on("click",function(e){
	e.preventDefault();
	let reviewcontents = $("#reviewTxt").val();
	if(useremail == ""){
		alert("로그인 후 이용해주세요");
		return;
	}
	else if(reviewcontents == null){
		alert("내용을 입력해주세요");
		return;
	}
	buyService.addreview(
		{useremail:useremail, username:username, productnum:productnum, reviewcontents:reviewcontents},		
		function(result){
			if(result > 0){
				alert(result+"번 리뷰 작성 성공!");
				location.reload();
			}
		}
	);
});

//리뷰 삭제
$(".del").on("click",function(e){
	e.preventDefault();
	let reviewnum = $(this).attr('href');
	buyService.drop(
			reviewnum,
		function(result){
			if(result == "success"){
				alert(reviewnum+"번 리뷰 삭제 성공!");
				location.reload();
			}
		}
	)
})

//리뷰 수정 버튼 눌렀을 시 수정 버튼은 숨기고 수정 완료버튼 보여주기 
let mf = false;
$("#mdf").on("click",function(e){
	e.preventDefault();
	if(mf == true){
		alert("이미 수정중인 리뷰가 있습니다");
		return;
	}
	mf = true;
	$(".inlinereview").attr("readonly",false);
	$(this).hide();
	$(this).next().show();
})

//수정 완료 버튼
$("#mdfOk").on("click",function(e){
	e.preventDefault();
	mf == false;
	let reviewcontents = $(".inlinereview").val();
	let reviewnum = $(this).attr('href');
	 buyService.modify(
		{reviewcontents:reviewcontents, reviewnum:reviewnum},
		function(result){
			if(result=="success"){
				alert("리뷰를 수정 하였습니다.");
				$(".inlinereview").attr("readonly",true);
				$(this).show();
				$(this).prev().hide();
				location.reload();
			}
		} 
	)
})
	<!-- 장바구니 -->
    
    //수량 버튼 조작
    let quantity = $(".quantity_input").val();
    $(".plus_btn").on("click", function(){
    	$(".quantity_input").val(++quantity);
    });
    $(".minus_btn").on("click", function(){
    	if(quantity > 1){
    		$(".quantity_input").val(--quantity);
    	}
    });
    
  //서버로 전송할 데이터
    const form = {
    		useremail : '${loginUserid}',
    		productnum : '${product.productnum}',
    		productCount : ''
    }
    
    // 장바구니 추가 버튼
    $(".btn_cart").on("click", function(e){
    	
    	form.productCount = $(".quantity_input").val();
    	$.ajax({
    		url: '/cart/add',
    		type: 'POST',
    		data: form,
    		success: function(result) {
    			cartAlert(result);
    		}
    	})
    });
    
    function cartAlert(result) {
    	if(result == '0') {
    		alert("장바구니에 추가 하지 못하였습니다.");
    	} else if(result == '1'){
    		alert("장바구니에 추가되었습니다.");
    	} else if(result == '2'){
    		alert("이미 추가된 제품입니다");
    	} else if(result == '5'){
    		alert("로그인이 필요합니다.");
    	}
    }
//바로구매 클릭시 이벤트
   $(".btn_buy").on("click", function(){
		let productCount = $(".quantity_input").val();
		$(".order_form").find("input[name='orders[0].productCount']").val(productCount);
		$(".order_form").submit();
	});
   	
</script>
</html>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
