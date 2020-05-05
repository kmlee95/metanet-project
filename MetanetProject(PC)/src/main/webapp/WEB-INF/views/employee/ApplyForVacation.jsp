<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="java.util.Date"%>

<%@ page session="true"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>APPLY FOR VACATION</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- apply_for_vacation css -->
<link href="/resources/css/apply_for_vacation.css" rel="stylesheet">
<!-- jqeury -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>

<script type="text/javascript">
var action = '';
var url = '';
var type = '';
var va_code = 0;

$(document).ready(function() {

                  // 모달창 취소 버튼
                  $("#btnCancle").click(function() {
                     alert("취소합니다");
                  });
                  
                        // 휴가 신청 내역 삭제 코드
                  $(".deleteApply")
                        .click(
                              function() {
                                 var va_code = $(this).attr('id');
                                 location.href = "/login/employee/applyforvacation/delete?va_code="
                                       + va_code;
                              });

                  // 새 글 쓰기 버튼 클릭
                  $("#createBtn").click(function() {
                     action = 'create';
                     $("#exampleModalLabel").text("휴가 신청");
                     $(".applyform").each(function() {
                        this.reset();
                     });
                     $('.check_font').text('');
                  });

                  // 수정하기 버튼 클릭
                  $("button[name='update']").click(function() {
                     action = 'update';
                     url = "/login/employee/applyforvacation/update";
                     va_code = $(this).attr('id');
                     $("#exampleModalLabel").text("수정하기");

                     // form input hidden에 'va_code' 전달
                     $("form[role='form'] #va_code").val(va_code);

                     var row = $(this).parent().parent();
                     var tr = row.children();

                     var va_start_date = tr.eq(1).text();
                     var va_end_date = tr.eq(2).text();

                     var vk_code = tr.eq(3).attr('id');

                     var va_days_num = parseFloat(tr.eq(4).attr('id'));

                     var vk_code_name = tr.eq(3).text();
                     var va_reason = tr.eq(4).text();

                     $("#va_start_date").val(va_start_date);
                     $("#va_end_date").val(va_end_date);
                     $("#vk_code").val(vk_code).prop("selected", true);
                     $("#va_days_num").val(va_days_num);
                     $("#va_reason").val(va_reason);

                  });

                  var formObj = $("form[role='form']");
                  var form = document.applyform;

                  // Modal창의 신청 버튼 클릭
                  $("#btnApply")
                        .click(
                              function() {
                                 formObj
                                       .attr("action",
                                             "/login/employee/applyforvacation/");

                                 var tr = $("#myinfo tbody tr");
                                 var td = tr.children();

                                 var my_res_date = parseInt(td.eq(5)
                                       .data('val'));
                                 var va_days_num = parseInt($(
                                       '#va_days_num').val());

                                 if (action == "create") {
                                    if (form.va_start_date.value == ""
                                          || form.va_end_date.value == ""
                                          || form.va_reason.value == "") {

                                       if (form.va_start_date.value == "") {
                                          alert("휴가시작날짜를 입력해주세요")
                                          return form.va_start_date
                                                .focus();
                                       } else if (form.va_end_date.value == "") {
                                          alert("휴가종료날짜를 입력해주세요")
                                          return form.va_end_date
                                                .focus();

                                       } else if (form.va_reason.value == "") {
                                          alert("휴가사유를 입력해주세요")
                                          return form.va_reason
                                                .focus();
                                       }
                                    } else if (parseInt(form.va_days_num.value) > my_res_date) {
                                       alert("휴가 일수를 확인해주세요")
                                       return form.va_days_num
                                             .focus();
                                    } else {
                                       formObj.submit();
                                    }

                                 } else if (action == 'update') {
                                    formObj.attr("action","/login/employee/applyforvacation/update");
                                    var reasonCheck = form.va_reason.value;
                                    
                                    if (form.va_start_date.value == ""
                                       || form.va_end_date.value == ""
                                       || reasonCheck.trim()== "") {

                                       if (form.va_start_date.value == "") {
                                          alert("휴가시작날짜를 입력해주세요")
                                          return form.va_start_date.focus();
                                       
                                       } else if (form.va_end_date.value == "") {
                                          alert("휴가종료날짜를 입력해주세요")
                                          return form.va_end_date.focus();

                                       } else if (reasonCheck.trim() == "") {
                                          alert("휴가사유를 입력해주세요")
                                          return form.va_reason.focus();
                                       }
                                 } else if (parseInt(form.va_days_num.value) > my_res_date) {
                                    alert("휴가 일수를 확인해주세요")
                                    return form.va_days_num.focus();
                                    
                                 } else {
                                    formObj.submit();
                                 }
                                 }
                              });

               });


   //공백 사용 못 하게
   function noSpaceForm(obj) {
      var str_space = /\s/; // 공백 체크
      if (str_space.exec(obj.value)) { // 공백 체크
         alert("해당 항목에는 공백을 사용할 수 없습니다.\n\n공백 제거됩니다.");
         obj.focus();
         obj.value = obj.value.replace(' ', ''); // 공백제거
         return false;
      }
   }
