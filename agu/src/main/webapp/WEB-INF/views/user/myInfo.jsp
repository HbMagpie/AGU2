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

<link href="/resources/css/styles.css" rel="stylesheet" />
<link href="/resources/css/user/myinfo.css" rel="stylesheet" />
</head>
<body>
       <!-- header 영역 -->
		<!-- header 시작 -->
		<%@include file="../user/nav.jsp" %>
		<!-- header 끝 -->
	<div id="wrap" class="wrap shoppingid">
		<header class="header" role="banner">
			<div class="header_subindex">
				<div class="profile_area">
					<div class="profile_inner">
						<a href="#" class="photo">
							<img src="https://static.nid.naver.com/images/web/user/default.png" width="84" height="84">
						</a>
						<div class="profile">
							<p class="username">${loginUsername}</p>
							<p class="useremail">${loginUserid}</p>
						</div>
					</div>
				</div>
			</div>
			<div id="headerLeft" class="header_left" aria-hidden="false">
				<ul class="left_menu" role="menu">
					<li>
						<a href="/user/profile" class="left_item" role="menuitem" aria-current="ture">
							<div class="menu_text on">내 프로필</div>
						</a>
					</li>
					<li>
						<a href="/user/profile" class="left_item" role="menuitem" aria-current onclick="return change();">
							<div class="menu_text">비밀번호 변경</div>
						</a>
					</li>
					<li>
						<a href="/user/profile" class="left_item" role="menuitem" aria-current>
							<div class="menu_text">내 상품보기</div>
						</a>
					</li>
					<li>
						<a href="/user/profile" class="left_item" role="menuitem" aria-current>
							<div class="menu_text">회원 탈퇴</div>
						</a>
					</li>
				</ul>
			</div>
		</header>	
		<div id="container" class="container">
			<div id="content" class="content">
				<div class="subindex_wrap" role="main">
					<div class="subindex_item">
						<div class="subindex_greenbox">
							<div class="myprofile">
								<div class="info_title">
									<h3 class="title_text">기본 정보</h3>
								</div>
								<ul class="myinfo_area">
									<li>
										<div class="myphoto">
											<img src="https://static.nid.naver.com/images/web/user/default.png" width="56" height="56">
										</div>
									</li>
									<li>
										<div class="myaccount">
											<div class="myname">
												<div class="name_text">${loginUsername}</div>
												<button type="button" class="btn_edit">
													<span class="text">이름 변경</span>
												</button>
											</div>
											<div class="myaddress">${loginUserid}</div>
										</div>
									</li>
								</ul>
							</div>
							<ul class="subindex_row">
								<li>
									<div class="row_item mail">
										<span class="item_text">이메일 : ${loginUserid}</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="subindex_item">
						<div class="subindex_onebox">
							<div class="onebox_title desc">
								<h2 class="subindex_title">내 주소 보기</h2>
							</div>
							<a href="#" class="link_right">
								<span class="case">보러가기</span>
							</a>
							<div class="subindex_desc">회원가입시 입력한 주소를 관리할 수 있어요.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function change(){
		this.preventDefault();
		$(".left_item").find("div").removeClass("on");
		this.find("div").addClass("on");
		return false;
	}
</script>
</html>















