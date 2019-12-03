<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>LOGIN PAGE</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- login css -->
<link href="/resources/css/login.css" rel="stylesheet">

</head>
<body>
	<div class="container login-container width:100% height:100%">
		<div class="row justify-content-center">
			<div class="col-md-6 login-form-1">
				<h3>휴가관리 시스템 로그인</h3>
				<form method="post" action="/login" id="loginForm">
					<div class="form-group">
						<!-- 나중에 아이디 저장 구현 -->
						<input type="text" name="userId" class="form-control" id="userId"
							placeholder="Your Email" value="" />
					</div>
					<div class="form-group">
						<input type="password" name="userPass" class="form-control"
							id="userPass" placeholder="Your Password" value="" />
					</div>
					<div class="form-group" style="text-align: center">
						<input type="submit" id="loginSubmit" class="btnSubmit"
							value="login" />
					</div>

					<div class="form-group">
						<a href="#" class="ForgetPwd">Forget Password?</a>
					</div>
					
					<c:if test="${msg == false}">
						<p style="color: #f00;">아이디 혹은 비밀번호가 잘못되었습니다.</p>
					</c:if>
				</form>

			</div>
		</div>
	</div>
</body>