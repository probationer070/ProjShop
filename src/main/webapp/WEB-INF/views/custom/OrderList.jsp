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

<link rel="stylesheet" type="text/css" href="./css/OrderList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script src="./js/product.js" defer="defer"></script>
<script src="./js/cart.js" defer="defer"></script>
</head>
<body>
	
<div id="productMgt">
	<h2 class="head-title">주문리스트</h2>
	<div class="totalitem" align="right">주문 건 : ${orderTot}</div>
	<table>
		<thead>
		<tr>
			<th class="ocol ocol1">상품명</th>
			<th class="ocol ocol2">주문수량</th>
			<th class="ocol ocol3">단가</th>
			<th class="ocol ocol4">결제금액</th>
			<th class="ocol ocol5">결제일</th>
			<th class="ocol ocol6">주문상태</th>

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
				<c:forEach items="${orders}" var="order">
				<tr>
					<th class="ocol ocol1">
						<p>${order.p_name}</p>
						<input type="hidden" name="p_name" value="${order.p_name}"
	    					class="" readonly="readonly" 
	    					onclick="javascript:orderDetail(this)">
						<input type="hidden" name="p_no" value="${order.p_no}" readonly="readonly">
						<input type="hidden" name="o_no" value="${order.o_no}" readonly="readonly">
						<input type="hidden" name="mem_id" value="${order.mem_id}" readonly="readonly">
	    			</th>
	    			<th class="ocol ocol2">
	    				<p>${order.quantity}</p>
	    				<input type="hidden" name="quantity" value="${order.quantity}"
	    					class="num" readonly="readonly">
	    			</th>
	    			<th class="ocol ocol3">
	    				<p>${order.price}</p>
	    				<input type="hidden" name="price" value="${order.price}"
	    					class="" readonly="readonly">
	    			</th>
	    			<th class="ocol ocol4">
	    				<p>${order.amount}</p>
	    				<input type="hidden" name="amount" value="${order.amount}"
	    					class="" readonly="readonly">
	    			</th>
	    			<th class="ocol ocol5">
	    				<p>${order.o_regdate}</p>
	    				<input type="hidden" name="o_regdate" value="${order.o_regdate}"
	    					class="" readonly="readonly">
	    			</th>
	    			<th class="ocol ocol6">
	    				<c:choose>
	    					<c:when test="${order.state==1}">결재중</c:when>
	    					<c:when test="${order.state==2}">배송준비</c:when>
	    					<c:when test="${order.state==3}">배송중</c:when>
	    					<c:when test="${order.state==4}">배송완료</c:when>
	    					<c:when test="${order.state==5}">구매확정</c:when>
	    				</c:choose>
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
	         <a href="/orderList?curPg=${pgVo.startPg-PBlock}&curBl=${pgVo.curBl-1}">[이전]</a>
	     </font>
     </c:if>
     <c:forEach var="pgno" begin="${pgVo.startPg}" end="${pgVo.endPg}" step="1">
         <c:set scope="page" var="list" 
                  value="./orderList?curPg=${pgno}&curBl=${pgVo.curBl}"/> 
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
               <a href="./orderList?curPg=${pgVo.startPg+PBlock}&curBl=${pgVo.curBl+1}">[다음]</a>
             </font>
       </c:if> 
     </div>
     <div style="margin-bottom: 15px;"></div>
     <!-- 페이지 끝 -->
     
	<form action="custOrderDetail" name="form1" method="post">
		<input type="hidden" name="p_no" value="">
		<input type="hidden" name=o_no value="">
		<input type="hidden" name="mem_id" value="">
	</form>
</div>
			
</body>
</html>