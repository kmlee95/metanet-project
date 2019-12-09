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

<!-- jquery cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>

<body>
	<%@ include file="../mainbar.jsp"%>
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet">

	<script>
		// 비밀번호 정규식, A~Z, a~z, 0~9로 시작하는 비밀번호 4~12자리
		var pwJ = /^[A-Za-z0-9]{4,12}$/;
		// 이름 정규식, 가~힣 만으로 이루어진 2~6자리
		var nameJ = /^[가-힣]{2,6}$/;
		// 이메일(아이디) 검사 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 휴대폰 번호 정규식(특수문자 x)
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		//사원코드 정규식
		var employJ = /^E?([0-9]{4})$/;

		//회원가입 버튼 최종 체크
		var signup_button = new Array(5).fill(false);

		$(document).ready(function() {
			$('#password').blur(function() {
				if (pwJ.test($('#password').val())) {
					console.log('true');
					$('#pw_check').text('');
				} else {
					console.log('false');
					$('#pw_check').text('숫자 or 문자로만 4~12자리 입력 :)');
					$('#pw_check').css('color', 'red');
				}
			});
			$('#cpassword').blur(function() {
				if ($('#password').val() != $(this).val()) {
					$('#pw2_check').text('비밀번호가 일치하지 않습니다 :p');
					$('#pw2_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
				} else {
					$('#pw2_check').text('');
					$("#reg_submit").attr("disabled", false);
				}
			});
			$('#mem_name').blur(function() {
				if (nameJ.test($(this).val())) {
					$("#name_check").text('');
				} else {
					$('#name_check').text('이름을 확인해 주세요(한글만 가능) :)');
					$('#name_check').css('color', 'red');
				}
			});
			$('#contactnum').blur(function() {
				if (phoneJ.test($(this).val())) {
					$("#phone_check").text('');
				} else {
					$('#phone_check').text('휴대폰 번호를 확인해 주세요(특수문자 X)');
					$('#phone_check').css('color', 'red');
				}
			});
			$('#captcha').blur(function() {
				if (employJ.test($(this).val())) {
					$("#employCode_check").text('');
				} else {
					$('#employCode_check').text('사원코드는 필수 입력사항(E0000)');
					$('#employCode_check').css('color', 'red');
				}
			});
			
		
				
		
			//아이디 검사
			$("#userId").blur(function() {
				var userId = $('#userId').val();
				$.ajax({
					url : '${pageContext.request.contextPath}/login/idCheck?userId='+ userId,
					type : 'get',
					success : function(data) {
						console.log(data);				
									
						if (data == 1) {
								$("#id_check").text("사용중인 아이디입니다 :p");
								$("#id_check").css("color", "red");
								$("#reg_submit").attr("disabled", true);
							} else {
								if(mailJ.test(userId)){
									$("#id_check").text("");
									$("#reg_submit").attr("disabled", false);
								} else if(userId == ""){
									$('#id_check').text('아이디를 입력해주세요 :)');
									$('#id_check').css('color', 'red');
									$("#reg_submit").attr("disabled", true);				
								} else {
									$('#id_check').text("아이디는 실제 이메일 형식만 가능합니다 :)");
									$('#id_check').css('color', 'red');
									$("#reg_submit").attr("disabled", true);
								}
							}
						}, error : function() {
								console.log("실패");
						}
					});
				});
			

			//아이디 체크
			$('#reg_submit').click(function(){
				// 비밀번호가 같은 경우 && 비밀번호 정규식
				if (($('#password').val() == ($('#cpassword').val()))
						&& pwJ.test($('#password').val())) {
					signup_button[0] = true;
				} else {
					signup_button[0] = false;
				}
				// 이름 정규식
				if (nameJ.test($('#mem_name').val())) {
					signup_button[1] = true;	
				} else {
					signup_button[1] = false;
				}
				// 이메일 정규식
				if (mailJ.test($('#userId').val())){
					signup_button[2] = true;
				} else {
					signup_button[2] = false;
				}
				// 휴대폰번호 정규식
				if (phoneJ.test($('#contactnum').val())) {
					signup_button[3] = true;
				} else {
					signup_button[3] = false;
				}
				if (employJ.test($('#captcha').val())) {
					signup_button[4] = true;
				} else {
					signup_button[4] = false;
				}
				
				var validAll = true;
				for(var i = 0; i < signup_button.length; i++){
					if(signup_button[i] == false){
						validAll = false;
					}
				}
				if(validAll){ // 유효성 모두 통과
					var url = "/login/signupcheck";
					var paramData = {
							"userId" : $("#userId").val(),
							"userPass" : $("#password").val(),
							"userName" : $("#mem_name").val(),
							"regDate" : $("#enter_date").val(),
							"org_code" : $("#org_code option:selected").val(),
							"emp_rank" : $("#emp_rank option:selected").val(),
							"gender" : $('input[name="gender"]:checked').val(),
							"phoneNumber" : $("#contactnum").val(),
							"employCode" : $("#captcha").val()
					};
					$.ajax({
						url : url,
						type : "POST",
						dataType : "json",
						data : paramData,
						success : function(result) {
							
							alert("이메일 전송 완료");
						},
						beforeSend:function(){
							$("#img").show()
						},
						complete:function(){
							$("#img").hide();
						}
						
					})
					$("#reg_submit").attr("disabled", false);

				} else{
					alert('회원가입 정보를 다시 확인해 주세요')
					$("#reg_submit").attr("disabled", true);
				}
			});	
		});
	</script>

	<div class="container" style="margin-top: 10px;">
		<div class="card">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<section>
							<img src="/resources/img/loading.gif" id="img" style="display:none" />
							<h1 class="entry-title">
								<span>Sign Up</span>
							</h1>
							<hr>
							<form class="form-horizontal" name="signup" id="signup">
								<div class="form-group">
									<label class="control-label col-sm-3">Email ID <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												type="text" class="form-control" name="userId" id="userId"
												placeholder="Enter your Email ID" value="">	
										</div>
										<div class="check_font" id="id_check"></div>
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
										<div class="check_font" id="pw_check"></div>
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
										<div class="check_font" id="pw2_check"></div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">Full Name <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<input type="text" class="form-control" name="userName"
											id="mem_name" placeholder="Enter your Name here" value="">
										<div class="check_font" id="name_check"></div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">부서 <span
										class="text-danger">*</span></label>
									<div class="col-md-5 col-sm-8">
										<div class="form-inline">
											<select id="org_code" name="org_code" class="form-control">
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
											<select id="emp_rank" name="emp_rank" class="form-control">
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
									<label class="control-label col-sm-3">입사 년도 <span
										class="text-danger">*</span>
									</label>
									<div class="col-md-5 col-sm-8">
										<input type="date" class="form-control" name="regDate"
											id="enter_date" placeholder="Enter your date(yyyymmdd)"
											value="2019-09-22">
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
												placeholder="Enter you
												r Primary contact no."
												value="">
										</div>
										<div class="check_font" id="phone_check"></div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">Employee Code </label>
									<div class="col-md-5 col-sm-8">
										<div>
											<input type="text" name="employCode" id="captcha"
												class="form-control label-warning" />
										</div>
										<div class="check_font" id="employCode_check"></div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-offset-3 col-xs-10">
										<input name="Submit" type="submit" id="reg_submit"
											value="SignUp" class="btn btn-primary">
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