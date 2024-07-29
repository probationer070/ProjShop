<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
<link rel="stylesheet" type="text/css" href="./css/product.css" />
<link rel="stylesheet" type="text/css" href="./css/ProductList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/product.js"></script>
</head>
<body>
	<div data-ez="contents-1vd3ex7-1" class="xans-element- xans-product xans-product-detail section">
		<div class="detailArea ">
			<div class="xans-element- xans-product xans-product-image imgArea">
				<div class="RW ">
					<div class="prdImg">
						<div class="thumbnail">
							<input type="hidden" name="p_no" value="${product.p_no}">
	                   			<img src="/upload/${product.image}" alt="Sandwich" style="width:380px; height: 23rem;" class="pDetail">
						</div>
					</div>
				</div>
			</div>
			<div class="infoArea" data-ez-role="ez-discount-tag">
				<div class="headingArea">
					<div class="icon"></div>
					<h1>${product.p_name}</h1>
				</div>
				<div class="xans-element- xans-product xans-product-detaildesign">
					<table border="1">
						<tbody>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#9f1414;font-weight:bold;">상품명</span>
								</th>
								<td>
									<span style="font-size:16px;color:#000;font-weight:bold;">${product.p_name}</span>
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">판매가</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text">
										<input class="num" style="font-weight: bold;" value="${product.price}원"></strong>
										<input id="product_price" name="product_price" value="" type="hidden">
									</span>
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">재고수량</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text">${product.stock}개</strong>
										<input id="product_stock" name="product_stock" value="" type="hidden">
									</span>
								</td>
							</tr>
							<tr class="xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">상품설명</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text">${product.detail}</strong>
										<input id="product_detail" name="product_detail" value="" type="hidden">
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btnArea" align="center">
				   		<button type="button" name="update" class="btnJoin">상품수정</button>
				   		<button type="button" name="delete" class="btnJoin psubmit">상품삭제</button>
				   		<button type="button" class="btnJoin" onclick="location.href='/productFIX'">상품목록</button>
				   	</div>
					<form action="cartProc?flag=add" name="form1" method="post">
						<input type="hidden" name="p_no" title="상품명" value="${product.p_no}" readonly="readonly"> 
						<input type="hidden" name="stock" class="chk num" title="재고수량" value="${product.stock}" readonly="readonly"> 
						<input type="hidden" name="quantity" class="chk inNum" title="구매수량" value="1"> 
						<input type="hidden" name="price" class="chk inNum" title="구매수량" value="${product.price}"> 
					</form>
				</div>
			</div>
			<div id="detail" class="cboth">
			 ::after
			</div>
		</div>
	</div>
</body>
</html>