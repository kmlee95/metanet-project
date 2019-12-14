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
<title>APPLY FOR VACATION</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- apply_for_vacation css -->
<link href="/resources/css/apply_for_vacation.css" rel="stylesheet">

<!-- jqeury -->
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
	<div class="container" style="margin-top: 10px;">
		<div class="card">

			<div class="form-group">
				<h3>휴가 관리</h3>
				<div class="tablebox">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">이름</th>
								<th scope="col">회사명</th>
								<th scope="col">부서</th>
								<th scope="col">직급</th>
								<th scope="col">입사일자</th>
								<th scope="col">상위자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>민산이</td>
								<td>메타넷</td>
								<td>풀무원 유지보수</td>
								<td>인턴 나부랭이</td>
								<td>못했음...</td>
								<td>변상욱 부장님</td>
							</tr>
						</tbody>
					</table>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-secondary btn-apply"
						data-toggle="modal" data-target="#exampleModal">휴가 신청</button>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header" style="background:#dee2e6">
									<h5 class="modal-title" id="exampleModalLabel"></h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<%@ include file="./ApplySubmit.jsp"%></div>
								<div class="modal-footer" style="background:#dee2e6">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" >취소</button>
									<button type="button" class="btn btn-primary">신청</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 10px;">
		<div class="card">
			<div class="form-group">
				<h3>휴가 신청 내역</h3>
				<div class="tablebox">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">년도</th>
								<th scope="col">발생일</th>
								<th scope="col">휴가기간</th>
								<th scope="col">휴가유형</th>
								<th scope="col">휴가사유</th>
								<th scope="col">상위자</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').trigger('focus')
		})
	</script>
</body>