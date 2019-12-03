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
<title>registration page</title>
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- login css -->
<link href="/resources/css/registration.css" rel="stylesheet">
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
	<script>
		var action = '';
		var url = '';
		var type = '';
		var bno = 0;


		//상세버튼 클릭 시 초기설정
		$(document).ready(
				function() {
					$("button[name='detail']").click(
							function() {
								action = 'detail';
								type = 'PUT';
								bno = this.value;
								var row = $(this).parent().parent();
								var tr = row.children();

								var employCode = tr.eq(0).text();
								var userId = tr.eq(1).text();
								var userPass = tr.eq(2).text();
								var userName = tr.eq(3).text();
								var regDate = tr.eq(4).text();
								var gender = tr.eq(5).text();
								var phoneNumber = tr.eq(6).text();
								var org_code = tr.eq(7).text();
								var emp_rank = tr.eq(8).text();

								$("#employCode").val(employCode);
								$("#userId").val(userId);
								$("#userPass").val(userPass);
								$("#userName").val(userName);
								$("#regDate").val(regDate);
								$("input:radio[name='gender']").val(gender)
										.prop("checked", true);
								$("#phoneNumber").val(phoneNumber);
								$("#org_code").val(org_code).prop("selected",
										true);
								$("#emp_rank").val(emp_rank).prop("selected",
										true);

								$("#exampleModal").modal();

							});

					//수정 및 save(계정)
					$("#modalSave").click(function(e) {
						e.preventDefault();
						var url = "/login/account/updateMember";
						if ($("#employCode").val() != 0) {
							var url = "/login/account/updateMember";
						}
						var paramData = {
							"employCode" : $("#employCode").val(),
							"userId" : $("#userId").val(),
							"userPass" : $("#userPass").val(),
							"userName" : $("#userName").val(),
							"regDate" : $("#regDate").val(),
							"gender" : $('input[name="gender"]:checked').val(),
							"phoneNumber" : $("#phoneNumber").val(),
							"org_code" : $("#org_code option:selected").val(),
							"emp_rank" : $("#emp_rank option:selected").val()
						};
						$.ajax({
							url : url,
							type : "POST",
							dataType : "json",
							data : paramData,
							success : function(result) {
								$("#exampleModal").modal('toggle');
								location.reload();
							}
						});
					});
					//삭제(계정)
					$("#modalDelete").click(function(e) {
						e.preventDefault();
						var url = "/login/account/deleteMember";
						var paramData = {
							"employCode" : $("#employCode").val()
						};
						$.ajax({
							url : url,
							type : "POST",
							dataType : "json",
							data : paramData,
							success : function(result) {
								alert("삭제 완료");
								$("#exampleModal").modal('toggle');
								location.reload();
							}
						});
					});
					$("#button-addon2").click(function(e) {
						e.preventDefault();
						var url = "/login/account/registration";
						url = url + "?searchType=" + $('#searchType').val();
						url = url + "&keyword=" + $('#keyword').val();
						location.href = url;
					});
				});

		
	</script>

	<div class="container" style="margin-top: 10px;">
		<div class="card">
			<div>
				<h1 class="entry-title">
					<span>User List</span>
				</h1>
				<hr>
				<div class="title">
					<div class="input-group mb-3" style="width: 40%;">
						<select class="form-control" name="searchType" id="searchType">
							<option value="userId">ID</option>
							<option value="employCode">사원코드</option>
							<option value="userName">이름</option>
						</select> <input type="text" class="form-control" placeholder="입력해 주세요."
							name="keyword" id="keyword" aria-label="이름을 입력해주세요"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">search</button>
						</div>
					</div>
				</div>

				<div class="tableBox">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">사원코드</th>
								<th scope="col">ID</th>
								<th scope="col">PASSWORD</th>
								<th scope="col">이름</th>
								<th scope="col">입사일</th>
								<th scope="col">성별</th>
								<th scope="col">휴대폰번호</th>
								<th scope="col">부서코드</th>
								<th scope="col">직급</th>
								<th scope="col">detail</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty member}">
									<tr>
										<td colspan="5" align="center">데이터가 없습니다.</td>
									</tr>
								</c:when>
								<c:when test="${!empty member}">
									<c:forEach var="list" items="${member}">
										<tr id="tr${list.bno}">
											<td><c:out value="${list.employCode}" /></td>
											<td><c:out value="${list.userId}" /></td>
											<td><c:out value="${list.userPass}" /></td>
											<td><c:out value="${list.userName}" /></td>
											<td><c:out value="${list.regDate}" /></td>
											<td><c:out value="${list.gender}" /></td>
											<td><c:out value="${list.phoneNumber}" /></td>
											<td><c:out value="${list.org_code}" /></td>
											<td><c:out value="${list.emp_rank}" /></td>
											<td>
												<button type="button" class="btn btn-outline-secondary"
													name="detail" value="${list.bno}">detail</button>
											</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style='font-weight: bold'>Detail Account</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<td>사원코드</td>
							<td><input class="form-control" id="employCode" type="text"
								readonly></td>
						</tr>
						<tr>
							<td>userID</td>
							<td><input class="form-control" id="userId" type="text"></td>
						</tr>
						<tr>
							<td>userPass</td>
							<td><input class="form-control" id="userPass" type="text"></td>
						</tr>
						<tr>
							<td>userName</td>
							<td><input class="form-control" id="userName" type="text"></td>
						</tr>
						<tr>
							<td>regDate</td>
							<td><input class="form-control" id="regDate" type="date"></td>
						</tr>
						<tr>
							<td>gender</td>
							<td><label> <input name="gender" type="radio"
									value="Male"> Male
							</label>     <label> <input name="gender" type="radio"
									value="Female"> Female
							</label></td>
						</tr>
						<tr>
							<td>phoneNumber</td>
							<td><input class="form-control" id="phoneNumber" type="text"></td>
						</tr>
						<tr>
							<td>org_code</td>
							<td><select id="org_code" name="org_code"
								class="form-control">
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
							</select></td>
						</tr>
						<tr>
							<td>emp_rank</td>
							<td><select id="emp_rank" name="emp_rank"
								class="form-control">
									<option value="">직급</option>
									<option value="사원">사원</option>
									<option value="대리">대리</option>
									<option value="차장">차장</option>
									<option value="과장">과장</option>
									<option value="부장">부장</option>
									<option value="이사">이사</option>
							</select></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">

					<button type="button" id="modalSave"
						class="btn btn-outline-primary">Save</button>
					<button type="button" id="modalDelete"
						class="btn btn-outline-danger">Delete</button>
					<button type="button" class="btn btn-outline-warning"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>