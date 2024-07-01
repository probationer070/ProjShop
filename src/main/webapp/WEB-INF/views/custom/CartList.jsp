<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<!-- <link rel="stylesheet" type="text/css" href="./css/ProductList.css" /> -->
<link rel="stylesheet" type="text/css" href="./css/CartList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script src="./js/product.js" defer="defer"></script>
<script src="./js/cart.js" defer="defer"></script>
</head>
<body>
	
<div id="productMgt">
	<h2 class="head-title">장바구니목록</h2>
	<p>${cartTot}</p>
	<table>
		<thead>
			<tr>
				<th class="pcol1">상품명</th>
				<th class="pcol2">상품가격</th>
				<th class="pcol3">수량</th>
				<th class="pcol4">결제금액</th>
				<th class="pcol7">삭제</th>
				<th class="pcol6">조회</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(cartList)==0}">
					<tr>
						<th colspan="6">장바구니에 등록된 상품이 없습니다.</th>
					</tr>	
				</c:when>
				<c:when test="${fn:length(cartList)>0}">
					<c:forEach var="cart" items="${cartList}">
						<tr>
	    				<td class="pcol1">
		   					<input type="hidden" name="p_no" value="${cart.p_no}" class="" readonly="readonly">
							<input type="text" name="p_name" value="${cart.p_name}" class="" readonly="readonly">
						</td>
	     				<td class="pcol2">
     						<input type="text" name="price" value="${cart.price}" class="number" readonly="readonly">
		   				</td>
	     				<td class="pcol3">	
	     					<button type ="button" onclick="fnCalCount('p',this);">+</button>
     						<input type="text" name="quantity" value="${cart.quantity}">
					        <button type="button" onclick="fnCalCount('m',this);">-</button>
	     					
	     						<input type="hidden" name="stock" value="${cart.stock}">
		   				</td>
		   				<td class="pcol4">
	   						<input type="text" name="amount" value="${cart.price * cart.quantity}" class="" readonly="readonly">
		   				</td>
		   				
		   				<td class="pcol7">
		   					<input type="button" onclick="javaScript:cartUpdate('U', this)" value="수정">&nbsp;
		   					<input type="button" onclick="javaScript:cartUpdate('D', this)" value="삭제">
		   				</td><!-- 수정/삭제 -->
		   				<td class="pcol6">
		   					<input type="button" class="" value="상세" onclick="javascript:location.href='productDetail?p_no=${cart.p_no}'">
		   				</td><!-- 상세보기 -->
		   				</tr>
					</c:forEach> 
					<tr>
						<td colspan="6" align="right">
							<input type="button" onclick="javascript:location.href='orderProc'" value="주문하기">
							<input type="button" onclick="javascript:location.href='productList'" value="상품목록으로">
						</td>
					</tr>
				</c:when>
			</c:choose>
		</tbody>
	</table>
</div>
			
</body>
</html>