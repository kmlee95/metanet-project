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
	
<!-- registration css -->
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
		$(document).ready(function() {
					//유저리스트 detail button
					$("button[name='detail']").click(
						function() {
							action = 'detail';
							type = 'PUT';
							var row = $(this).parent().parent();
							var tr = row.children();
							
							var emp_code = tr.eq(0).text();
							var name = tr.eq(1).text();
							var org_name = tr.eq(2).text();
							var emp_rank = tr.eq(3).text();
							var id = tr.eq(4).text();
							var password = tr.eq(5).text();		
							var id_effective_start_date = tr.eq(6).text();
							var id_effective_end_date = tr.eq(7).text();
							var id_use_yn = tr.eq(8).text();

							$("#emp_code").val(emp_code);
							$("#name").val(name);
							$("#org_name").val(org_name).prop("selected",
									true);
							$("#emp_rank").val(emp_rank).prop("selected",
									true);
							$("#id").val(id);
							$("#password").val(password);
							$("#id_effective_start_date").val(id_effective_start_date);
							$("#id_effective_end_date").val(id_effective_end_date);
							$('input:radio[name="id_use_yn"]:input[value=' + id_use_yn + ']').attr("checked", true);
						
							$("#exampleModal").modal();

					});
					//권한 관리 수정 버튼
					$("button[name='modify']").click(
						function() {
							action = 'modify';
							type = 'PUT';
							var row = $(this).parent().parent();
							var tr = row.children();

							var id_code_auth = tr.eq(0).text();
							var emp_code_auth = tr.eq(1).text();
							var AG0001 = tr.eq(2).text();
							var AG0002 = tr.eq(3).text();
							var AG0003 = tr.eq(4).text();
							var AG0004 = tr.eq(5).text();		
							
							$("#id_code_auth").val(id_code_auth);
							$("#emp_code_auth").val(emp_code_auth);
							$('input:radio[name="AG0001"]:input[value=' + AG0001 + ']').attr("checked", true);
							$('input:radio[name="AG0002"]:input[value=' + AG0002 + ']').attr("checked", true);
							$('input:radio[name="AG0003"]:input[value=' + AG0003 + ']').attr("checked", true);
							$('input:radio[name="AG0004"]:input[value=' + AG0004 + ']').attr("checked", true);
						
							$("#authorityModal").modal();

					});
				
					//수정 및 save(권한)
					$("#authModalSave").click(function(e) {
						e.preventDefault();
						var url = "/login/account/updateAuthority";
						if ($("#emp_code").val() != 0) {
							var url = "/login/account/updateAuthority";
						}
						var paramData = {
							"id_code" : $("#id_code_auth").val(),
							"AG0001" : $('input[name="AG0001"]:checked').val(),
							
							
							"id_effective_start_date" : $("#id_effective_start_date").val(),
							"id_effective_end_date" : $("#id_effective_end_date").val()	
							
						};
						$.ajax({
							url : url,
							type : "POST",
							dataType : "json",
							data : paramData,
							success : function(result) {
								$("#authorityModal").modal('toggle');
								location.reload();
							}
						});
					});
					
					//authority 권한 수정, save
					$("#authModalSave").click(function(e){
						e.preventDefault();
						var url = "/login/account/updateAuthority";
						if($("#id_code_auth").val()!= 0){
							var url = "/login/account/updateAuthority";
						}
						var paramData = {
							"id_code_auth" : $("#id_code_auth").val(),
							"emp_code_auth" : $("#emp_code_auth").val(),
							"AG0001" : $('input[name="AG0001"]:checked').val(),
							"AG0002" : $('input[name="AG0002"]:checked').val(),
							"AG0003" : $('input[name="AG0003"]:checked').val(),
							"AG0004" : $('input[name="AG0004"]:checked').val(),
							"AG0001_end_date" : $("#AG0001_end_date").val(),
							"AG0002_end_date" : $("#AG0002_end_date").val(),
							"AG0003_end_date" : $("#AG0003_end_date").val(),
							"AG0004_end_date" : $("#AG0004_end_date").val(),
						};
						$.ajax({
							url : url,
							type : "POST",
							dataType : "json",
							data : paramData,
							success : function(result) {
								$("#authorityModal").modal('toggle');
								location.reload();
							}
						});
					});
						
					
					//수정 및 save(계정)
					$("#modalSave").click(function(e) {
						e.preventDefault();
						var url = "/login/account/updateMember";
						if ($("#emp_code").val() != 0) {
							var url = "/login/account/updateMember";
						}
						var paramData = {
							"emp_code" : $("#emp_code").val(),
							"id" : $("#id").val(),
							"password" : $("#password").val(),
							"id_effective_start_date" : $("#id_effective_start_date").val(),
							"id_effective_end_date" : $("#id_effective_end_date").val(),		
							"id_use_yn" : $('input[name="id_use_yn"]:checked').val()
					
						
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
							"emp_code" : $("#emp_code").val()
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
							<option value="id">ID</option>
							<option value="emp_code">사원코드</option>
							<option value="name">이름</option>
						</select> <input type="text" class="form-control" placeholder="입력해 주세요."
							name="keyword" id="keyword" aria-label="이름을 입력해주세요"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">search</button>
						</div>
					</div>
				</div>

				<div
					style="margin: 10px; height: 300px; overflow: auto; display: block;">
					<table class="table table-bordered table-striped mb-0">
						<thead class="thead-light">
							<tr>
								<th scope="col">사원코드</th>
								<th scope="col">이름</th>
								<th scope="col">부서</th>
								<th scope="col">직위</th>
								<th scope="col">ID</th>
								<th scope="col">PASSWORD</th>
								<th scope="col">유효시작일자</th>
								<th scope="col">유효종료일자</th>
								<th scope="col">사용상태</th>
								<th scope="col">detail</th>
							</tr>
						</thead>
						</tbody>
						<c:choose>
							<c:when test="${empty member}">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty member}">
								<c:forEach var="list" items="${member}">
									<tr id="tr${list.emp_code}">
										<td><c:out value="${list.emp_code}" /></td>
										<td><c:out value="${list.name}" /></td>
										<td><c:out value="${list.org_name}" /></td>
										<td><c:out value="${list.emp_rank}" /></td>
										<td><c:out value="${list.id}" /></td>
										<td align=center><c:out value="${list.password}" /></td>
										<td><c:out value="${list.id_effective_start_date}" /></td>
										<td><c:out value="${list.id_effective_end_date}" /></td>
										<td align=center><c:out value="${list.id_use_yn}" /></td>
										<td>
											<button type="button" class="btn btn-outline-secondary"
												name="detail" value="${list.emp_code}">detail</button>
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
		
		<!-- 권한관리 -->
		<div class="card" style="margin: 10px 0 20px 0;">
			<div>
				<h1 class="entry-title">
					<span>권한 관리</span>
				</h1>
				<hr>
				<div style="margin: 10px; height: 300px; overflow: auto; display: block;">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">ID코드</th>
								<th scope="col">사원코드</th>
								<th scope="col">일반 사용자</th>
								<th scope="col">휴가 승인자</th>
								<th scope="col">휴가 업무 관리자</th>
								<th scope="col">계정 관리자</th>
								<th scope="col">modify</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty authority}">
									<tr>
										<td colspan="5" align="center">데이터가 없습니다.</td>
									</tr>
								</c:when>
								<c:when test="${!empty authority}">
									<c:forEach var="authList" items="${authority}">
										<tr id="tr${authList.emp_code}">
											<td><c:out value="${authList.id_code}" /></td>
											<td><c:out value="${authList.emp_code}" /></td>
											<td align=center><c:out value="${authList.AG0001}" /></td>
											<td align=center><c:out value="${authList.AG0002}" /></td>
											<td align=center><c:out value="${authList.AG0003}" /></td>
											<td align=center><c:out value="${authList.AG0004}" /></td>
											<td>
												<button type="button" class="btn btn-outline-secondary"
													name="modify" value="${authList.emp_code}">modify</button>
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
	
	<!-- 유저 목록 modal -->
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
							<td><input class="form-control" id="emp_code" type="text"
								readonly></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input class="form-control" id="name" type="text" readonly></td>
						</tr>
						<tr>
							<td>org_code</td>
							<td>
								<select id="org_name" name="org_name"
								class="form-control" disabled>
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
							</td>
						</tr>
						<tr>
							<td>emp_rank</td>
							<td>
								<select id="emp_rank" name="emp_rank"
									class="form-control" disabled>
									<option value="">직급</option>
									<option value="사원">사원</option>
									<option value="대리">대리</option>
									<option value="차장">차장</option>
									<option value="과장">과장</option>
									<option value="부장">부장</option>
									<option value="이사">이사</option>
									<option value="사장">사장</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>ID</td>
							<td><input class="form-control" id="id" type="text"></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input class="form-control" id="password" type="text"></td>
						</tr>
						<tr>
							<td>유효시작일자</td>
							<td><input class="form-control" id="id_effective_start_date" type="date"></td>
						</tr>
						<tr>
							<td>유효종료일자</td>
							<td><input class="form-control" id="id_effective_end_date" type="date"></td>
						</tr>

						<tr>
							<td>사용상태</td>
							<td><label> <input name="id_use_yn" type="radio"
									value="Y"> Y
							</label>     <label> <input name="id_use_yn" type="radio"
									value="N"> N
							</label></td>
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
	
	
	<!-- 권한관리 모달 -->
	<div class="modal fade" id="authorityModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"
						style='font-weight: bold'>Authority management</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr>
							<td style="font-weight:bold;">ID코드</td>
							<td><input class="form-control" id="id_code_auth" type="text"
								disabled></td>
								
							<td style="font-weight:bold;">사원코드</td>
							<td><input class="form-control" id="emp_code_auth" type="text" disabled></td>
						</tr>
						<tr>
							<td style="font-size:12px; font-weight:bold;">일반 사용자</td>
							<td><label> <input name="AG0001" id="AG0001" type="radio"
									value="Y"> Y
							</label>     <label> <input name="AG0001" id="AG0001" type="radio"
									value="N"> N
							</label></td>
							
							<td style="font-size:12px; font-weight:bold;">일반 권한 만료일</td>
							<td><input class="form-control" id="AG0001_end_date" type="date"></td>
						</tr>
						<tr>
							<td style="font-size:12px; font-weight:bold;">휴가 승인자</td>
							<td><label> <input name="AG0002" id="AG0002" type="radio"
									value="Y"> Y
							</label>     <label> <input name="AG0002" id="AG0002" type="radio"
									value="N"> N
							</label></td>
							
							<td style="font-size:12px; font-weight:bold;">휴가 승인 권한 만료일</td>
							<td><input class="form-control" id="AG0002_end_date" type="date"></td>
						</tr>
						<tr>
							<td style="font-size:12px; font-weight:bold;">휴가업무 관리자</td>
							<td><label> <input name="AG0003" id="AG0003" type="radio"
									value="Y"> Y
							</label>     <label> <input name="AG0003" id="AG0003" type="radio"
									value="N"> N
							</label></td>
							
							<td style="font-size:12px; font-weight:bold;">휴가업무 권한 만료일</td>
							<td><input class="form-control" id="AG0003_end_date" type="date"></td>
						</tr>
						<tr>
							<td style="font-size:12px; font-weight:bold;">계정 관리자</td>
							<td><label> <input name="AG0004" id="AG0004" type="radio"
									value="Y"> Y
							</label>     <label> <input name="AG0004" id="AG0004" type="radio"
									value="N"> N
							</label></td>
							
							<td style="font-size:12px; font-weight:bold;">계정 관리 권한 만료일</td>
							<td><input class="form-control" id="AG0004_end_date" type="date"></td>
						</tr>					
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" id="authModalSave"
						class="btn btn-outline-primary">Save</button>
					<button type="button" id="authModalReset"
						class="btn btn-outline-danger">Reset</button>
					<button type="button" class="btn btn-outline-warning"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>