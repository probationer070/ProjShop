<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/Search.css" />
<script type="text/javascript" src="./js/product.js"></script> 
<script type="text/javascript" src="./js/Search.js"></script> 
</head>
<body>
	<h1>검색 결과</h1>
	<div class="navbar">
		<ul class="navbar-contain-ul">
			<li><a href="/search?bucket=1&text=${param.text}">PRODUCT (${p_search})</a></li>	
			<li><a href="/search?bucket=2&text=${param.text}">NOTICE (${n_search})</a></li>	
			<%-- <li><a href="/search?bucket=3&text=${param.text}">TEST1</a></li>	
			<li><a href="/search?bucket=4&text=${param.text}">TEST1</a></li>	 --%>
		</ul>
	</div>
	<div class="contents-view">
		<input type="hidden" name="bucket" value="${param.bucket}">
		<input type="hidden" name="text2" value="${param.text}">
		<ul class="SearchContent">
			<c:choose>
				<c:when test="${param.bucket eq 1 || param.bucket eq null}">
					<c:forEach var="searchItem" items="${search_list}">
						<li class="SearchItem-idf">
							<a href="productDetail?p_no=${searchItem.p_no}">
								<div class="Search-total">
									<div class="search-content-img">
										<img src="/upload/${searchItem.image}" alt="Sandwich">
									</div>
									<div class="search-content-detail">
											<h3><input class="subject" type="text" value="${searchItem.p_name}" readonly="readonly"></h3>
											<p>상품 가격 : <input class="num" type="text" value="${searchItem.price}원" readonly="readonly"></p>
											<p>상품 설명 : ${searchItem.detail}</p>
											<p>등록 일자 : ${searchItem.pr_date}</p>
									</div>
								</div>
							</a>
						</li>
					</c:forEach>
				</c:when>
				<c:when test="${param.bucket eq 2}">
					<c:forEach var="searchItem" items="${search_list}">
						<li>
							<a href="noticeDetail?noti_no=${searchItem.noti_no}">
								<div class="search-content-detail">
										<h3>${searchItem.subject}</h3>
										<p><input class="subject" type="text" value="${searchItem.content}..." readonly="readonly"></p>
										<p>${searchItem.writer}</p>
										<p>${searchItem.vdate}</p>
								</div>
							</a>
						</li>
					</c:forEach>
				</c:when>
			
			</c:choose>
			
		</ul>
	
	</div>
</body>
</html>