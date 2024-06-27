<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" /> 
<link rel="stylesheet" href="../css/layouts.css" />
<link rel="stylesheet" href="../css/swiper.css" />
<script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/zipCheck.js"></script>
<script type="text/javascript" src="js/member.js"></script>

<!-- <input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소"><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="hidden" id="sample6_extraAddress" placeholder="참고항목"> -->

<body>

	<header class="mb-5 mt-5">
	<div class="--content d-flex justify-content-between border border-dark">
		<div class="--logo">
			<div class="--logo-img"><a href="/">로고</a></div>
		</div>
		<div class="--navbar">
			<ul class="m-0 p-0 d-inline-flex">
				<c:choose>
		       <c:when test="${ssKey!=null and ssKey.m_role=='admin'}">
					<li class="--nav-item dropdown"><a>ADMINPAGE</a></li>
					<li class="--nav-item dropdown"><a href="/memberFix">MemberFIX</a></li>
					<li class="--nav-item dropdown"><a href="/deliveryFix">DeliveryFIX</a></li>
					<li class="--nav-item dropdown"><a href="/productMgt">ProductFIX</a></li>
					<li class="--nav-item dropdown"><a href="/admin/noticeFIX">NoticeFIX</a></li>
					<li class="--nav-item dropdown"><a href="/logoutProc">Logout</a></li>	
				</c:when>
		        <c:when test="${ssKey!=null and ssKey.m_role=='mem'}">
					<li class="--nav-item dropdown"><a href="/main">Home</a></li>
					<li class="--nav-item dropdown"><a href="/cart">Cart</a></li>
					<li class="--nav-item dropdown"><a href="/info">MyPage</a></li>
					<li class="--nav-item dropdown"><a href="/noticeFIX">Notice</a></li>
					<li class="--nav-item dropdown"><a href="/logoutProc">Logout</a></li>
				</c:when>
				<c:otherwise>
					<li class="--nav-item dropdown"><a href="/login">Login</a></li>
					<li class="--nav-item dropdown"><a href="/join">Join</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<div class="--content d-flex justify-content-center border border-dark">
		<div class="--navbar d-inline-flex flex-row">
			<ul class="m-0 p-0 d-inline-flex --bs-gray">
				<li class="--nav-item dropdown"><a>Item1</a>
					<div class="dropdown-content">
				      <a href="#">Link 1</a>
				      <a href="#">Link 2</a>
				      <a href="#">Link 3</a>
				    </div>
				</li>
				<li class="--nav-item dropdown"><a href="/productList">itemList</a></li>
				<li class="--nav-item dropdown"><a>Item1</a></li>
				<li class="--nav-item dropdown"><a>Item1</a></li>
				<li class="--nav-item dropdown"><a>Item1</a></li>
			</ul>

		</div>
	</div>
	<div class="MainBanner mt-4 mb-4">
		<h1 class="High-Banner">IPHONE & GALAXY COVERS</h1>
		<p>Buy One Case and Get 30% Off the Second Purchase! ... <a>Read more</a></p>
	</div>
</header>
</body>