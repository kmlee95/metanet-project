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
         numberOfMonths : 2,
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
         //          maxDate : "+1M +20D",
         // 주 표시
         showWeek : true
      };
   
      var optionFrom = option;
      var dateFormat = "yy-mm-dd";

      // 시작일이 선택이 되면 종료일은 시작일 보다 앞을 선택할 수 없다.
      var from = $("#va_start_date").datepicker(optionFrom).on("change",
            function() {
               to.datepicker("option", "minDate", getDate(this));
            });
      
      var optionTo = option;
      // 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없다.
      var to = $("#va_end_date").datepicker(optionTo).on("change",
            function() {
               from.datepicker("option", "maxDate", getDate(this));
            });

      function getDate(element) {
         return moment(element.value).toDate();
      }
   });


   // 공휴일 변수
   var natDays = [ 
          [ 2019, 12, 25, 'ko', '크리스마스' ],
         [ 2020, 01, 01, 'ko', '신정' ], 
         [ 2020, 01, 24, 'ko', '설날' ],
         [ 2020, 01, 27, 'ko', '대체휴일' ] 
   ];

   //공휴일 선택 false
   function nationalDays() {

      var listDate = [];
      getDateRange(start, end, listDate);

      // 공휴일 포함여부 계산
      for (i = 0; i < listDate.length; i++) {
         for (j = 0; j < natDays.length; j++) {
            if (new Date(listDate[i]).getFullYear() == natDays[j][0]
                  && new Date(listDate[i]).getMonth() == natDays[j][1] - 1
                  && new Date(listDate[i]).getDate() == natDays[j][2]) {

               return [ false, ' '];
            }
         }
      }
      return [ true, '' ];
   }

   // 휴가 날짜수 구하기
   function getDateRange(startDate, endDate, listDate) {
      var dateMove = new Date(startDate);
      var strDate = startDate;

      if (startDate == endDate) {
         var strDate = dateMove.toISOString().slice(0, 10);
         listDate.push(strDate);
      } else {
         while (strDate < endDate) {
            var strDate = dateMove.toISOString().slice(0, 10);
            listDate.push(strDate);
            dateMove.setDate(dateMove.getDate() + 1);
         }
      }
      return listDate;
   }

   // 휴가일수 계산, 주말 제외
   function calcDate() {

      var start = document.getElementById("va_start_date").value;
      var end = document.getElementById("va_end_date").value;

      var ar1 = start.split('-');
      var ar2 = end.split('-');

      var day1 = new Date(ar1[0], ar1[1] - 1, ar1[2]); // 월 계산 조심!
      var day2 = new Date(ar2[0], ar2[1] - 1, ar2[2]);

      var diff = day2.getTime() - day1.getTime();
      var cDay = 24 * 60 * 60 * 1000; // 시 * 분 * 초 * 밀리세컨

      var days = Math.ceil(diff / cDay) + 1;

      // Subtract two weekend days for every week in between
      var weeks = Math.floor(days / 7);
      var days = days - (weeks * 2);

      // Handle special cases  // 일요일에서 토요일까지 0 ~ 6
      var startDay = day1.getDay();
      var endDay = day2.getDay();

      // Remove weekend not previously removed. 
      if (startDay - endDay > 1)
         var days = days - 2;

      // 휴가 시작날이 주말이면 빼기
      if (startDay == 0 && endDay != 6)
         var days = days - 1;

      // 휴가 마지막날이 주말이면 빼기
      if (endDay == 6 && startDay != 0)
         var days = days - 1;

      var listDate = [];
      getDateRange(start, end, listDate);

      // 공휴일 포함여부 계산
      var cnt = 0;
      var holi = [];

      for (i = 0; i < listDate.length; i++) {
         for (j = 0; j < natDays.length; j++) {
            if (new Date(listDate[i]).getFullYear() == natDays[j][0]
                  && new Date(listDate[i]).getMonth() == natDays[j][1] - 1
                  && new Date(listDate[i]).getDate() == natDays[j][2]) {
               holi.push(natDays[j][4]);
               cnt++;
            }
         }
      }

       var codeOption = $("#vk_code option:selected").text();
         
      // 계산한 결과 text 삽입
      if(codeOption =="반차" ){
         document.getElementById('va_end_date').value = start;
         document.getElementById('va_days_num').value = 0.5;
         return false;
      }
      if (start && end ) {
         
         document.getElementById('va_days_num').value = (days - cnt);
         document.getElementById('holiday').value = holi;
      
      }
   }

   var oldVal = "";
   $(document).ready(function(){
      
   $("#va_days_num").on("propertychange change keyup paste input blur focus", function() {
       var currentVal = parseInt($(this).val());
       
      if(currentVal == oldVal) {
           return;
       }
      else {
      var tr = $("#myinfo tbody tr");
      var td = tr.children();

      var my_res_date = parseInt(td.eq(5).data('val'));
      var va_days_num = parseInt($('#va_days_num').val());

      if (currentVal <= my_res_date) {
         $('#check_res_day').hide();
      } 
      else if (currentVal > my_res_date) {
         $('#check_res_day').show();
         $('#check_res_day').text('*남은 휴가일수가 더 적습니다 :)');
         $('#check_res_day').css('color', 'red');
      }
      else if ( my_res_date == ""){
         $('#check_res_day').show();
         $('#check_res_day').text('*남은 휴가일수가 없습니다 :)');
         $('#check_res_day').css('color', 'red');
         }

      }
      });
   });

   // 반차 선택시 휴가 종류 선택 창 숨기기
   function SetSelectBox() {
      var codeOption = $("#vk_code option:selected").text();
      if (codeOption == "반차") {
         $("#end").hide();
         document.getElementById('va_days_num').value = 0.5;
         $("va_end_date").attr("disabled",true).attr("readonly",false);

      } else {
         $("#end").show();
      }
   }

   // 시작날짜, 종료날짜, 휴가 사유 미입력시 실행
   $(document).ready(function() {

      $("#va_start_date").on("propertychange change keyup paste input blur", function() {
          var currentVal = $(this).val();

         if (currentVal == null || currentVal == "") {
            $('#check_start').text('*시작날짜를 입력해주세요 :)');
            $('#check_start').css('color', 'red');
         }else{
            $('#check_start').text(' ');
               }
      });
      
      $("#va_end_date").on("propertychange change keyup paste input blur", function() {
          var currentVal = $(this).val();

         if (currentVal == null || currentVal == "") {
            $('#check_end').text('*종료날짜를 입력해주세요 :)');
            $('#check_end').css('color', 'red');
         }else{
            $('#check_end').text(' ');
               }
      });
      
      $("#va_reason").on("propertychange change keyup paste input blur", function() {
          var currentVal = $(this).val();

         if (currentVal == null || currentVal == "") {
            $('#check_Reason').text('*휴가사유를 입력해주세요 :)');
            $('#check_Reason').css('color', 'red');
         }else{
            $('#check_Reason').text(' ');
         }
      });
   });
