<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/product.css" />
<link rel="stylesheet" type="text/css" href="./css/ProductList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/product.js"></script>
</head>
<body>
<div data-ez="contents-1vd3ex7-1" class="xans-element- xans-product xans-product-detail section">
	<form action="oStateUpdate" name="form1" method="post">
		<div class="detailArea ">
			<div class="xans-element- xans-product xans-product-image imgArea">
				<div class="RW ">
					<div class="prdImg">
						<div class="thumbnail">
	                   			<img src="/upload/${order.image}" alt="Sandwich" style="width:380px; height: 23rem;" class="pDetail">
						</div>
					</div>
				</div>
			</div>
			<div class="infoArea" data-ez-role="ez-discount-tag">
				<div class="headingArea">
					<div class="icon"></div>
					<h1>주문상세정보</h1>
				</div>
				<div class="xans-element- xans-product xans-product-detaildesign">
					<table border="1">
						<tbody>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#9f1414;font-weight:bold;">상품명</span>
								</th>
								<td>
									<span style="font-size:16px;color:#000;font-weight:bold;">${order.p_name}</span>
									<input type="hidden" name="p_no" title="상품번호" value="${order.p_no}" > 
									<input type="hidden" name="o_no" title="주문번호" value="${order.o_no}" > 
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">고객정보</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text">${order.m_name}(${order.mem_id})</strong>
										<input type="hidden" name="mem_id" title="상품명" value="${order.mem_id}" > 
									</span>
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">재고수량</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text">${order.stock}개</strong>
										<input id="order_stock" name="order_stock" value="${order.stock}" type="hidden">
									</span>
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">상품단가</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text">${order.price}원</strong>
										<input id="order_price" name="order_price" value="${order.price}" type="hidden">
									</span>
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">상품구매수량</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text" >${order.quantity}개</strong>
										<input id="order_quantity" name="order_quantity" value="${order.quantity}" type="hidden">
									</span>
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">결재금액</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text">${order.amount}원</strong>
										<input id="order_amount" name="order_amount" value="${order.amount}" type="hidden">
									</span>
								</td>
							</tr>
							<tr>
							<th class="pcol1-1"style="font-size:16px;color:#c92727;font-weight:bold;">주문상태</th>
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
						</tbody>
					</table>
					<div class="btnArea" align="center">
				   		<input name="stateUpdate" type="button" class="btnJoin psubmit" value="상태수정">
			  			<input name="Orderdelete" type="button" class="btnJoin psubmit" value="주문삭제">
			  			<input type="button" onclick="javascript:location.href='orderFIX'" class="btnJoin" value="주문목록">
				   	</div>
				</div>
			</div>
			<div id="detail" class="cboth">
			 ::after
			</div>
		</div>
		</form>
	</div>
</body>
</html>