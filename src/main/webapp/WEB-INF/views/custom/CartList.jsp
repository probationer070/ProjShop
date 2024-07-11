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
<link rel="stylesheet" type="text/css" href="../css/CartList.css" />
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/product.js" defer="defer"></script>
<script src="../js/cart.js" defer="defer"></script>
</head>
<body>
	
<h2 class="head-title">장바구니목록</h2>
<p>${cartTot}</p>
<div id="Cart-form">
	
	
	<%-- <table>
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
						        <button type="button" onclick="fnCalCount('m', this);">-</button>
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
							<input type="button" onclick="javascript:location.href='orderDetail'" value="주문하기">
							<input type="button" onclick="javascript:location.href='productList'" value="상품목록으로">
						</td>
					</tr>
				</c:when>
			</c:choose>
		</tbody>
	</table> --%>
	
	
	<div class="cart-content">
		<ul class="cart-list headings">
		  <li class="cart-item">
            <div class="cart_item_detail">
              <div class="details">
                <div class="cart-item__price">Price</div>

                <div class="cart-item__quantity">Qty</div>

                <div class="cart-item__quantity">Subtotal</div>
              </div>
            </div>
          </li>
		</ul>
		<ul class="cart-list">
			<c:forEach var="cart" items="${cartList}">
			<li class="cart-item">
				<div class="cart_item_img">
					<a href="/">
						<div class="rsp-Image">
							<img src="../upload/${cart.image}" alt="Sandwich" style="width:100%; height: 14rem;">
						</div>
					</a>
				</div>
				<div class="cart_item_detail">
					<div class="details">
						<input type="hidden" name="p_no" value="${cart.p_no}" class="" readonly="readonly">
						<div class="cart-item-copy">
							<a class="cart-item__title">
								<input type="text" name="p_name" value="${cart.p_name}" class="" readonly="readonly">
							</a>
						</div>
						<div class="price">
							<input type="text" name="price" value="${cart.price}" class="num" readonly="readonly">
						</div>
						<div class="plus-minus">
							<button class="plus-minus__button" onclick="fnCalCount('p',this);">
								<img class="plus" src="../images/plus.svg">
							</button>
							<input type="text" name="quantity" class="num quantity" value="${cart.quantity}">
							<button class="plus-minus__button" onclick="fnCalCount('m',this);">
								<img class="minus" src="../images/minus.svg">
							</button>
							<input type="hidden" name="stock" value="${cart.stock}">
						</div>
						<div class="total-price price">
							<input type="text" name="total" value="${cart.price * cart.quantity}" class="num" readonly="readonly">
						</div>
					</div>
					<div></div>
					<div class="remove">
						<input class="btn btn-dark" type="button" onclick="javascript:cartUpdate('U', this)" value="수정">&nbsp;
	   					<input class="btn btn-dark" type="button" onclick="javascript:cartUpdate('D', this)" value="삭제">
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<div class="cart__additional">
		<div class="cart__summary">
			<div class="cart__subtotal">
				<span class="cart__total-label">Subtotal:</span>
				<span class="cart__total-value">$179.90</span>
			</div>
			<p class="cart__total-note">Shipping &amp; taxes calculated at checkoutIncl. VAT, Free shipping and handling.</p>
			<input class="btn btn-dark" type="button" onclick="javascript:location.href='orderDetail'" value="주문하기">
			<input class="btn btn-dark" type="button" onclick="javascript:location.href='productList'" value="상품목록으로">
		</div>
	</div>
	
	
</div>
			
</body>
</html>