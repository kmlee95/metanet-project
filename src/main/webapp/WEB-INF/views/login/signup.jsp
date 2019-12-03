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
<title>Annual Manage PAGE</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- login css -->
<link href="/resources/css/annualmanage.css" rel="stylesheet">
</head>

<body>
	<%@ include file="../mainbar.jsp"%>
	<div class="container" style="margin-top: 10px;">
		<div class="card">

			<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
			<link
				href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
				rel="stylesheet">
			<script
				src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<section>
							<h1 class="entry-title">
								<span>Sign Up</span>
							</h1>
							<hr>
							<form class="form-horizontal" method="post" name="signup" action="/login/signup"
								id="signup">
								<div class="form-group">
									<label class="control-label col-sm-3">Email ID <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												type="text" class="form-control" name="userId"
												id="userId" placeholder="Enter your Email ID" value="">
										</div>
										<small> Your Email Id is being used for ensuring the
											security of your account, authorization and access recovery.
										</small>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-3">Set Password <span
										class="text-danger">*</span></label>
									<div class="col-md-5 col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input type="password"
												class="form-control" name="userPass" id="password"
												placeholder="Choose password (5-15 chars)" value="">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">Confirm Password
										<span class="text-danger">*</span>
									</label>
									<div class="col-md-5 col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input type="password"
												class="form-control" name="cpassword" id="cpassword"
												placeholder="Confirm your password" value="">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">Full Name <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<input type="text" class="form-control" name="userName"
											id="mem_name" placeholder="Enter your Name here" value="">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">부서 <span
										class="text-danger">*</span></label>
									<div class="col-md-5 col-sm-8">
										<div class="form-inline">
											<select name="org_code" class="form-control">
												<option value="">부서</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">직급 <span
										class="text-danger">*</span></label>
									<div class="col-md-5 col-sm-8">
										<div class="form-inline">
											<select name="emp_rank" class="form-control">
												<option value="">직급</option>
												<option value="사원">사원</option>
												<option value="대리">대리</option>
												<option value="차장">차장</option>
												<option value="과장">과장</option>
												<option value="부장">부장</option>
												<option value="이사">이사</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">입사 년도
										<span class="text-danger">*</span>
									</label>
									<div class="col-md-5 col-sm-8">
										<input type="date" class="form-control" name="regDate"
											id="enter_date" placeholder="Enter your date(yyyymmdd)" value="2019-09-22">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">Gender <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<label> <input name="gender" type="radio" value="Male"
											checked> Male
										</label>     <label> <input name="gender" type="radio"
											value="Female"> Female
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">Contact No. <span
										class="text-danger">*</span></label>
									<div class="col-md-5 col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-phone"></i></span> <input type="text"
												class="form-control" name="phoneNumber" id="contactnum"
												placeholder="Enter your Primary contact no." value="">
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">Employee Code </label>
									<div class="col-md-5 col-sm-8">
										<div>
											<input type="text" name="employCode" id="captcha"
												class="form-control label-warning" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-offset-3 col-xs-10">
										<input name="Submit" type="submit" id="reg_submit" value="SignUp"
											class="btn btn-primary">
									</div>
								</div>
							</form>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>