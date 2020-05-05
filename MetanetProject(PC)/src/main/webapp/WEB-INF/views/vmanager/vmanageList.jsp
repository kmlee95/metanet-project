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
<!-- jquery cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
	var fnExcelReport = function fnExcelReport(id, title) {
		var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
		tab_text = tab_text
				+ '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
		tab_text = tab_text
				+ '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
		tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
		tab_text = tab_text
				+ '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
		tab_text = tab_text
				+ '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
		tab_text = tab_text + "<table border='1px'>";
		var exportTable = $('#' + id).clone();
		exportTable.find('input').each(function(index, elem) {
			$(elem).remove();
		});
		tab_text = tab_text + exportTable.html();
		tab_text = tab_text + '</table></body></html>';
		var data_type = 'data:application/vnd.ms-excel';
		var ua = window.navigator.userAgent;
		var msie = ua.indexOf("MSIE ");
		var fileName = title + '.xls';
		//Explorer 환경에서 다운로드
		if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
			if (window.navigator.msSaveBlob) {
				var blob = new Blob([ tab_text ], {
					type : "application/csv;charset=utf-8;"
				});
				navigator.msSaveBlob(blob, fileName);
			}
		} else {
			var blob2 = new Blob([ tab_text ], {
				type : "application/csv;charset=utf-8;"
			});
			var filename = fileName;
			var elem = window.document.createElement('a');
			elem.href = window.URL.createObjectURL(blob2);
			elem.download = filename;
			document.body.appendChild(elem);
			elem.click();
			document.body.removeChild(elem);
		}
	}
</script>
</head>


<body>
	<script>
		$(document).ready(function() {
			$("#button-addon2").click(function(e) {
				e.preventDefault();
				var url = "/login/vmanager/vmanagelist";
				url = url + "?searchType=" + $('#searchType').val();
				url = url + "&keyword=" + $('#keyword').val();
				location.href = url;
			});
		});
	</script>
	<%@ include file="../mainbar.jsp"%>
	<div class="container" style="margin-top: 10px;">
		<div class="card">
			<div>
				<h1 class="entry-title">
					<span style="margin-left: 10px;">User List</span>
				</h1>
				<hr>
				<div class="title">
					<div>
						<div class="input-group"
							style="width: 40%; margin-left: 10px; margin-top: 15px; margin-bottom: 20px;">
							<div
								style="justify-content: center; align-items: center; display: flex;">
								<select class="form-control" name="searchType" id="searchType">
									<!--  <option value="userId">ID</option>-->
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
						<div>
							<h3 style="float: left; margin-left: 10px">휴가 사용 목록</h3>
						</div>
					</div>
					<div>
						<button class="btn btn-outline-secondary download"
							onclick="fnExcelReport('vacation_info', 'vacation_info');"
							type="button">엑셀 다운</button>
					</div>
				</div>
				<div class="tablesetting">
					<table class="table" id="vacation_info">
						<thead class="thead-light">
							<tr>
								<th scope="col">사원번호</th>
								<th scope="col">이름</th>
								<th scope="col">부서</th>
								<th scope="col">직급</th>
								<th scope="col">입사일자</th>
								<th scope="col">발생일수</th>
								<th scope="col">사용일수</th>
								<th scope="col">잔여일수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${vmlist}" var="list">
								<tr>
									<td>${list.emp_code}</td>
									<td>${list.name}</td>
									<td>${list.org_name}${list.org_div}</td>
									<td>${list.emp_rank}</td>
									<td>${list.join_date}</td>
									<td>${list.acq_days_num}</td>
									<td>${list.use_days_num}</td>
									<td>${list.res_days_num}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>