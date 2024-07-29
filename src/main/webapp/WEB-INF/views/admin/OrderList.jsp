<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="data;,">
<!-- <link rel="stylesheet" type="text/css" href="./css/ProductList.css" /> -->
<link rel="stylesheet" type="text/css" href="./css/OrderList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script src="./js/product.js" defer="defer"></script>
<script src="./js/cart.js" defer="defer"></script>
<title>쇼핑몰</title>
</head>
<body>
	<div id="orderMgt">
		<h2 class="head-title" style="text-align: center;">주문전체관리</h2>
		<div align="right" class="mb-2">
	       <button class="btn btn-dark">주문 건: ${orderTot}</button>
	    </div>
		<table class="table table-hover text-center table-bordered border-dark">
			<thead>
				<tr>
					<th class="ocol ocol0"><input type="checkbox" id="checkAll" name="all"></th>
					<th class="ocol ocol1">순서</th>
					<th class="ocol ocol2">상품명</th>
					<th class="ocol ocol3">주문수량</th>
					<th class="ocol ocol4">구매자</th>
					<th class="ocol ocol5">단가</th>
					<th class="ocol ocol6">결제금액</th>
					<th class="ocol ocol7">결제일</th>
					<th class="ocol ocol8">주문상태</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${fn:length(orders)==0}">
					<tr>
						<th colspan="6" align="center">주문내역이 없습니다.</th>
					</tr>
				</c:when>
				<c:when test="${fn:length(orders)>0}">
					<c:forEach items="${orders}" var="order" varStatus="i">
						<tr>
							<th class="ocol0">
			    				<input type="checkbox" name="ck" value="${i.index}">
			    			</th>
							<th class="ocol ocol1 orderDetail">
			    				<input type="text" name="rn" value="${order.rn}" class="num " readonly="readonly" style="text-align: center;">
			    			</th>
							<th class="ocol ocol2 orderDetail">
								<input type="text" name="p_name" value="${order.p_name}"
			    					class="" readonly="readonly" 
			    					onclick="javascript:orderDetail(this)">
								<input type="hidden" name="p_no" value="${order.p_no}" readonly="readonly">
								<input type="hidden" name="o_no" value="${order.o_no}" readonly="readonly">
								<input type="hidden" name="mem_id" value="${order.mem_id}" readonly="readonly">
			    			</th>
			    			<th class="ocol ocol3 orderDetail">
			    				<input type="text" name="quantity" value="${order.quantity}"
			    					class="num " readonly="readonly" style="text-align: center;">
			    			</th>
			    			<th class="ocol ocol4 orderDetail">
			    				<input type="text" name="m_name" value="${order.m_name}(${order.mem_id})"
			    					class="num " readonly="readonly" style="text-align: center;">
								<input type="hidden" name="mem_id" value="${order.mem_id}" readonly="readonly">
			    			</th>
			    			<th class="ocol ocol5 orderDetail">
			    				<input type="text" name="price" value="${order.price}"
			    					class="num " readonly="readonly" style="text-align: center;">
			    			</th>
			    			<th class="ocol ocol6 orderDetail">
			    				<input type="text" name="order_amount" value="${order.amount}"
			    					class="num " readonly="readonly" style="text-align: center;">
			    			</th>
			    			<th class="ocol ocol7 orderDetail">
			    				<input type="text" name="o_regdate" value="${order.o_regdate}"
			    					class="" readonly="readonly" style="text-align: center;">
			    			</th>
			    			<th class="ocol ocol8">
			    				<select name="state" class="state${i.count} ">
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
			</tbody>
		</table>
		
		 <!-- 페이지  -->
	     <div align="center">
	     <c:if test="${pgVo.startPg>PBlock}">
		     <font color="4c5317">
		         <a href="/orderFIX?curPg=${pgVo.startPg-PBlock}&curBl=${pgVo.curBl-1}">[이전]</a>
		     </font>
	     </c:if>
	     <c:forEach var="pgno" begin="${pgVo.startPg}" end="${pgVo.endPg}" step="1">
	         <c:set scope="page" var="list" 
	                  value="./orderFIX?curPg=${pgno}&curBl=${pgVo.curBl}"/> 
	         <a href="${list}" style=" text-decoration:none;">
	           <c:choose>
	             <c:when test="${pgVo.curPg==pgno}">
	                <font color="4c5317" style="font-weight: bold;">[${pgno}]</font>
	             </c:when>
	             <c:otherwise>
	               <font color="4c5317">[${pgno}]</font>
	             </c:otherwise>
	           </c:choose>
	         </a>                  
	     </c:forEach>
	      <c:if test="${pgVo.endPg<pgVo.pgCnt}">
	             <font color="4c5317">
	               <a href="./orderFIX?curPg=${pgVo.startPg+PBlock}&curBl=${pgVo.curBl+1}">[다음]</a>
	             </font>
	       </c:if> 
	     </div>
	     <!-- 페이지 끝 -->
	     <div class="btnArea" align="right">
		     <input name="s" type="button" class="btnJoin orderChange" value="상태수정">
	     </div>
		<form action="OrDetailMgt" name="form1" method="post">
			<input type="hidden" name="p_no" value="">
			<input type="hidden" name=o_no value="">
			<input type="hidden" name="mem_id" value="">
		</form>
	</div>
			
</body>
</html>