</script>
</head>

<style type="text/css">
.ui-datepicker-week-end{ color: red; }
.ui-datepicker-week-end .ui-state-default { color: red; } 
.ko_day { text-indent : -9999px; background: #eee url(/imgs/korea.png) no-repeat center;}

.applyform>div>label {
   max-width: 100%;
   margin: 1px;
   padding: 0;
   font-weight: bold;
}

.form-control {
   width: 50%;
}

.form-group-div> div >input {
   border-radius: .25rem;
   border-style: groove;
   border: 1px solid #ced4da;
   padding: .375rem .75rem;
   font-size: 1rem;
   font-weight: 400;
   line-height: 1.5;
   color: #495057;
   background-color: #fff;
   background-clip: padding-box;
   margin-bottom : 5px;
   width: 150px;
}

img {
   margin : 5px;
}

.table td, .table th{ text-align : center;}
 div .check_font { font-size: smaller;}
 
</style>
</head>

<body>

   <div style="max-width: 83%; margin: 0 auto; margin-right: 0px;">

      <form role="form" class="form-horizontal applyform" id="applyform" name="applyform" method="post">
           <input type="hidden" name="va_code" id="va_code" value="" />
               
         <div class="form-group">
            <label class="control-label col-sm-3">신청년도 <span class="text-danger">*</span></label>
            <div class="form-group-div" style="width: 200px">
                   <jsp:useBean id="now" class="java.util.Date" />
                      <fmt:formatDate value="${now}" pattern="yyyy" var="today" />
               <input type="text" id="year" name="va_year" size="10" value="<c:out value="${today}"/>"placeholder="2019"
                  style="border-radius: .25rem; border-style: groove; 
                         border: 1px solid #ced4da; padding: .375rem .75rem; 
                         font-size: 1rem; font-weight: 400; line-height: 1.5;
                         color: #495057; background-color: #fff; 
                         background-clip: padding-box; width:150px;" />
            </div>
         </div>


         <div class="form-group">
            <label class="control-label col-sm-3">휴가유형 <span class="text-danger">*</span></label>
            <div class="form-group-div">
               <select class="form-control" name="vk_code" id="vk_code"  onchange="SetSelectBox();" style="width: 150px">
                  <c:forEach items="${codelist}" var="list">
                     <option id="code" value="${list.code}">${list.code_name}</option>
                  </c:forEach>
               </select>
            </div>
         </div>

         <div class="form-group">
            <label class="control-label col-sm-3">휴가기간 <span
               class="text-danger">*</span></label>

              <div class="form-group-div" style="width:100%; ">
                <div style="float:letf;" id="start"> 
                   <input type="text" id="va_start_date" name="va_start_date" size="10"  onchange="calcDate();" 
                          placeholder="Start"> </div>
                    <div  class="check_font" id="check_start"></div> 
                 <div style="float:letf;" id="end"> 
                   <input type="text" id="va_end_date" name="va_end_date" size="10"  onchange="calcDate();" 
                          placeholder="End"> 
                   <div  class="check_font" id="check_end"></div>
                 </div>
              </div>
         </div>

         <div class="form-group">
            <label class="control-label col-sm-3">휴가일수 <span class="text-danger">*</span></label>

            <div class="form-group-div">
               <input class="form-control" type="text" id="va_days_num" name="va_days_num" 
                 
                  style="width: 300px;" placeholder="Date"/>
            </div>
            <span class="check_font" id="check_res_day"></span>
             
         </div>
         
         <div class="form-group">
            <label class="control-label col-sm-3">포함 공유일 </label>

            <div class="form-group-div">
               <input class="form-control" type="text" id="holiday" name="holiday"
                  style="width: 300px;" placeholder="Holiday"/>
            </div>
         </div>

         <div class="form-group">
            <label class="control-label col-sm-3">휴가사유<span
               class="text-danger"> *</span></label>

            <div class="form-group-div">
               <textarea class="form-control" id="va_reason" name="va_reason" onchange="noSpaceForm();"
                  placeholder="Reason" style="width: 300px; height: 100px"></textarea>
            </div>
               <div class="check_font" id="check_Reason"></div>
         </div>

      </form>
   </div>
</body>
</html>