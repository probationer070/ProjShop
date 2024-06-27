<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
<link rel="stylesheet" type="text/css" href="./css/ProductList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/product.js"></script>
</head>
<body>
<div id="product">
	<form action="cartProc?flag=add" name="form1" method="post">
   		<table class="table">
   			<tr>
   				<td class="cols">
   					<a>
	   					<img alt="이미지" src="/upload/${product.image}" height="300" width="300">
	   					<input type="text" name="image" class="chk" title="상품명" value="${product.image}" readonly="readonly"> 
   					</a>
   				</td>
   				<td class="cols">
   					<h2>상품정보</h2>
   					<table>
						<tr>
							<th class="pcol1-1">상품명</th>
							<th class="pcol2-1">
								<input type="text" name="p_name" class="chk" title="상품명" value="${product.p_name}" readonly="readonly"> 
								<input type="hidden" name="p_no" title="상품명" value="${product.p_no}" readonly="readonly"> 
							</th>
							
			  			</tr>
						<tr>
							<th class="pcol1-1">재고수량</th>
							<th class="pcol2-1">
								<input type="text" name="stock" class="chk number" title="재고수량" value="${product.stock}" readonly="readonly"> 
							</th>
			  			</tr>
						<tr>
							<th class="pcol1-1">상품가격</th>
							<th class="pcol2-1">
								<input type="text" name="price" class="chk number" title="상품가격" value="${product.price}" readonly="readonly"> 
							</th>
			  			</tr>
						<tr>
							<th class="pcol1-1">구매수량</th>
							<th class="pcol2-1">
								<input type="text" name="quantity" class="chk inNum" title="구매수량" value="1"> 
							</th>
			  			</tr>
						<tr>
							<th class="pcol1-1">상품설명</th>
							<th class="pcol2-1">
								<input type="text" name="detail" class="chk" title="상품설명" value="${product.detail}" readonly="readonly"> 
							</th>
			  			</tr>
				   	</table>
				   	<div class="btnArea">
				   		<button type="button" class="btn-second cartAdd">장바구니 담기</button>
				   		<button type="button" class="btn-second" onclick="javascript:location.href='/productMgt'">상품목록</button>
				   	</div>
   				</td>
   			</tr>
   		</table>
	</form>
</div>
</body>
</html>