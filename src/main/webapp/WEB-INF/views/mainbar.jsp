<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>mainPage</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- fonts -->
<link href="https://fonts.googleapis.com/css?family=Heebo|Noto+Sans+KR"
	rel="stylesheet">

<!-- mainbar.css -->
<link href="/resources/css/mainbar.css" rel="stylesheet">

</head>

<body>
	<!-- Navigation -->
	<header class="header-area nvb-fade" id="header">
		<nav class="nvb">
			<a class="nvb-brand" id="nvbBrand" href="/login/userinfo">Metanet</a> <a
				class="nvb-toggler" id="toggleBtn"><i class="fa fa-bars"></i></a>
			<div class="nvb-m" id="menu">
				<c:if test="${member != null}">
					<div class="nav-item">
						<a class="nav-link" id="nvbApply"
							href="/login/employee/applyforvacation">휴가 신청</a>
					</div>
					<div class="nav-item">
						<a class="nav-link" id="nvbPeopleList"
							href="/login/teamnanager/applicantlist">신청자 목록</a>
					</div>
					<div class="nav-item">
						<a class="nav-link" id="nvbVacationManage" href="/login/vmanager/annual">연차
							관리</a>
					</div>
					<div class="nav-item">
						<a class="nav-link" id="nvbVacationList"
							href="/login/vmanager/vmanagelist">사용 목록</a>
					</div>
					<div class="nav-item">
						<a class="nav-link" id="nvbSignup" href="/login/signup">회원 등록</a>
					</div>
					<div class="nav-item">
						<a class="nav-link" id="nvbSignup" href="/login/account/registration">회원 목록</a>
					</div>
					
				
					
					<div class="nav-item">
						<a class="nav-link" id="nvbLogout"
							href="javascript:{document.getElementById('logout').submit()}">logout</a>
					</div>
					<form id="logout" method="POST" action="/logout">
						<input type="hidden" />
					</form>
				</c:if>
				<c:if test="${member == null}">
					<!-- 사용하다 중간에 session 정보가 날라갔을 경우 -->
					<div class="nav-item">
						<a class="nav-link" id="nvbLogin" href="/login">로그인</a>
					</div>
				</c:if>
			</div>
		</nav>
	</header>
</body>
<script src="<c:url value="/resources/js/mainbar.js" />"></script>

</html>
