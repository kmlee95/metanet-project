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
<script type = "text/javascript" src="/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">

		var date = 0;
		var remain_date = 0;
		var use_date = 0;

		//15가 아닌 다른 연차 부여
		function check_modify(obj){
				var tr = $(obj).parent().parent();
				date = prompt("부여할 연차를 입력해주세요.");
				
				if(date == ""){
					//alert("입력한 값이 없어 기본 연차로 부여합니다.");
					//date = 15;
					return;
				}
				else if(date == null){ //취소를 누를 경우
					 
					return;
				}
				else{
					alert("수정되었습니다.");
				}
				remain_date = date - use_date;
				tr.children().eq(6).text(date);
				tr.children().eq(7).text(use_date);
				tr.children().eq(8).text(remain_date);
			}

		//기본 연차 부여
		function check_annual(){
			alert("기본 연차로 부여 완료했습니다.");
			//기본 연차는 15
			$('#aTable tr').filter(':has(:checkbox:checked)').each(function(){			
				var chk=$(this);
				if(chk.attr('id')=="vacation"){
					date = 15;
					remain_date = date - use_date;
					chk.children().eq(6).text("15");
					chk.children().eq(7).text(use_date);
					chk.children().eq(8).text(remain_date);
				}
						
			});
		}

		//checkbox 전체 선택 또는 전체 해제
		function checkall(){
			if($("#check_all").is(':checked')){
				$("input[name=v_checkbox]").prop("checked",true);
			}
			else{ //전체 해제
				$("input[name=v_checkbox]").prop("checked",false);
			}
		}

		function nameSearch(){
			var name = document.getElementById("search_name").value;
			//DB 연결 전 임시
			alert(name);
		}
		

	</script>
</head>

<body>
	<%@ include file="../mainbar.jsp"%>
	

	<div class="container" style="margin-top: 10px;">
		<div class="card">
			<div style="width: 100%">
				<div>
					<div class="title">
						<div class="input-group mb-3" style="width: 40%;">
							<input type="text" class="form-control" placeholder="이름을 입력해주세요"
								aria-label="이름을 입력해주세요" aria-describedby="button-addon2" id="search_name">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									id="button-addon2" onclick="nameSearch()">search</button>
							</div>
						</div>
					</div>
					<div class="btnSave">
						<button class="btn btn-outline-secondary" type="button"
							id="annualBtn" style="margin: 15px;" onclick="check_annual()">일괄 부여</button>
					</div>
					<div class="tableBox">
						<table class="table" id="aTable">
							<thead class="thead-light">
								<tr>
									<th>
										<form>
											<input type = "checkbox" name = "check_all" value="checkbox" 
												   id="check_all"  onclick= "checkall();"/> <br/>
										</form>
									</th>
									<th scope="col">사원번호</th>
									<th scope="col">이름</th>
									<th scope="col">부서</th>
									<th scope="col">직급</th>
									<th scope="col">입사 일자</th>
									<th scope="col">발생 일자</th>
									<th scope="col">사용 일자</th>
									<th scope="col">잔여 일자</th>
									<th scope="col"> </th>
								</tr>
							</thead>
							<tbody>
								<tr id="vacation">
									<td>
										<form>
											<input type = "checkbox" name = "v_checkbox" value="checkbox" /> <br/>
										</form>
									</td>
									<td>60162119</td>
									<td>홍길동</td>
									<td>PB1</td>
									<td>과장</td>
									<td>2015-04-17</td>
									<td>0</td>
									<!-- <td><script type="text/javascript">document.write(use_date)</script></td>
									<td><p id = "remain_date"><script type="text/javascript">document.write(remain_date)</script></p></td>-->
									<td>0</td>
									<td>0</td>
									<td>
										<button class="btn btn-outline-secondary" type="button"
												id="button-addon2" onclick="check_modify(this);">수정</button>
									</td>
								</tr>
								<tr id="vacation">
									<td>
										<form>
											<input type = "checkbox" name = "v_checkbox" value="checkbox" /> <br/>
										</form>
									</td>
									<td>60162119</td>
									<td>김산이</td>
									<td>PB1</td>
									<td>부장</td>
									<td>2013-04-17</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>
										<button class="btn btn-outline-secondary" type="button"
												id="button-addon2" onclick="check_modify(this);">수정</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>