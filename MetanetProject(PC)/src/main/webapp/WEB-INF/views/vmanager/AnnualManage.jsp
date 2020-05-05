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

      var acq_days_num = 0;
      var res_days_num = 0;
      var use_days_num = 0;

   // 연차관리 수정버튼 코드
   $(document).ready(function(){
      $("button[name=modify]").on("click", function(){

         var tr = $(this).parent().parent();
         acq_days_num = prompt("부여할 연차를 입력해주세요.");

         if (acq_days_num == "") {
            return;
         } else if (acq_days_num == null) { //취소를 누를 경우
            return;
         } else {
            var emp_code = tr.children().eq(1).text();
            use_days_num = parseInt(tr.children().eq(7).text());
            alert("수정되었습니다.");
         }

         // 잔여 일수 계산
         acq_days_num = parseInt(acq_days_num);
         acq_days_num = acq_days_num.toFixed(1);
         use_days_num = use_days_num.toFixed(1);
         res_days_num = (acq_days_num - use_days_num).toFixed(1);

         $.ajax({
            type : "post",
            url : "/login/vmanager/vmanagelist/update",
            data : {
               "acq_days_num" : acq_days_num,
               "use_days_num" : use_days_num,
               "res_days_num" : res_days_num,
               "emp_code" : emp_code
            },
            dataType : "text",
            success : function(res) {
               console.log("성공");
               console.log(acq_days_num);
                  
               tr.children().eq(6).html(acq_days_num);
               tr.children().eq(7).text(use_days_num);
               tr.children().eq(8).text(res_days_num);
            },
            error : function(e) {
               console.log("실패");
               console.log(e);
               console.log(emp_code);
               console.log(acq_days_num);
               console.log(use_days_num);
               console.log(res_days_num);
            }
         });
      });

      
        // 일과 부여 코드
      $("#annualBtn").click(function(){
           var array = [];
           var date = 15.0;
           var checkbox = $("input[name=v_checkbox]:checked");
           checkbox.each(function(i){
              var index = checkbox.eq(i).parent().next().text(); // 체크된 것의 emp_code 값
              array.push(index);
           })
           $.ajax({ 
              url: "/login/vmanager/annual/check", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
              dataType: "text", // HTTP 요청과 함께 서버로 보낼 데이터
              method: "post", // HTTP 요청 메소드(GET, POST 등) 
              data : {
                 annualArr :  array
                  },
              success: function(data) {
                alert("기본 연차로 부여 완료했습니다.");
                date = date.toFixed(1);
                use_days_num = use_days_num.toFixed(1);
                  res_days_num = date;
                 
                $('#aTable tr').filter(':has(:checkbox:checked)').each(function() {
                   var chk = $(this);
                   if (chk.attr('id') == "vacation") {
                      chk.children().eq(6).text(date);
                      chk.children().eq(7).text(use_days_num);
                      chk.children().eq(8).text(res_days_num);
                   }
                });
               }
               , error: function(e) {
                   alert(" ");
               }
           });
        });
   });


   //checkbox 전체 선택 또는 전체 해제
   function checkall() {
      if ($("#check_all").is(':checked')) {
         $("input[name=v_checkbox]").prop("checked", true);
      } else { //전체 해제
         $("input[name=v_checkbox]").prop("checked", false);
      }
   }

   //검색
   function nameSearch() {
      var name = document.getElementById("search_name").value;
      //DB 연결 전 임시
      if (name.length <= 0) { //빈칸으로 입력할 경우
         alert("검색할 이름을 입력해주세요.");
         return;
      } else
         alert(name);
   }
</script>
</head>

<body>
   <script>
      $(document).ready(function() {
         $("#button-addon2").click(function(e) {
            e.preventDefault();
            var url = "/login/vmanager/vmanagerAnnual";
            url = url + "?searchType=" + $('#searchType').val();
            url = url + "&keyword=" + $('#keyword').val();
            location.href = url;
         });
      });
   </script>
   <%@ include file="../mainbar.jsp"%>


   <div class="container" style="margin-top: 10px;">
      <div class="card">
         <div style="width: 100%">
            <div>
               <div class="title">
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
                              id="button-addon2" style="width: 100px">search</button>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="btnSave">
                  <button class="btn btn-outline-secondary" type="button"
                     id="annualBtn" style="margin: 15px;" >일괄 부여</button>
               </div>
               <div class="tableBox">
                <form action="/login/vmanager/vmanagelist/update" method="post" >
                  <table class="table" id="aTable">
                     <thead class="thead-light">
                        <tr>
                           <th>
                              <input type = "checkbox" name = "check_all" value="checkbox" 
                                 id="check_all"  onclick= "checkall();"/> <br/>
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
                      <c:forEach items="${vmAnnual}" var="list2">
                        <tr id="vacation">
                           <td>
                                 <input type = "checkbox" name = "v_checkbox" value="checkbox" /> <br/>
                           </td>
                           <td>${list2.emp_code }</td>
                           <td>${list2.name }</td>
                           <td>${list2.org_div }</td>
                           <td>${list2.emp_rank }</td>
                           <td>${list2.join_date }</td>
                           <td>${list2.acq_days_num }</td>
                           <td>${list2.use_days_num }</td> 
                           <td>${list2.res_days_num }</td>
                           <td>
                              <button name="modify" class="btn btn-outline-secondary" type="button"
                                    id="btnUpdate">수정</button>
                           </td>
                        </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>