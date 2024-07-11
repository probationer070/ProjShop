<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../css/bootstrap.min.css" /> 
<link rel="stylesheet" href="../css/layouts.css" />
<link rel="stylesheet" href="../css/swiper.css" />
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/zipCheck.js"></script>
<script type="text/javascript" src="../js/member.js"></script>

<!-- <input type="text" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample6_address" placeholder="주소"><br>
<input type="text" id="sample6_detailAddress" placeholder="상세주소">
<input type="hidden" id="sample6_extraAddress" placeholder="참고항목"> -->

<body>

	<header class="mb-5 mt-5">
		<div class="header__container">
			<div class="--logo-img">
				<a href="/"><img class="logo" src="../images/logo-no-background.png"></a>
			</div>
			<div class="header__right">
				<div class="header__search-container hide-phone" id="searchContainer">
					<form class="search" role="search" action="/search" method="get">
						<div class="input-placeholder input-placeholder--search">
						<label class="search__label search__floating-label screenreader" for="searchInput">Search</label>
						<div class="search__suggested-text js-search-suggested-text screenreader"></div>
						<input class="input search__input" id="searchInput-headerSearchDesktop" type="search" role="combobox" 
						aria-controls="autocompleteItems" aria-owns="autocompleteItems" placeholder="Search" name="q">
						</div>
						<button class="search__input-button js-search btn-icon" 
							id="searchMenuBtn" type="button" title="Search">
							<img class="search__icon icon icon--search" src="../images/search2.svg">
							<span class="screenreader">Search</span>
						</button>
					</form>
				</div>
				<div class="dropdown-user">
					<div class="header__account-btn btn btn-icon">
						<img class="icon" src="../images/user2.svg">
					</div>
					<div class="dropdown-content">
					<ul class="m-0 p-0 d-flex flex-column">
					<c:choose>
						 <c:when test="${ssKey!=null and ssKey.m_role=='admin'}">
						 	<li class="--nav-item dropdown"><a href="/admin/info">AdminPage</a></li>
						 	<li class="--nav-item dropdown"><a href="/memberFIX">MemberFIX</a></li>
							<li class="--nav-item dropdown"><a href="/orderFIX">OrderFIX</a></li>
							<li class="--nav-item dropdown"><a href="/productFIX">ProductFIX</a></li>
							<li class="--nav-item dropdown"><a href="/noticeFIX">NoticeFIX</a></li>
						  	<li class="--nav-item dropdown"><a href="/logoutProc">Logout</a></li>
						 </c:when>
					     <c:when test="${ssKey!=null and ssKey.m_role=='mem'}">
					      	<li class="--nav-item dropdown"><a href="/logoutProc">Logout</a></li>
					      	<li class="--nav-item dropdown"><a href="/orderList">Order</a></li>
							<li class="--nav-item dropdown"><a href="/info">MyPage</a></li>
							<li class="--nav-item dropdown"><a href="/notice">Notice</a></li>
					     </c:when>
					     <c:otherwise>
							<li class="--nav-item dropdown"><a href="/login">Login</a></li>
							<li class="--nav-item dropdown"><a href="/join">Join</a></li>
						 </c:otherwise>
					 </c:choose>
					 </ul>
				    </div>
				</div>
				<div class="header__cart-btn-wrapper">
					<a class="header__cart-btn btn btn-icon" href="/orderFIX" aria-label="0 item(s) in your bag">
						<img class="cart-icon" src="../images/cart2.svg">
					</a>
					<span class="header__cart-count" id="bagBtnCount" style="display: none;">
					 	0
					</span>
				</div>
				<div class="header__hamburger-menu-wrapper phone-only">
					<button class="header__hamburger-menu-btn btn-icon js-mobile-nav-trigger" type="button">
					 <i class="icon icon--menu js-mobile-nav-icon"></i>
					</button>
				</div>
			</div>	
		</div>
	<%-- <div class="--content d-flex justify-content-between border border-dark">
		<div class="--logo">
			<div class="--logo-img"><a href="/"><img class="logo" src="../images/logo-no-background.png"></a></div>
		</div>
		<div class="--navbar">
			<ul class="m-0 p-0 d-inline-flex">
				<c:choose>
		       <c:when test="${ssKey!=null and ssKey.m_role=='admin'}">
					<li class="--nav-item dropdown"><a href="/admin/info">ADMINPAGE</a></li>
					<li class="--nav-item dropdown"><a href="/memberFIX">MemberFIX</a></li>
					<li class="--nav-item dropdown"><a href="/orderFIX">OrderFIX</a></li>
					<li class="--nav-item dropdown"><a href="/productFIX">ProductFIX</a></li>
					<li class="--nav-item dropdown"><a href="/noticeFIX">NoticeFIX</a></li>
					<li class="--nav-item dropdown"><a href="/logoutProc">Logout</a></li>	
				</c:when>
		        <c:when test="${ssKey!=null and ssKey.m_role=='mem'}">
					<li class="--nav-item dropdown"><a href="/">Home</a></li>
					<li class="--nav-item dropdown"><a href="/cartlist">Cart</a></li>
					<li class="--nav-item dropdown"><a href="/orderList">Order</a></li>
					<li class="--nav-item dropdown"><a href="/info">MyPage</a></li>
					<li class="--nav-item dropdown"><a href="/notice">Notice</a></li>
					<li class="--nav-item dropdown"><a href="/logoutProc">Logout</a></li>
				</c:when>
				<c:otherwise>
					<li class="--nav-item dropdown"><a href="/login">Login</a></li>
					<li class="--nav-item dropdown"><a href="/join">Join</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div> --%>
	<div class="--content d-flex justify-content-center border border-dark mt-1">
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
	<div class="MainBanner mt-5 mb-5">
		<h1 class="High-Banner">IPHONE & GALAXY COVERS</h1>
		<p>Buy One Case and Get 30% Off the Second Purchase! ... <a>Read more</a></p>
	</div>
</body>