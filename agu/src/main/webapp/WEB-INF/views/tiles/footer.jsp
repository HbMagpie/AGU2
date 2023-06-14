<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AGU</title>
</head>

<style>
/* Start! . footer 부분 */
footer {
	width : 1200px;
	margin : 0 auto;
	color:#b0b0b0;
	text-align: center;	
}

footer > table {
	width: 1200px;
	height: 300px;
	color: #666666;
}

/* End! . footer 부분 */
</style>

<body>    
 <footer>
 <hr color="#6aa888">
 <table>
	<tr>
	  <td style="cursor:pointer;" onClick="location.href='/'">Home</td>
	  <td></td>
	  <td><p style="text-align:right;">은행정보 : 국민 11111111-11-111111 / 예금주 : (주)AGU / P.000-0000-0000, E.agu123@naver.com</p></td>
	</tr>
	<tr>
	  <td style="cursor:pointer;" onClick="location.href='/notice/list'">공지사항</td>
	  <td></td>  
	  <td><p style="text-align:right;">통신판매업 신고번호 : 1111-ㅇㅇ-1111호[사업자정보확인]</p></td>
	</tr>
	<tr>	 
	  <td style="cursor:pointer;"onclick="window.open('/admin/pers', '개인정보 취급방침', 'width=500, height=600')">개인정보 취급방침</td>  
	  <td></td>
	  <td><p style="text-align:right;">대표이사 : 아구, 주소 : 서울특별시 ㅇㅇ구 ㅇㅇ동 ㅇㅇ빌딩 ㅇ층 ㅇㅇㅇ호</p></td>
	</tr>
	<tr>
	  <td style="cursor:pointer;" onClick="window.open('/admin/use', '개인정보 취급방침', 'width=500, height=600')">이용 약관</td>
	  <td></td>
	  <td><p style="text-align:right;">반품, 교환 수거신청 : CJ대한통운 서울특별시 ㅇㅇ구 ㅇㅇ동</p></td>
	</tr>
 </table>
  <br>
  <p>Copyright ⓒ All Rights Reserved By AGU<p>
  <br>
</footer>
<!-- End! footer 부분 -->
</body>
</html>