<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가신청</title>

<!--  달력 api  -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- jquery UI CDN -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- 언어 별 CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.9.2/i18n/jquery.ui.datepicker-ko.min.js"></script>
<!-- Date 라이브러리 -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">
		$(document).ready(function() {
			// 폼전송
			$("#btnJoin").click(function() {
				submitContents($("#btnJoin"));
				$("form").submit();
			});

			$("#btnCancel").click(function() {
				history.go(-1);
			});
		});
	</script>

<script type="text/javascript">
		$(document).ready(function() {
			// 년월일 select
			function appendYear() {
				var date = new Date();
				var year = date.getFullYear();
				var selectValue = document.getElementById("year");
				var optionIndex = 0;

				for (var i = year - 100; i <= year; i++) {
					selectValue.add(new Option(i + "년", i), optionIndex++);
				}
			}
		});
	</script>

<script>
		$(function() {

			var option = {
				// datepicker 애니메이션 타입

				// option 종류 : "show" , "slideDown", "fadeIn", "blind", "bounce", "clip", "drop", "fold", "slide"
				showAnim : "slideDown",
				// 해당 월의 다른 월의 날짜가 보이는 여부, 예를 들면 10월이면 전후에 9월 마지막과 11월의 시작 일이 보이는 여부입니다. 즉, 달력이 꽉 차 보이게 하는 것
				showOtherMonths : true,
				// 선택 여부 (showOtherMonths 옵션과 같이 일치시키지 않으면 에러가 발생합니다.)
				selectOtherMonths : true,
				// 달력 밑에 오늘과 닫기 버튼이 보인다.
				showButtonPanel : true,
				// 년 월이 셀렉트 박스로 표현 되어서 선택할 수 있다.
				changeMonth : true,
				changeYear : true,
				// 한번에 보이는 개월 수
				numberOfMonths : 3,
				// 데이터 포멧
				dateFormat : "yy-mm-dd",
				// 텍스트 박스 옆의 달력 포시
				showOn : "button",
				//이미지 타입인지 버튼 타입인지 설정
				buttonImageOnly : true,
				// 이미지 경로
				buttonImage : "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
				// 버튼 타입이면 버튼 값
				buttonText : "Select date",
				// alt 데이터 포멧
				altFormat : "DD, d MM, yy",
				// 선택 가능한 날짜(수 형식) - 현재 기준 -20일
				minDate : -20,
				// 선택 가능한 최대 날짜(문자 형식) - 현재 기준 +1월 +20일
				maxDate : "+1M +20D",
				// 주 표시
				showWeek : true
			};

			var optionFrom = option;
			optionFrom.altField = "#VA_Start_Date";
			var dateFormat = "mm-dd-yy";

			// 시작일이 선택이 되면 종료일은 시작일 보다 앞을 선택할 수 없다.
			var from = $("#from").datepicker(optionFrom).on("change",
					function() {
						to.datepicker("option", "minDate", getDate(this));
					});

			var optionTo = option;
			optionTo.altField = "#VA_End_Date";

			// 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없다.
			var to = $("#to").datepicker(optionTo).on("change", function() {
				from.datepicker("option", "maxDate", getDate(this));
			});

			function getDate(element) {
				return moment(element.value).toDate();
			}
		});
	</script>
</head>

<style>
 label { padding-right: 10px; 
         background : lightgrey; }
         
  button { padding-right: 10px; 
         background : light-grey; }        

</style>

</head>

<body>
	<div style="max-width: 400px; margin: 0 auto;">
		<form class="form-horizontal applyform" id="applyform"
			action="/apply_submit" method="post">

			<div class="form-group">
				<strong> <label class="input-label" for="year">
						&nbsp;&nbsp;신청 년도</label>
				</strong> <br>
				<div class="form-group-div" style="width: 200px">
					2019
				</div>
			</div>

			<div class="form-group">
				<strong> <label class="input-label" for="V_Kind_Code">
						&nbsp;&nbsp;휴가유형</label>
				</strong>
				<div class="form-group-div">
					<select class="form-control" name="V_Kind_Code" id="V_Kind_Code"
						style="width: 100px">
						<c:forEach items="${v_kindlist }" var="list">
							<option>${list.V_Kind_Code }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<br>

			<div class="form-group">
				<strong> <label class="input-label" for="re_user_pw">
						&nbsp;&nbsp;휴가기간</label>
				</strong>

				<div class="form-group-div">
					<p>
					  <input type="text" id="from" size="10" placeholder="Start"> ~ 
					   <input type="text" id="to" size="10" placeholder="End">
					</p>

					<p>
					  <input type="text" id="VA_Start_Date" size="10" style="margin-right : 10px;">   ~   
					  <input type="text" id="VA_End_Date" size="10"
					          style="margin-left : 7px;">
					</p>
				</div>
			</div>
			<br>

			<div class="form-group">
				<strong> <label class="input-label" for="v_date">&nbsp;&nbsp;휴가일수</label>
				</strong>
				<div class="form-group-div">
					<input class="form-control" type="text" id="v_date" name="v_date"
						style="width: 300px;" placeholder="Date" />
				</div>
			</div>
			<br>

			<div class="form-group">
				<strong> <label class="input-label" for="VA_Reason">
						&nbsp;&nbsp;휴가사유</label>
				</strong>
				<div class="form-group-div">
					<textarea class="form-control" id="VA_Reason" name="VA_Reason"
						placeholder="Reason" style="width: 300px; height: 100px"></textarea>
				</div>
			</div>
		</form>
	</div>


</body>
</html>