</script>


<body>
   <%@ include file="../mainbar.jsp"%>
   <div class="container" style="margin-top: 10px;">
      <div class="card">

         <div class="form-group">
            <h3>휴가 신청</h3>
            <div class="tablebox">
               <table id="myinfo" class="table">
                  <thead class="thead-light">
                     <tr>
                        <th scope="col">이름</th>
                        <th scope="col">회사명</th>
                        <th scope="col">직급</th>
                        <th scope="col">입사일자</th>
                        <th scope="col">상위자</th>
                        <th scope="col">남은 휴가일수</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${myinfo }" var="list">
                     <tr>
                        <td>${list.name }</td>
                        <td>${list.org_name } - ${list.org_code_name}</td>
                        <td>${list.emp_rank }</td>
                        <td>${list.join_date }</td>
                        <td>${list.upper_name }</td>
                        <td data-val="${list.res_days_num }">${list.res_days_num }</td>
                     </tr>
                     
                     </c:forEach>
                  </tbody>
               </table>
               <!-- Button trigger modal -->
               <button type="button" class="btn btn-secondary btn-apply" id="createBtn" 
                   data-toggle="modal" data-target="#exampleModal" color="#e9ecef"
                   >휴가 신청</button>


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
                        
                        <div class="modal-body" id="modal_body">
                           <jsp:include page="ApplySubmit.jsp"/>
                        </div>
                        
                        <div class="modal-footer" style="background:#dee2e6">
                           <button type="button" id="btnCancle" class="btn btn-secondary"
                              data-dismiss="modal" >취소</button>
                           <button type="button"  name="btnApply" id="btnApply" class="btn btn-primary">신청</button>
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
                        <th scope="col">발생일</th>
                        <th scope="col">휴가시작일</th>
                        <th scope="col">휴가종료일</th>
                        <th scope="col">휴가유형</th>
                        <th scope="col">휴가사유</th>
                        <th scope="col">상위자</th>
                        <th scope="col">상태</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${applyList }" var="list">
                     <c:set var="vs_code_name" value="${list.vs_code_name }" />
                     <c:set var="vs_code" value="${list.vs_code}" />
                        <tr>
                           <td>${list.va_reg_date }</td>
                           <td>${list.va_start_date } </td> 
                            <td>${list.va_end_date }</td>
                           <td id="${list.vk_code }"> ${list.vk_code_name }</td>
                           <td id='${list.va_days_num }'> ${list.va_reason }</td>
                           <td> ${list.upper_emp_name }</td>
                           <td> ${vs_code_name }</td>
                           <td><c:choose>
                        
                              <c:when test="${vs_code_name eq '대기'}">
                                 <button name="update"  
<%--                                  href="/login/employee/applyforvacation/view?va_code=${list.va_code }" --%>
                                     data-toggle="modal" data-target="#exampleModal"
                                        class="btn btn-outline-secondary updateApply"
                                       id="${list.va_code }"
                                       value="${list.va_code }"
                                       type="button">수정</button>
                                 </c:when>

                                 <c:when test="${vs_code_name eq '반려'}">
                                    <button  
                                        class="btn btn-outline-secondary no" 
                                    
                                        id="${list.va_code }"
                                        type="button">수정불가</button>
                                 </c:when>
                                 
                                 <c:when test="${vs_code_name eq '승인'}">
                                    <button type="button" id="${list.va_code }"
                                       class="btn btn-outline-secondary no">수정불가</button>
                                 </c:when>
                              </c:choose>
                              </td>
                              
                           <td>
                              <c:choose>
                                 <c:when test="${vs_code_name eq '대기'}">
                                    <button name="delete"
                                        type="button" 
                                        id="${list.va_code }"
                                       class="btn btn-outline-secondary deleteApply">삭제</button>
                                 </c:when>

                                 <c:when test="${vs_code_name eq '반려'}">
                                    <button type="button" id="${list.va_code }" 
                                       class="btn btn-outline-secondary no">삭제불가</button>
                                 </c:when>
                                 
                                 <c:when test="${vs_code_name eq '승인'}">
                                    <button type="button" id="${list.va_code }" 
                                       class="btn btn-outline-secondary no">삭제불가</button>
                                 </c:when>
                              </c:choose>
                           </td>
                        </tr> 
                     
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   
</body>