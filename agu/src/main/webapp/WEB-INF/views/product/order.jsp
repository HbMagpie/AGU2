<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AGU</title>
<link rel="stylesheet" href="/resources/css/order.css">
<link rel="stylesheet" href="/resources/css/styles.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <!-- 다음주소 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
     
    </head>
    <style>
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
* {font-family: 'SUITE-Regular';}
</style>
    <body>
        <!-- header 영역 -->
		<!-- header 시작 -->
		<%@include file="../user/nav.jsp" %>
		<!-- header 끝 -->	
				
			<div class="clearfix"></div>
		<div class="content_area">
			
			<div class="content_subject"><span>장바구니</span></div>

			<div class="content_main">
				<!-- 회원 정보 -->
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">주문자</th>
								<td style="width: *">${loginUsername} | ${loginUserid}</td>
							</tr>
						</tbody>
					</table>
				</div>				
				
				<!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #3c3838;">주소록</button>
						<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											${loginUsername}
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											${postnum} ${addr}<br>${detailaddress}
											<input class="selectAddress" value="T" type="hidden">
											<input class="addressee_input" value="${loginUsername}" type="hidden">
											<input class="address1_input" type="hidden" value="${postnum}">
											<input class="address2_input" type="hidden" value="${addr}">
											<input class="address3_input" type="hidden" value="${detailaddress}">																					
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="addressInfo_input_div addressInfo_input_div_2">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input class="addressee_input">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input class="selectAddress" value="F" type="hidden">
											<input class="address1_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
											<input class="address2_input" readonly="readonly"><br>
											<input class="address3_input" readonly="readonly">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>				
				<!-- 상품 정보 -->
				<div class="orderGoods_div">
					<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
					</div>
					<!-- 상품 테이블 -->
					<table class="goods_subject_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>
						<tbody>
							<tr>
								<th>이미지</th>
								<th>상품 정보</th>
								<th>판매가</th>
							</tr>
						</tbody>
					</table>
					<table class="goods_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>					
						<tbody>
							<c:forEach items="${orderList}" var="ol">
								<tr>
									<td>
										<div class="image_wrap" data-productnum="${ol.fileList[0].productnum}" data-filename="${ol.fileList[0].filename}" data-filerealname="${ol.fileList[0].filerealname}" data-path="${ol.fileList[0].fileurl}" data-safefile="${ol.fileList[0].safefile}">
											<img>
										</div>
									</td>
									<td>${ol.productname}</td>
									<td class="goods_table_price_td">
										<fmt:formatNumber value="${ol.productprice}" pattern="#,### 원" /> | 수량 ${ol.productCount}개
										<br><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
										
										<input type="hidden" class="individual_productprice_input" value="${ol.productprice}">
										<input type="hidden" class="individual_productCount_input" value="${ol.productCount}">
										<input type="hidden" class="individual_totalPrice_input" value="${ol.productprice * ol.productCount}">
										<input type="hidden" class="individual_productnum_input" value="${ol.productnum}">
									</td>
								</tr>							
							</c:forEach>

						</tbody>
					</table>
				</div>		
						
				<!-- 주문 종합 정보 -->
				<div class="total_info_div">
					<!-- 가격 종합 정보 -->
					<div class="total_info_price_div">
						<ul>
							<li>
								<span class="price_span_label">상품 금액</span>
								<span class="totalPrice_span">0</span>원
							</li>
							<li>
								<span class="price_span_label">배송비</span>
								<span class="delivery_price_span">3000</span>원
							</li>
																
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">
									0
									</span>원
								</strong>
							</li>
						</ul>
					</div>
					<!-- 버튼 영역 -->
					<div class="total_info_btn_div">
						<a class="order_btn">결제하기</a>
					</div>
				</div>				
				
			</div>			

			<!-- 주문 요청 form -->
			<form class="order_form" action="/order" method="post">
				<!-- 주문자 회원번호 -->
				<input name="useremail" value="${loginUserid}" type="hidden">
				<!-- 주소록 & 받는이-->
				<input name="addressee" type="hidden">
				<input name="postnum" type="hidden">
				<input name="addr" type="hidden">
				<input name="detailaddress" type="hidden">
				<!-- 상품 정보 -->
			</form>
			
		</div>
		
	<!-- Footer 영역 -->
		<!-- Footer 시작 -->
		<%@include file="../tiles/footer.jsp" %>
		<!-- Footer 끝 -->
<script>

