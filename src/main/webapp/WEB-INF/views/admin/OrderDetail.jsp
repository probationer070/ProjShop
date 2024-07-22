<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/ProductList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/product.js"></script>
</head>
<body>
<div id="productMgt">
	<form action="oStateUpdate" name="form1" method="post">
		OD
		<table class="table">
   			<tr>
   				<td class="cols">
   					<a>
	   					<img alt="이미지" src="/upload/${order.image}" height="300" width="300">
   					</a>
   				</td>
   				<td class="cols">
   					<h2>주문상세정보</h2>
   					<table>
						<tr>
							<th class="pcol1-1">상품명</th>
							<th class="pcol2-1">
								<input type="text" name="p_name" class="chk" title="상품명" value="${order.p_name}" > 
								<input type="hidden" name="p_no" title="상품번호" value="${order.p_no}" > 
								<input type="hidden" name="o_no" title="주문번호" value="${order.o_no}" > 
							</th>
			  			</tr>
						<tr>
							<th class="pcol1-1">고객정보</th>
							<th class="pcol2-1">
								<input type="text" name="m_name" class="chk" title="고객정보" value="${order.m_name}(${order.mem_id})" > 
								<input type="hidden" name="mem_id" title="상품명" value="${order.mem_id}" > 
							</th>
			  			</tr>
						<tr>
							<th class="pcol1-1">상품재고수량</th>
							<th class="pcol2-1">
								<input type="text" name="stock" class="chk num" title="상품재고수량" value="${order.stock}" > 
							</th>
			  			</tr>
						<tr>
							<th class="pcol1-1">상품단가</th>
							<th class="pcol2-1">
								<input type="text" name="price" class="chk num" title="상품단가" value="${order.price}" > 
							</th>
			  			</tr>
						<tr>
							<th class="pcol1-1">상품구매수량</th>
							<th class="pcol2-1">
								<input type="text" name="quantity" class="chk num" title="상품구매수량" value="${order.quantity}" > 
							</th>
			  			</tr>
						<tr>
							<th class="pcol1-1">결재금액</th>
							<th class="pcol2-1">
								<input type="text" name="amount" class="chk num" title="결재금액" value="${order.amount}" > 
							</th>
			  			</tr>
						<tr>
							<th class="pcol1-1">주문상태</th>
							<th class="pcol2-1">
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
				   	</table>
   				</td>
   			</tr>
   		</table>
   		<div align="center" style="margin-top: 20px;">
  			<input name="stateUpdate" type="button" class="btnJoin" value="상태수정">
  			<input name="Orderdelete" type="button" class="btnJoin" value="주문삭제">
  			<input type="button" onclick="javascript:location.href='orderFIX'" class="btnJoin" value="주문목록">
   			
   		</div>
	</form>
</div>
</body>
</html>