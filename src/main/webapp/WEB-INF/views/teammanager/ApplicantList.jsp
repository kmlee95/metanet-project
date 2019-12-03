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
		<title>Vacation List PAGE</title>
		
		<!-- Bootstrap core CSS -->
		<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
			rel="stylesheet">
		
		<!-- login css -->
		<link href="/resources/css/applicantlist.css" rel="stylesheet">
		<script type = "text/javascript" src="/resources/vendor/jquery/jquery.min.js"></script>
		
		<script type = "text/javascript">

			//checkbox에서 선택한 것들을 일괄적으로 승인완료 처리
			$(function(){
				$('#approveBtn').click(function(){
					alert("완료되었습니다.");
					$('#v_table tr').filter(':has(:checkbox:checked)').each(function(){
						var chk=$(this);
						if(chk.attr('id')=="approve_id"){
							chk.children().eq(9).text("승인 완료");
						}
					});					
				});

				//1명이면 메세지 1개 3명이면 메세지 3번써야하는 거절버튼
				//$('#returnBtn').click(function(){
				//	$('#v_table tr').filter(':has(:checkbox:checked)').each(function(){
				//		var returnmsg;
				//		returnmsg = prompt("반려 사유를 적어주세요.");
				//		var chk=$(this);
				//		chk.children().eq(11).text("승인 거절");
				//		});					
				//	});
			});

			//해당 승인 거절 + 반려 사유 작성 및 반영

			function return_input(obj){
				var tr = $(obj).parent().parent();
				var returnmsg;
				returnmsg = prompt("반려 사유를 적어주세요.");
				tr.children().eq(9).text("승인 거절");
				tr.children().eq(10).text(returnmsg);
			}

			//checkbox 전체 선택 및 해제

			function checkall(){
				if($("#check_all").is(':checked')){
					$("input[name=v_checkbox]").prop("checked",true);
				}
				else{
					$("input[name=v_checkbox]").prop("checked",false);
				}
			}
	
			</script>
			
	</head>
	
	
	
	<body>
		<%@ include file="../mainbar.jsp"%>
	
		<div>
			<div class="container" style="margin-top: 10px;">
				<div class="card">
					<div class="title">
						<h3>정보</h3>
					</div>
					<div class="tableBox">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">이름</th>
									<th scope="col">부서</th>
									<th scope="col">직급</th>
									<th scope="col">입사 일자</th>
									<th scope="col">발생 일수</th>
									<th scope="col">사용 일수</th>
									<th scope="col">잔여 일수 </th>
									<th scope="col">상위자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>민산이</td>
									<td>PB1</td>
									<td>이사</td>
									<td>2000-04-17</td>
									<td>15</td>
									<td>0</td>
									<td>15</td>
									<td>김회장</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="container" style="margin-top: 10px;">
				<div class="card">
					<div class="title">
						<h3>휴가 신청 리스트</h3>
						<div>
							<button type="button" class="btn btn-secondary" class = "btnBox" 
									id = "approveBtn">승인</button>
					     	<!-- <button type="button" class="btn btn-secondary" class = "btnBox" id = "returnBtn">반려</button>-->
						</div>
					</div>
					<div class="tableBox">
						<table class="table" id = "v_table">
							<thead class="thead-light">
								<tr>
									<th>
										<form>
											<input type = "checkbox" name = "check_all" value="checkbox" 
												   id="check_all"  onclick= "checkall();"/> <br/>
										</form>
									</th>
									<th scope="col">발생일</th>
									<th scope="col">이름</th>
									<th scope="col">부서</th>
									<th scope="col">직급</th>
									<th scope="col">입사 일자</th>
									<th scope="col">유형</th>
									<!-- <th scope="col">사유</th> -->
									<th scope="col">휴가 시작 일자</th>
									<th scope="col">휴가 끝 일자</th>
									<th scope="col">상태</th>
									<th scope="col">반려 사유</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr id = "approve_id">
									<td>
										<form>
											<input type = "checkbox" name = "v_checkbox" value="checkbox" /> <br/>
										</form>
									</td>
									<td>2019-11-26</td>
									<td>홍길동</td>
									<td>PB1</td>
									<td>과장</td>
									<td>2015-04-17</td>
									<td>연차</td>
									<!--<td>연차</td> -->
									<td>2019-12-02</td>
									<td>2019-12-02</td>
									<td>승인 대기</td>
									<td></td>
									<td><button type="button" class="btn btn-secondary" onclick = "return_input(this);">반려</button>
									</td>
								</tr>
								<tr id = "approve_id">
									<td>
										<form>
											<input type = "checkbox" name = "v_checkbox" value="checkbox" /> <br/>
										</form>
									</td>
									<td>2019-11-26</td>
									<td>김길동</td>
									<td>PB1</td>
									<td>사원</td>
									<td>2019-04-17</td>
									<td>연차</td>
									<!--<td>연차</td> -->
									<td>2019-12-02</td>
									<td>2019-12-05</td>
									<td>승인 대기</td>
									<td></td>
									<td><button type="button" class="btn btn-secondary" onclick = "return_input(this);">반려</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>