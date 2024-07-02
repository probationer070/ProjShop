<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link rel="icon" href="data;,">
<!-- <link rel="stylesheet" type="text/css" href="./css/ProductList.css" /> -->
<link rel="stylesheet" type="text/css" href="./css/OrderList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script src="./js/product.js" defer="defer"></script>
<script src="./js/cart.js" defer="defer"></script>
</head>
<body>
	
<div id="productMgt">
	<h2 class="head-title">주문관리</h2>
	ADMIN OD
	<div class="totalitem" align="right">주문 건 : ${orderTot}</div>
	<table class="Main">
		<tr>
			<th class="adcol0"><input type="checkbox" id="checkAll" name="all"></th>
			<th class="adcol1">순서</th>
			<th class="adcol2">상품명</th>
			<th class="adcol3">주문수량</th>
			<th class="adcol4">구매자</th>
			<th class="adcol5">단가</th>
			<th class="adcol6">결제금액</th>
			<th class="adcol7">결제일</th>
			<th class="adcol7">주문상태</th>
		</tr>
		<c:choose>
			<c:when test="${fn:length(orders)==0}">
				<tr>
					<th colspan="6" align="center">주문내역이 없습니다.</th>
				</tr>
			</c:when>
			<c:when test="${fn:length(orders)>0}">
				<c:forEach items="${orders}" var="order" varStatus="i">
					<tr>
						<th class="adcol0 ">
		    				<input type="checkbox" name="ck" value="${i.index}">
		    			</th>
						<th class="adcol1 orderDetail">
		    				<input type="text" name="rn" value="${order.rn}"
		    					class="num" readonly="readonly">
		    			</th>
						<th class="adcol2 orderDetail">
							<input type="text" name="p_name" value="${order.p_name}"
		    					class="" readonly="readonly" 
		    					onclick="javascript:orderDetail(this)">
							<input type="hidden" name="p_no" value="${order.p_no}" readonly="readonly">
							<input type="hidden" name="o_no" value="${order.o_no}" readonly="readonly">
							<input type="hidden" name="mem_id" value="${order.mem_id}" readonly="readonly">
		    			</th>
		    			<th class="adcol3 orderDetail">
		    				<input type="text" name="quantity" value="${order.quantity}"
		    					class="num" readonly="readonly">
		    			</th>
		    			<th class="adcol4 orderDetail">
		    				<input type="text" name="quantity" value="${order.m_name}(${order.mem_id})"
		    					class="num" readonly="readonly">
							<input type="hidden" name="mem_id" value="${order.mem_id}" readonly="readonly">
		    			</th>
		    			<th class="adcol5 orderDetail">
		    				<input type="text" name="price" value="${order.price}"
		    					class="" readonly="readonly">
		    			</th>
		    			<th class="adcol6 orderDetail">
		    				<input type="text" name="amount" value="${order.amount}"
		    					class="" readonly="readonly">
		    			</th>
		    			<th class="adcol7 orderDetail">
		    				<input type="text" name="o_regdate" value="${order.o_regdate}"
		    					class="" readonly="readonly">
		    			</th>
		    			<th class="adcol7">
		    				<select name="state" class="state${i.count}">
			                  <option value="1">결재중</option>
			                  <option value="2">배송준비</option>
			                  <option value="3">배송중</option>
			                  <option value="4">배송완료</option>
			                  <option value="5">구매확정</option>
			                </select>
		    				<script type="text/javascript">
		    						$(function(){
		    	            	   $(".state"+'${i.count}').val('${order.state}')
		    	               })
		    				</script>
		    			</th>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<table style="text-align: center">
		<tr>
			<th colspan="9">
				<input name="s" type="button" class="orderChange" value="상태수정">
			</th>
		</tr>
	</table>
	<form action="OrDetailMgt" name="form1" method="post">
		<input type="text" name="p_no" value="">
		<input type="text" name=o_no value="">
		<input type="text" name="mem_id" value="">
	</form>
</div>
			
</body>
</html>