$(document).ready(function(){
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
	
		const bobj = $(obj);
		
		
		if(bobj.data("productnum")){
			const fileurl = bobj.data("path");
			const filename = bobj.data("filename");
			const safefile = bobj.data("safefile");
			
			const fileCallPath = encodeURIComponent(filename);
			
			$(this).find("img").attr('src', '/product/display?filename=' + fileCallPath).attr('alt', '상품 이미지');
		} else {
			$(this).find("img").attr('src', '/resources/img/aa.png');
		}
		
	});	
	
	
});


/* 주소입력란 버튼 동작(숨김, 등장) */
function showAdress(className){
	/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
	
	/* 버튼 색상 변경 */
		/* 모든 색상 동일 */
			$(".address_btn").css('backgroundColor', '#555');
		/* 지정 색상 변경 */
			$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
	/* selectAddress T/F */
		/* 모든 selectAddress F만들기 */
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
		/* 선택한 selectAdress T만들기 */
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");		
		
}

/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}


/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	
	$(".goods_table_price_td").each(function(index, element){
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_productCount_input").val());
	});	

	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
	finalTotalPrice = totalPrice + deliveryPrice;	
		
	
	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".goods_kind_div_count").text(totalCount);
	// 배송비
	$(".delivery_price_span").text(deliveryPrice.toLocaleString());	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());			
	
}

var Productnames = [];

<c:forEach items="${orderList}" var="ol">
    var Productname = "${ol.productname}";
    Productnames.push(Productname);
</c:forEach>

/* 주문 요청 */

$(".order_btn").on("click", function() {

	// 주문 버튼 클릭 시에 finalTotalPrice 값
	let finalTotalPrice = parseFloat($(".finalTotalPrice_span").text().replace(',', '')); // 쉼표 제거 후 숫자로 변환
	let Productname = "${ol.productname}";
	/* 주소 정보 & 받는이 */
    var IMP = window.IMP;
    IMP.init('imp55665285');

    $(".addressInfo_input_div").each(function(i, obj) {
        if ($(obj).find(".selectAddress").val() === 'T') {
            $("input[name='addressee']").val($(obj).find(".addressee_input").val());
            $("input[name='postnum']").val($(obj).find(".address1_input").val());
            $("input[name='addr']").val($(obj).find(".address2_input").val());
            $("input[name='detailaddress']").val($(obj).find(".address3_input").val());

            // 주소 정보 설정 후 아임포트 결제 요청
            IMP.request_pay({
                // 결제 정보 설정
                pg: "html5_inicis.INIpayTest",
                pay_method: "card",
                merchant_uid: new Date().getTime() + '_' + Math.random().toString(36).substring(7),
                name: Productnames.join(', '),
                amount: finalTotalPrice,
                buyer_email : "test22@naver.com",
                buyer_name: "김테스트",
                buyer_tel : "010-1234-5678",
                buyer_addr: $("input[name='addr']").val(),
                buyer_postcode: $("input[name='postnum']").val(),
                m_redirect_url: "main.jsp",
            }, 
            function(rsp) {
                if (rsp.success) {
                    console.log(rsp);
                    // 결제검증
                    $.ajax({
                        type : "POST",
                        url : "/verifyIamport/" + rsp.imp_uid 
                    }).done(function(data) {
                        console.log(data);
                        // 위의 rsp.paid_amount 와 data.response.amount를 비교한 후 import 서버 검증
                        if(rsp.paid_amount == data.response.amount){
                            alert("결제 및 결제검증완료");
                         
                         // 주문 정보 설정 후 총 가격 갱신
                            setTotalInfo();
                         
                            /* 상품정보 서버 전송 */
                            let form_contents = ''; 
                            $(".goods_table_price_td").each(function(index, element){
                                let productnum = $(element).find(".individual_productnum_input").val();
                                let productCount = $(element).find(".individual_productCount_input").val();
                                let productnum_input = "<input name='orders[" + index + "].productnum' type='hidden' value='" + productnum + "'>";
                                form_contents += productnum_input;
                                let productCount_input = "<input name='orders[" + index + "].productCount' type='hidden' value='" + productCount + "'>";
                                form_contents += productCount_input;
                            });    
                            $(".order_form").append(form_contents);

                            /* 서버 전송 */
                            $(".order_form").submit();
                            
                            
                        } else {
                            alert("결제 실패" + rsp.error_msg);
                        }
                    });
                }
            });
        }
    });
});


</script>

</body>
</html>