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
<title>VACATION_LIST</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- login css -->
<link href="/resources/css/vmanageList.css" rel="stylesheet">
</head>


<body>
	<%@ include file="../mainbar.jsp"%>
	<div class="container" style="margin-top: 10px;">
		<div class="card">
			<div class="input-group mb-3" style="width: 40%;">
				<input type="text" class="form-control" placeholder="이름을 입력해주세요"
					aria-label="이름을 입력해주세요" aria-describedby="button-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button">search</button>
				</div>
			</div>

			<div class="form-group">
				<div class="title_download">
					<h3 style="float:left">휴가 사용 목록</h3>
					<div>
						<button class="btn btn-outline-secondary download" type="button">엑셀
							다운</button>
					</div>
				</div>
				<div class="tablesetting">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col">사원번호</th>
								<th scope="col">이름</th>
								<th scope="col">회사</th>
								<th scope="col">부서</th>
								<th scope="col">직급</th>
								<th scope="col">입사일자</th>
								<th scope="col">발생일수</th>
								<th scope="col">사용일수</th>
								<th scope="col">잔여일수</th>
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
								<td>인턴 나부랭이</td>
								<td>못했음...</td>
								<td>변상욱 부장님</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>