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

			function return_input(obj){
				var tr = $(obj).parent().parent();
				var returnmsg;
				returnmsg = prompt("반려 사유를 적어주세요.");
				if (returnmsg == "") {
					alert("반려 사유를 꼭 작성해주세요.");
					return;
				}else if(returnmsg == null) { //취소버튼을 누를 경우
					return;
				}
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
									<td>${me.name}</td>
									<td>${me.org_name}</td>
									<td>${me.emp_rank}</td>
									<td>${me.join_date}</td>
									<td>${me.acq_days_num}</td>
									<td>${me.use_days_num}</td>
									<td>${me.res_days_num}</td>
									<td>${me.boss_name}</td>
								</tr>
								<c:forEach var="list" items="${annualbreak}">
									<tr>
										<td>${list.name}</td>
										<td>${list.org_name}</td>
										<td>${list.emp_rank}</td>
										<td>${list.join_date}</td>
										<td>${list.acq_days_num}</td>
										<td>${list.use_days_num}</td>
										<td>${list.res_days_num}</td>
										<td>${list.boss_name}</td>										
									</tr>
								</c:forEach>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="container" style="margin-top: 10px;">
				<div class="card">
					<div class="title">
						<h3>휴가 신청 리스트</h3>
						<button type="button" class="btn btn-secondary approve" id="checkBtn">승인</button>
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
									<th scope="col">휴가신청일</th>
									<th scope="col">이름</th>
									<th scope="col">부서</th>
									<th scope="col">직급</th>
									<th scope="col">입사 일자</th>
									
									<th scope="col" style="width:121px;">휴가기간</th>
									<th scope="col" style="width:90px;">휴가사유</th>
									<th scope="col" style="width:93px;">유형</th>

									<th scope="col">상태</th>
									<th scope="col" style="width: 105px;">반려 사유</th>
									<th scope="col" style="width: 32.229px;"></th>									
									<th scope="col" style="width: 32.229px;"></th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
				<div id="templet" style="display:none;">
		<table id="apprtr">	
		<tbody>	
		<tr id="approve_id">
			<td>
				<form>
					<input type = "checkbox" name = "v_checkbox" value="checkbox" /> <br/>
				</form>
			</td>
			<td name="va_reg_date"></td>
			<td name="name"></td>
			<td name="org_name"></td>
			<td name="emp_rank"></td>
			<td name="join_Date"></td>
			<td name="va_period"></td>
			<td name="va_reason"></td>
			<td name="vk_code_name"></td>										
			<td name="vs_code_name"></td>
	      	<td name="rej_reason">></td>
			<td><button type="button" name="button" class="btn btn-secondary approve" id="approveBtn">승인</button></td>
			<td><button type="button" name="button" class="btn btn-secondary rejBtn" >반려</button>		
			<td name="va_code" style="display:none;"></td>
			<td name="res_days_num" style="display:none;"></td>
			<td name="va_days_num" style="display:none;"></td>
			</tr>
		</tbody>
		</table> 
					
	</div>
			
		</div>

<!--테이블 동적 생성 -->
		<script type="text/javascript">
		$(document).ready(function(){
		       var templet = $("#templet");
		         var apprlistTab = $("#v_table > tbody");
		       var apptr = templet.find("#apprtr > tbody > tr ");
		       
		       apprlistTab.empty();
		      <c:forEach items="${kids}" var="list">
		         var tempTr = apptr.clone();
 		         tempTr.find("td[name='va_reg_date']").text("${list.va_reg_date}");
 		         tempTr.find("td[name='name']").text("${list.name}");
 		         tempTr.find("td[name='org_name']").text("${list.org_name}");
 		         tempTr.find("td[name='emp_rank']").text("${list.emp_rank}");
 		         tempTr.find("td[name='join_Date']").text("${list.join_Date}");
 		         tempTr.find("td[name='vk_code_name']").text("${list.vk_code_name}");

 		         var newline = tempTr.find("td[name='va_period']").text('${list.va_start_date}~\n${list.va_end_date}');
				 newline.html(newline.html().replace(/\n/g, '<br/>'));
 		         tempTr.find("td[name='vs_code_name']").text("${list.vs_code_name}");
				 tempTr.find("td[name='va_code']").text("${list.va_code}");
				 tempTr.find("td[name='rej_reason']").text("${list.rej_reason}"); 		        		         
				 tempTr.find("td[name='va_reason']").text("${list.va_reason}"); 	
				 tempTr.find("td[name='res_days_num']").text("${list.res_days_num}");
				 tempTr.find("td[name='va_days_num']").text("${list.va_days_num}");
				
				 if(tempTr.find("td[name='vs_code_name']").text()!="대기"){
// 					 alert(tempTr.find("td[name='vs_code_name']").text());
					 tempTr.find("button[name=button]").css({
						 	visibility:'hidden'
					 });
				 }
				 
		         $("#v_table").append(tempTr);
		        </c:forEach>
		   });	
		
		//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*//*
		
	////반려를 눌렀을 때		
	        $(document).ready(function(){
	            $('.rejBtn').click(function() {

					var tr = $(this).parent().parent();
					if(tr.children().eq(9).text()!='대기'){
						alert("이미 처리 되었습니다.");
						return;
					}
					//return_input	            	
					var returnmsg;
					returnmsg = prompt("반려 사유를 적어주세요.");
					if (returnmsg == "") {
						alert("반려 사유를 꼭 작성해주세요.");
						return;
					}else if(returnmsg == null) { //취소버튼을 누를 경우
						return;
					}
					tr.children().eq(10).text(returnmsg);
					///	/// /// /// /// /// /// /// /// /// /// /// /// ///	///
					
	                var i = 0;
					var chk=$(this);
					var rej_reason = tr.children().eq(10).text();
					var va_code = tr.children().eq(13).text();
					var arr = [va_code, rej_reason];

					//ajax 호출
	                $.ajax({
	                    url         :   "/login/teamnanager/test2",
	                    dataType    :   "text",
	                    contentType :   "application/json",
	                    type        :   "post",
	                    data        :   JSON.stringify(arr),
	                    success     :   function(retVal){
	                    	tr.children().eq(9).text("반려");

								tr.children().eq(11).find("button[name=button]").css({
									visibility:'hidden'
		                    	});
		                    	tr.children().eq(12).find("button[name=button]").css({
		                    		visibility:'hidden'
		                    	});
	                    },
	                    error       :   function(request, status, error){
	                        console.log("AJAX_ERROR");
	                    }
	                });
	                
	            })
	            
	        });

	        
	/////////////승인을 눌렀을 때		
			$(document).ready(function(){

				
	            $('.approve').click(function() {
	                //배열 선언

	                var tr = $(this).parent().parent();
					var fruitArray = {};
	                var i = 0;
	                var j = 0;
	                $('#v_table tr').filter(':has(:checkbox:checked)').each(function(){
	                    i++;
	                });
	                


	                //체크표시 하지 않았을 때
	                if($(this).attr('id')!='checkBtn'){

						if(tr.children().eq(9).text()!='대기'){
							alert("이미 처리 되었습니다.");
							return;
						}
						if(tr.children().eq(8).text()=='연차' || tr.children().eq(8).text()=='반차'){
							if(parseFloat(tr.children().eq(14).text())<parseFloat(tr.children().eq(15).text())){
								alert('휴가 신청일 수가 남은 휴가일 수를 넘습니다.');
								return;
							}
						}
	                	fruitArray[0] = tr.children().eq(13).text();	                		                	
		                //ajax 호출
		                $.ajax({
		                    url         :   "/login/teamnanager/test",
		                    dataType    :   "text",
		                    contentType :   "application/json",
		                    type        :   "post",
		                    data        :   JSON.stringify(fruitArray),
		                    success     :   function(retVal){
		 
		                    	tr.children().eq(9).text("승인");
		                    	alert('승인완료');
		                    	
		                    	tr.children().eq(11).find("button[name=button]").css({
		                    		visibility:'hidden'
			                    	});
		                    	tr.children().eq(12).find("button[name=button]").css({
		                    		visibility:'hidden'
		                    	});
				                    	

		                    },
		                    error       :   function(request, status, error){
		                    	alert('에러');
		                    }
		                });
	                
	                //체크표시 했을 때
	                }else{
						i = 0;
						$('#v_table tr').filter(':has(:checkbox:checked)').each(function(){
							var chk=$(this);
							if(chk.attr('id')=="approve_id"){
							fruitArray[i] = chk.children().eq(13).text();
							i++;
							} else return;
						});
		                //ajax 호출
		                $.ajax({
		                    url         :   "/login/teamnanager/test",
		                    dataType    :   "json",
		                    contentType :   "application/json",
		                    type        :   "post",
		                    data        :   JSON.stringify(fruitArray),
		                    success     :   function(retVal){
		 						var i = 0;
								var arr = retVal;

				                $('#v_table tbody tr').each(function(){
				                	var a = $(this);
				                	for(var i =0; i<Object.keys(arr).length;i++){
				                		
 										if((arr[i]==a.children().eq(13).text()) && 
 		 										a.children().eq(9).text()=="대기" &&
 		 										parseFloat(a.children().eq(14).text())>parseFloat(a.children().eq(15).text())){
  											a.children().eq(9).text("승인");

  											a.children().eq(11).find("button[name=button]").css({
  												visibility:'hidden'
  					                    	});
	  				                    	a.children().eq(12).find("button[name=button]").css({
	  				                    		visibility:'hidden'
	  				                    	});
	  				                    	
 										}				                		
				                	}
				                });     
// 				                alert('승인완료');
		                         
		                    },
		                    error       :   function(request, status, error){
		                    	alert('에러');
		                    }
		                });
		                
					}
	            })
	            
	        });		
		
		</script>
		
	</body>
</html>