<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<body class="theme03" data-ez-theme="theme03" monica-locale="ko" monica-version="5.8.0" monica-id=
      "ofpnmcalabcbjgholdjcjblkibolbppb">
  <div class="large-container">  
    <div class="container">    
	<header id="header" class="layout03" data-ez-layout="layout03" data-ez="contents-14kbc7w-1">
	  <div class="inner">
	   <div class="toparea display_pc_only"> 
	     <div class="toparea_shoppinginfo">  
	       <div data-ez-group="shopping-info" data-ez-role="list">
	       </div>
	     </div>
	     <div class="toparea_state" data-ez-group="top-util-menu" data-ez-role="list">
			<c:choose>
				<c:when test="${ssKey!=null}">
	     			<a href="/logoutProc">로그아웃</a>
	     		</c:when>
	     		<c:otherwise>	     		
			       <a href="/join">회원가입  &nbsp;|</a>
			       <a href="/login">로그인</a>
	     		</c:otherwise>
	     	</c:choose>
	       
         </div>
       </div>  
	   <div class="top_nav_box" id="top_nav_box"> 
	    <div class="top_adjust">
	     <div class="xans-element- xans-layout xans-layout-logotop top_logo ">
		   <a href="/">
		     <img class="logo" src="../images/logo-header-background.svg">
		   </a>
		 </div>
		 <div data-ez-module="menu-main/1" data-ez-mode="manual">
		   <div class="xans-element- xans-layout xans-layout-category top_category">
		     <ul>
			   <!-- <li class="dropdown">
			     <a href="/productList" style="color: #ce4a4a; font-weight: bold;
					font-family: Poppins, Noto Sans KR, Arial, sans-serif !important;
					text-decoration: none; font-size: 20px;">갤럭시</a>
			     <ul class="sub_cate01 dropdown-content">
			       <li class="noChild">
			         <a href="/productList">갤럭시 버전</a>
			       </li>
			       <li class="noChild">
			         <a href="/category/Hard/29/">갤럭시 버전</a>
			       </li>
			       <li class="noChild">
			         <a href="/category/Hard/29/">갤럭시 버전</a>
			       </li>
			       <li class="noChild">
			         <a href="/category/Hard/29/">갤럭시 버전</a>
			       </li>
			     </ul>
			   </li> 
			   <li class="dropdown">
			     <a href="/productList" style="color: #ce4a4a; font-weight: bold;
					font-family: Poppins, Noto Sans KR, Arial, sans-serif !important;
					text-decoration: none; font-size: 20px;">아이폰</a>
			      <ul class="sub_cate01 dropdown-content">
			       <li class="noChild">
			         <a href="/productList">아이폰 버전</a>
			       </li>
			       <li class="noChild">
			         <a href="/category/Hard/28/">아이폰 버전</a>
			       </li>
			       <li class="noChild">
			         <a href="/category/Hard/28/">아이폰 버전</a>
			       </li>
			       <li class="noChild">
			         <a href="/category/Hard/28/">아이폰 버전</a>
			       </li>
			     </ul>
			   </li> -->
			 </ul>
		   </div>
		 </div>
		 </div>
		 <div class="top_mypage">
			  <!--  <a href="javascript:;" class="eSearch"> -->
			    <div class="header__search-container hide-phone" id="searchContainer">
					<form name="search" class="search" role="search" action="search?bucket=1" method="get">
						<div class="input-placeholder input-placeholder--search">
						<label class="search__label search__floating-label screenreader" for="searchInput">Search</label>
						<div class="search__suggested-text js-search-suggested-text screenreader"></div>
						<input class="input search__input" id="searchInput-headerSearchDesktop" type="search" role="combobox" 
						aria-controls="autocompleteItems" aria-owns="autocompleteItems" placeholder="Search" name="text">
						</div>
						<button class="search__input-button js-search btn-icon" 
							id="searchMenuBtn" type="button" title="Search">
							<img class="search__icon icon icon--search" src="../images/search2.svg">
							<span class="screenreader">Search</span>
						</button>
					</form>
				</div>
				
		
			   <!-- </a> -->
			   <div class="dropdown">
				   <a href="/info">
				      <button class="btn-icon" 
						id="searchMenuBtn" type="button" title="">
						<img class="icon" src="../images/user.svg">
						<span class="screenreader">Search</span>
					  </button>
				   </a>
				   <div class="dropdown-content">
				   	<c:choose>
		               <c:when test="${ssKey!=null and ssKey.m_role=='admin'}">
							<a href="/admin/info"><li class="--nav-item dropdown">ADMINPAGE</li></a>
							<a href="/memberFIX"><li class="--nav-item dropdown">MemberFIX</li></a>
							<a href="/orderFIX"><li class="--nav-item dropdown">OrderFIX</li></a>
							<a href="/productFIX"><li class="--nav-item dropdown">ProductFIX</li></a>
							<a href="/noticeFIX"><li class="--nav-item dropdown">NoticeFIX</li></a>
							<a href="/logoutProc"><li class="--nav-item dropdown">Logout</li></a>	
						</c:when>
				        <c:when test="${ssKey!=null and ssKey.m_role=='mem'}">
							<a href="/"><li class="--nav-item dropdown">Home</li></a>
							<a href="/cartlist"><li class="--nav-item dropdown">Cart</li></a>
							<a href="/orderList"><li class="--nav-item dropdown">Order</li></a>
							<a href="/info"><li class="--nav-item dropdown">MyPage</li></a>
							<a href="/notice"><li class="--nav-item dropdown">Notice</li></a>
							<a href="/logoutProc"><li class="--nav-item dropdown">Logout</li></a>
						</c:when>
					 	<%-- <c:otherwise>
					 		<a href="/join">Join</a>
	       					<a href="/login">Login</a>
					 	</c:otherwise> --%>
					 </c:choose>
					 
		            </div>
			    </div>
			    <div class="header__cart-btn-wrapper">   	 
				   <a class="header__cart-btn btn btn-icon" href="/cartlist" aria-label="0 item(s) in your bag">
				     <img class="cart-icon icon" src="../images/cart2.svg">
				     
				     <!-- <span class="count displaynone EC-Layout_Basket-count-display">
				       <span class="EC-Layout-Basket-count">0</span>
				     </span> -->
				   </a>
			    </div>
			</div>
			<div class="top_sidebar">
			  <a href="javascript:;" class="eNavFold">
			    <i aria-hidden="true" class="icon icoNav"></i>
			  </a>	
	        </div>
		 </div>
      </div>
    </header>
   
      
    </div>
  </div> 
</body>