<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>


<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<title>Portfolio</title>

<!-- jquery cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- icon -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<!-- fonts -->
<link href="https://fonts.googleapis.com/css?family=Heebo|Noto+Sans+KR"
	rel="stylesheet">

<!-- login css -->
<link href="/resources/css/userinfo.css" rel="stylesheet">

</head>
<body>
	<%@ include file="../mainbar.jsp"%>
	<script>
		$(document)
				.ready(
						function() {
							$.fn.countTo = function(options) {
								options = options || {};

								return $(this)
										.each(
												function() {
													var settings = $
															.extend(
																	{},
																	$.fn.countTo.defaults,
																	{
																		from : $(
																				this)
																				.data(
																						'from'),
																		to : $(
																				this)
																				.data(
																						'to'),
																		speed : $(
																				this)
																				.data(
																						'speed'),
																		refreshInterval : $(
																				this)
																				.data(
																						'refresh-interval'),
																		decimals : $(
																				this)
																				.data(
																						'decimals')
																	}, options);
													var loops = Math
															.ceil(settings.speed
																	/ settings.refreshInterval), increment = (settings.to - settings.from)
															/ loops;

													var self = this, $self = $(this), loopCount = 0, value = settings.from, data = $self
															.data('countTo')
															|| {};

													$self.data('countTo', data);
													if (data.interval) {
														clearInterval(data.interval);
													}
													data.interval = setInterval(
															updateTimer,
															settings.refreshInterval);
													render(value);
													function updateTimer() {
														value += increment;
														loopCount++;
														render(value);
														if (typeof (settings.onUpdate) == 'function') {
															settings.onUpdate
																	.call(self,
																			value);
														}
														if (loopCount >= loops) {
															$self
																	.removeData('countTo');
															clearInterval(data.interval);
															value = settings.to;

															if (typeof (settings.onComplete) == 'function') {
																settings.onComplete
																		.call(
																				self,
																				value);
															}
														}
													}
													function render(value) {
														var formattedValue = settings.formatter
																.call(self,
																		value,
																		settings);
														$self
																.html(formattedValue);
													}
												});
							};

							$.fn.countTo.defaults = {
								from : 0,
								to : 0,
								speed : 1000,
								refreshInterval : 100,
								decimals : 0,
								formatter : formatter,
								onUpdate : null,
								onComplete : null
							};

							function formatter(value, settings) {
								return value.toFixed(settings.decimals);
							}
							$('.count-number').data(
									'countToOptions',
									{
										formatter : function(value, options) {
											return value.toFixed(
													options.decimals).replace(
													/\B(?=(?:\d{3})+(?!\d))/g,
													',');
										}
									});

							$('.timer').each(count);
							function count(options) {
								var $this = $(this);
								options = $.extend({}, options || {}, $this
										.data('countToOptions')
										|| {});
								$this.countTo(options);
							}
						});
	</script>

	<div class="container" style="margin-top: 10px;">
		<div class="card">
			<div class="section-container">
				<section class="about-area" id="about">
					<h1 class="entry-title">
						<span>USERINFO</span>
					</h1>
					<hr>
					<div class="picture">
						<img src="/resources/img/program.jpg">
						<div class="name">${member.name}<p style="font-size: 12px; display:inline;">님
								환영합니다.</p>
						</div>
						<div class="description">사원코드 : ${member.emp_code}</div>
					</div>
					<div class="text">
						<div class="notice notice-info">
							<ul>
								<li>
									<div class="info">
										<i class="far fa-building"></i> 직위 : ${member.emp_rank}
									</div>
								</li>
								<li>
									<div class="info">
										<i class="fas fa-sitemap"></i> 조직 이름 : ${member.org_name}
									</div>
								</li>
								<li>
									<div class="info">
										<i class="fas fa-sitemap"></i> 조직 구분 : ${member.org_div}
									</div>
								</li>
								<li>
									<div class="info">
										<i class="fas fa-sitemap"></i>
										<c:if test="${member.org_upper != null}">
									 	상위 조직 : ${member.org_upper}
									 </c:if>
										<c:if test="${member.org_upper == null}">
										상위 조직 : 상위 조직이 존재하지 않습니다.
									</c:if>
									</div>
								</li>
							</ul>
						</div>
						<div class="notice notice-info">
							<ul>
								<li>
									<div class="info">
										<i class="far fa-calendar-alt"></i> 입사일 : ${member.join_date}
									</div>
								</li>
								<li>
									<div class="info">
										<i class="fas fa-phone"></i> ${member.phone}
									</div>
								</li>
								<li>
									<div class="info">
										<i class="fas fa-envelope"></i> ${member.id}
									</div>
								</li>
								<li>
									<div class="info">
										<i class="fas fa-home"></i> 102, Bongeunsa-ro, Gangnam-gu,
										Seoul, Republic of Korea
									</div>
								</li>
							</ul>
						</div>

					</div>

				</section>
				<div style="padding: 0 30px 30px 30px;">
					<div class="row">
						<br />
						<div class="col text-center">
							<h2>개인 휴가 정보</h2>
							<p>발생일 수, 사용일 수, 잔여일 수 표시</p>
						</div>
					</div>
					<div class="row text-center">
						<div class="col">
							<div class="counter">
								<i class="fas fa-umbrella-beach fa-2x"></i>
								<h2 class="timer count-title count-number"
									data-to="${member.acq_days_num}" data-speed="1500"></h2>
								<p class="count-text ">휴가 발생일 수</p>
							</div>
						</div>
						<div class="col">
							<div class="counter">
								<i class="fas fa-plane fa-2x"></i>
								<h2 class="timer count-title count-number"
									data-to="${member.use_days_num}" data-speed="1500"></h2>
								<p class="count-text ">휴가 사용일 수</p>
							</div>
						</div>
						<div class="col">
							<div class="counter">
								<i class="far fa-sad-tear fa-2x"></i>
								<h2 class="timer count-title count-number"
									data-to="${member.res_days_num}" data-speed="1500"></h2>
								<p class="count-text ">휴가 잔여일 수</p>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>
</body>
</html>