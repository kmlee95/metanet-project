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

</head>

<body>
	<%@ include file="../mainbar.jsp"%>
	<div class="container" style="margin-top: 10px;">
		<div class="card">
			<h1>유저 정보가 나타나는 페이지</h1>
			<a>번호 : ${member.bno}</a>
			<a>아이디 : ${member.id}</a>
			<a>패스워드 : ${member.password}</a>
			<a>이름 : ${member.name}</a>
			<a>등록날짜 : ${member.join_date}</a>
			<a>사원코드 : ${member.emp_code}</a>
			<a>휴대폰번호 : ${member.phone}</a>
			<a>부서 : ${member.org_code}</a>
			<a>직급 : ${member.emp_rank}</a>
			<a>인증확인 : ${member.certified_yn}</a>
		</div>
	</div>
</body>
</html>