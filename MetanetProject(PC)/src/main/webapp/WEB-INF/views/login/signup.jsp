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
<link href="/resources/css/signup.css" rel="stylesheet">

<!-- jquery cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<!-- toggle -->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>


</head>

<body>
	<%@ include file="../mainbar.jsp"%>
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet">

	<script>
		//아이디 코드 정규식
		var codeJ = /^ID?([0-9]{4})$/;
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
		var signup_button = new Array(3).fill(false);

		$(document).ready(function() {
			//비밀번호 유효성 검사
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
	
			//아이디 코드 검사
			$("#id_code").blur(function() {
				var id_code = $('#id_code').val();
				$.ajax({
					url : '${pageContext.request.contextPath}/login/idCodeCheck?id_code='+ id_code,
					type : 'get',
					success : function(data) {
						console.log(data);				
									
						if (data == 1) {
								$("#id_code_check").text("사용중인 아이디 코드입니다 :p");
								$("#id_code_check").css("color", "red");
								$("#reg_submit").attr("disabled", true);
							} else {
								if(codeJ.test(id_code)){
									$("#id_code_check").text("");
									$("#reg_submit").attr("disabled", false);
								} else if(id == ""){
									$('#id_code_check').text('아이디코드를 입력해주세요 :)');
									$('#id_code_check').css('color', 'red');
									$("#reg_submit").attr("disabled", true);				
								} else {
									$('#id_code_check').text("아이디코드는 ID0000 형식이여야 합니다 :)");
									$('#id_code_check').css('color', 'red');
									$("#reg_submit").attr("disabled", true);
								}
							}
						}
					});
				});
				
				//아이디 코드 검사(게스트)
				$("#id_code_guest").blur(function() {
					var id_codes = $('#id_code_guest').val();
					$.ajax({
						url : '${pageContext.request.contextPath}/login/idCodeCheckGuest?id_codes='+ id_codes,
						type : 'get',
						success : function(data) {
							console.log(data);				
										
							if (data == 1) {
									$("#id_code_check_guest").text("사용중인 아이디 코드입니다 :p");
									$("#id_code_check_guest").css("color", "red");
									$("#guest_reg_submit").attr("disabled", true);
								} else {
									if(codeJ.test(id_codes)){
										$("#id_code_check_guest").text("");
										$("#guest_reg_submit").attr("disabled", false);
									} else if(id == ""){
										$('#id_code_check_guest').text('아이디코드를 입력해주세요 :)');
										$('#id_code_check_guest').css('color', 'red');
										$("#guest_reg_submit").attr("disabled", true);				
									} else {
										$('#id_code_check_guest').text("아이디코드는 ID0000 형식이여야 합니다 :)");
										$('#id_code_check_guest').css('color', 'red');
										$("#guest_reg_submit").attr("disabled", true);
									}
								}
							}
						});
					});
					
			//아이디 검사 Guest
			$("#guestId").blur(function() {
				var guestId = $('#guestId').val();
				$.ajax({
					url : '${pageContext.request.contextPath}/login/idCheckGuest?guestId='+ guestId,
					type : 'get',
					success : function(data) {
						console.log(data);				
									
						if (data == 1) {
								$("#id_check_guest").text("사용중인 아이디입니다 :p");
								$("#id_check_guest").css("color", "red");
								$("#guest_reg_submit").attr("disabled", true);
							} else {
								if(mailJ.test(guestId)){
									$("#id_check_guest").text("");
									$("#guest_reg_submit").attr("disabled", false);
								} else if(id == ""){
									$('#id_check_guest').text('아이디를 입력해주세요 :)');
									$('#id_check_guest').css('color', 'red');
									$("#guest_reg_submit").attr("disabled", true);				
								} else {
									$('#id_check_guest').text("아이디는 실제 이메일 형식만 가능합니다 :)");
									$('#id_check_guest').css('color', 'red');
									$("#guest_reg_submit").attr("disabled", true);
								}
							}
						}, error : function() {
								console.log("실패");
						}
					});
				});		
			//비밀번호 유효성 검사(Guest)
			$('#guestPassword').blur(function() {
				if (pwJ.test($('#guestPassword').val())) {
					console.log('true');
					$('#pw_check_guest').text('');
				} else {
					console.log('false');
					$('#pw_check_guest').text('숫자 or 문자로만 4~12자리 입력 :)');
					$('#pw_check_guest').css('color', 'red');
				}
			});
			$('#guestCPassword').blur(function() {
				if ($('#guestPassword').val() != $(this).val()) {
					$('#pw2_check_guest').text('비밀번호가 일치하지 않습니다 :p');
					$('#pw2_check_guest').css('color', 'red');
					$("#guest_reg_submit").attr("disabled", true);
				} else {
					$('#pw2_check_guest').text('');
					$("#guest_reg_submit").attr("disabled", false);
				}
			});			

			
			//아이디 검사
			$("#id").blur(function() {
				var id = $('#id').val();
				$.ajax({
					url : '${pageContext.request.contextPath}/login/idCheck?id='+ id,
					type : 'get',
					success : function(data) {
						console.log(data);				
									
						if (data == 1) {
								$("#id_check").text("사용중인 아이디입니다 :p");
								$("#id_check").css("color", "red");
								$("#reg_submit").attr("disabled", true);
							} else {
								if(mailJ.test(id)){
									$("#id_check").text("");
									$("#reg_submit").attr("disabled", false);
								} else if(id == ""){
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
				
				//사원코드 검사
				$("#emp_code").change(function() {
					var emp_code = $('#emp_code').val();
					$.ajax({
						url : '${pageContext.request.contextPath}/login/empCodeCheck?emp_code='+ emp_code,
						type : 'get',
						success : function(data) {
							console.log(data);					
							if ($("#emp_code").val() != 0) {

								$("#id").val(data.id);
								
								$("#name").val(data.name);
								$("#org_name").val(data.org_name).prop("selected",
										true);
								$("#emp_rank").val(data.emp_rank).prop("selected",
										true);
								$("#join_date").val(data.join_date);
								$('input:radio[name="gender"]:input[value=' + data.gender + ']').attr("checked", true);
								$("#phone").val(data.phone);

								if(data.id != null){
									alert("이미 계정이 존재하는 사원코드 입니다");
									$("#id_code").attr("disabled", true);
									$("#id").attr("disabled", true);
									$("#password").attr("disabled", true);
									$("#cpassword").attr("disabled", true);
									$("#id_use_yn").attr("disabled", true);
									$("#reg_submit").attr("disabled", true);
								}else {
									$("#id_code").attr("disabled", false);
									$("#id").attr("disabled", false);
									$("#password").attr("disabled", false);
									$("#cpassword").attr("disabled", false);
									$("#id_use_yn").attr("disabled", false);
									$("#reg_submit").attr("disabled", false);
								}
							}
						}
					});
				});
				
				//게스트 회원가입 버튼 클릭 시 체크
				$('#guest_reg_submit').click(function(){
					// 비밀번호가 같은 경우 && 비밀번호 정규식
					if (($('#guestPassword').val() == ($('#guestCPassword').val()))
							&& pwJ.test($('#guestPassword').val())) {
						signup_button[0] = true;
					} else {
						signup_button[0] = false;
					}
					// 이메일(아이디) 정규식
					if (mailJ.test($('#guestId').val())){
						signup_button[1] = true;
					} else {
						signup_button[1] = false;
					}
					
					// 아이디 코드 정규식
					if (codeJ.test($('#id_code_guest').val())){
						signup_button[2] = true;
					} else{
						signup_button[2] = false;
					}

					var validAll = true;
					for(var i = 0; i < signup_button.length; i++){
						if(signup_button[i] == false){
							validAll = false;
						}
					}
					if(validAll){ // 유효성 모두 통과
						var url = "/login/signupcheckguest";
						var paramData = {
								"id_code_guest" : $("#id_code_guest").val(),
								"guestId" : $("#guestId").val(),
								"guestPassword" : $("#guestPassword").val(),
								"guest_id_use_yn" : $('input[name="guest_id_use_yn"]:checked').val(),
						};
						$.ajax({
							url : url,
							type : "POST",
							dataType : "json",
							data : paramData,
							success : function(result) {
								alert("게스트 계정생성완료!");
							},
							beforeSend:function(){
							},
							complete:function(){
								alert("게스트 계정생성완료!");
							}
						})
						$("#guest_reg_submit").attr("disabled", false);

					} else{
						alert('회원가입 정보를 다시 확인해 주세요')
						$("#guest_reg_submit").attr("disabled", true);
					}
				});	
					
			//사원 회원가입 버튼 클릭 시 체크
			$('#reg_submit').click(function(){
				// 비밀번호가 같은 경우 && 비밀번호 정규식
				if (($('#password').val() == ($('#cpassword').val()))
						&& pwJ.test($('#password').val())) {
					signup_button[0] = true;
				} else {
					signup_button[0] = false;
				}
				// 이메일(아이디) 정규식
				if (mailJ.test($('#id').val())){
					signup_button[1] = true;
				} else {
					signup_button[1] = false;
				}
				// 아이디 코드 정규식
				if (codeJ.test($('#id_code').val())){
					signup_button[2] = true;
				} else{
					signup_button[2] = false;
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
							"id_code" : $("#id_code").val(),
							"id" : $("#id").val(),
							"password" : $("#password").val(),
							"id_use_yn" : $('input[name="id_use_yn"]:checked').val(),
							"emp_code" : $("#emp_code option:selected").val()
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
							$("#displayToggle").hide();
							$("#img").show()
						},
						complete:function(){
							alert("이메일 전송 완료");
							$("#img").hide();
						}
						
					})
					$("#reg_submit").attr("disabled", false);

				} else{
					alert('회원가입 정보를 다시 확인해 주세요')
					$("#reg_submit").attr("disabled", true);
				}
			});	
			
			//계정 선택
			$("#toggleP").change(function(){
				$("span.normal").toggle(); //제목 토글
				
				$("#emailidToggle").toggle(); //아이디 토글
				$("#guestidToggle").toggle();

				$("#IdCodeToggle").toggle(); //아이디 코드 토글
				$("#guestIdCodeToggle").toggle();
				
				$("#guest_reg_submit").toggle(); //가입버튼 토글
				$("#reg_submit").toggle();

				$("#passToggle").toggle(); //패스워드 토글
				$("#guestPassToggle").toggle();
				$("#cpassToggle").toggle();
				$("#guestCPassToggle").toggle();

				$("#idUseToggle").toggle(); //아이디사용토글
				$("#guestIdUseToggle").toggle();
				
				$("#guest_toggle").toggle(); //등록버튼 토글
			});
			
		});
	</script>

	<div class="container" style="margin-top: 10px;">
		<div class="card" style="margin-bottom: 15px;">
			<div class="container" >
				<img src="/resources/img/loading.gif" id="img" style="display:none;" />
				<div class="row" id="displayToggle">
					<div class="col-md-8">
						<section>
							
							<h1 class="entry-title">
								<span class="normal">Sign Up(사원)</span>
								<span class="normal" style="display:none">Sign Up(Guest)</span>
							</h1>
							<hr>
							<form class="form-horizontal" name="signup" id="signup">
								<div class="form-group" id="IdCodeToggle">
									<label class="control-label col-sm-3">ID Code <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-credit-card"></i></span> <input
												type="text" class="form-control" name="id_code" id="id_code"
												placeholder="Enter your ID_CODE(ID0000)" value="">	
										</div>
										<div class="check_font" id="id_code_check"></div>
									</div>
								</div>
								<!-- Guest IDcode -->
								<div class="form-group" id="guestIdCodeToggle" style="display:none;">
									<label class="control-label col-sm-3">ID Code(Guest) <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-credit-card"></i></span> <input
												type="text" class="form-control" name="id_code_guest" id="id_code_guest"
												placeholder="Enter your ID_CODE(ID0000)" value="">	
										</div>
										<div class="check_font" id="id_code_check_guest"></div>
									</div>
								</div>
								
								<!-- 사원 ID -->
								<div class="form-group" id="emailidToggle">
									<label class="control-label col-sm-3">Email ID <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												type="text" class="form-control" name="id" id="id"
												placeholder="Enter your Email ID" value="">	
										</div>
										<div class="check_font" id="id_check"></div>
									</div>
								</div>
								<!-- Guest ID -->
								<div class="form-group" id="guestidToggle" style="display:none;"> 
									<label class="control-label col-sm-3">Guest ID <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope"></i></span> <input
												type="text" class="form-control" name="guestId" id="guestId"
												placeholder="Enter your Guest ID" value="">	
										</div>
										<div class="check_font" id="id_check_guest"></div>
									</div>
								</div>
								
								<!-- USER PASSWORD -->
								<div class="form-group" id="passToggle">
									<label class="control-label col-sm-3">Set Password <span
										class="text-danger">*</span></label>
									<div class="col-md-5 col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input type="password"
												class="form-control" name="password" id="password"
												placeholder="Choose password (5-15 chars)" value="">
										</div>
										<div class="check_font" id="pw_check"></div>
									</div>
								</div>
								<div class="form-group" id="cpassToggle">
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
								
								<!-- GUEST PASSWORD -->
								<div class="form-group" id="guestPassToggle" style="display:none;">
									<label class="control-label col-sm-3">Set Password <span
										class="text-danger">*</span></label>
									<div class="col-md-5 col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input type="password"
												class="form-control" name="guestPassword" id="guestPassword"
												placeholder="Choose password (5-15 chars) geust" value="">
										</div>
										<div class="check_font" id="guest_pw_check"></div>
									</div>
								</div>
								<div class="form-group" id="guestCPassToggle" style="display:none;">
									<label class="control-label col-sm-3">Confirm Password
										<span class="text-danger">*</span>
									</label>
									<div class="col-md-5 col-sm-8">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-lock"></i></span> <input type="password"
												class="form-control" name="guestCPassword" id="guestCPassword"
												placeholder="Confirm your password guest" value="">
										</div>
										<div class="check_font" id="guest_pw2_check"></div>
									</div>
								</div>
								
								<div class="form-group" id="idUseToggle">
									<label class="control-label col-sm-3" style="padding-top:3px;">아이디 사용여부 <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<label> <input id="id_use_yn" name="id_use_yn" type="radio" value="Y"
											checked> YES
										</label>     <label> <input id="id_use_yn" name="id_use_yn" type="radio"
											value="N"> NO
										</label>
									</div>
								</div>
								
								<div class="form-group" id="guestIdUseToggle" style="display:none;">
									<label class="control-label col-sm-3" style="padding-top:3px;">아이디 사용여부 <span
										class="text-danger">*</span></label>
									<div class="col-md-8 col-sm-9">
										<label> <input id="guest_id_use_yn" name="guest_id_use_yn" type="radio" value="Y"
											checked> YES
										</label>     <label> <input id="guest_id_use_yn" name="guest_id_use_yn" type="radio"
											value="N"> NO
										</label>
									</div>
								</div>
								
								<!-- guest 토글 버튼 클릭 시 바뀌는 form 부분 -->
								<div id="guest_toggle">
									<div class="form-group">
										<label class="control-label col-sm-3">Employee Code </label>
										<div class="col-md-5 col-sm-8">
											<div>
												<c:if test="${!empty empCodeList}">
													<select name="emp_code" id="emp_code" class="form-control">
														<option value="">사원코드</option>
														<c:forEach var="empCodeList" items="${empCodeList}"
															varStatus="i">
															<option value="${empCodeList.emp_code}">${empCodeList.emp_code}</option>
														</c:forEach>
													</select>
												</c:if>
											</div>
											<div class="check_font" id="employCode_check"></div>
										</div>
									</div>
	
									<div class="form-group">
										<label class="control-label col-sm-3">Full Name <span
											class="text-danger">*</span></label>
										<div class="col-md-5 col-sm-8">
											<input type="text" class="form-control" name="name"
												id="name" placeholder="Enter your Name here" value="" readonly>
											<div class="check_font" id="name_check"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3">부서 <span
											class="text-danger">*</span></label>
										<div class="col-md-5 col-sm-8">
											<div class="form-inline">
												<select id="org_name" name="org_name" class="form-control" size=1 disabled>
													<option value="">부서</option>
													<option value="사장">사장</option>
													<option value="용산">용산</option>
													<option value="수서">수서</option>
													<option value="종로5가">종로5가</option>
													<option value="SI">SI</option>
													<option value="SI1">SI1</option>
													<option value="SI2">SI2</option>
													<option value="SM">SM</option>
													<option value="SM1">SM1</option>
													<option value="SM2">SM2</option>
													<option value="PB">PB</option>
													<option value="PB1">PB1</option>
													<option value="PB2">PB2</option>
													<option value="PB3">PB3</option>
													<option value="PB4">PB4</option>
													<option value="HRO1">HRO1</option>
													<option value="HRO2">HRO2</option>
													<option value="RPA">RPA</option>
													<option value="AWS">AWS</option>
													<option value="Azure">Azure</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3">직급 <span
											class="text-danger">*</span></label>
										<div class="col-md-5 col-sm-8">
											<div class="form-inline">
												<select id="emp_rank" name="emp_rank" class="form-control" disabled>
													<option value="">직급</option>
													<option value="사원">사원</option>
													<option value="대리">대리</option>
													<option value="차장">차장</option>
													<option value="과장">과장</option>
													<option value="부장">부장</option>
													<option value="이사">이사</option>
													<option value="사장">사장</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3">입사 년도 <span
											class="text-danger">*</span>
										</label>
										<div class="col-md-5 col-sm-8">
											<input type="date" class="form-control" name="join_date"
												id="join_date" placeholder="Enter your date(yyyymmdd)"
												value="2019-09-22" readonly>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" style="padding-top:0px;">Gender <span
											class="text-danger">*</span></label>
										<div class="col-md-8 col-sm-9">
											<label> <input name="gender" type="radio" value="M"
												checked disabled> Male
											</label>     <label> <input name="gender" type="radio"
												value="F" disabled> Female
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
													class="form-control" name="phone" id="phone"
													placeholder="Enter you
													r Primary contact no."
													value="" readonly>
											</div>
											<div class="check_font" id="phone_check"></div>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-xs-offset-3 col-xs-10">
										<input name="Submit" type="submit" id="reg_submit"
											value="SignUp" class="btn btn-primary">
											
										<input name="Submit" type="submit" id="guest_reg_submit" style="display:none;"
											value="SignUp(guest)" class="btn btn-danger">
									</div>
								</div>
							</form>
						</section>
					</div>
					
					<div class="col-md-4">
						<div style="margin-top:20px;">
							<p style="font-size:15px;">계정 관리 전환</p>
							<input id="toggleP" type="checkbox" checked data-toggle="toggle" data-on="NORMAL" data-off="GUEST" data-onstyle="info">
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>