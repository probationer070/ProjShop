<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
<script type="text/javascript" src="./js/product.js"></script>
</head>
<body>
<div id="productmgt">
   	<h2>상품정보</h2>
	<form action="" name="form1" method="post">
   	<table>
   		<tbody>
			<tr>
				<th class="pcol1">상품명</th>
				<th class="pcol2">
					<input type="text" name="p_name" class="chk" title="상품명" value="${product.p_name}" readonly="readonly"> 
					<input type="hidden" name="p_no" title="상품명" value="${product.p_no}" readonly="readonly"> 
				</th>
				<th class="pcol3"><font></font></th>
  			</tr>
			<tr>
				<th class="pcol1">재고수량</th>
				<th class="pcol2">
					<input type="text" name="stock" class="chk num" title="재고수량" value="${product.stock}" readonly="readonly"> 
				</th>
				<th class="pcol3"><font></font></th>
  			</tr>
			<tr>
				<th class="pcol1">상품가격</th>
				<th class="pcol2">
					<input type="text" name="price" class="chk num" title="상품가격" value="${product.price}" readonly="readonly"> 
				</th>
				<th class="pcol3"><font></font></th>
  			</tr>
			<tr>
				<th class="pcol1">상품설명</th>
				<th class="pcol2">
					<input type="text" name="detail" class="chk" title="상품설명" value="${product.detail}" readonly="readonly"> 
				</th>
				<th class="pcol3"><font></font></th>
  			</tr>
			<tr>
				<th class="pcol1">상품이미지</th>
				<th class="pcol2">
					<a href="#">
						<img alt="이미지" src="/upload/${product.image}"  height="300" width="300">
					</a>
				</th>
				<th class="pcol3"><font></font></th>
  			</tr>
   		</tbody>
   	</table>
   	<div class="btnArea">
   		<button type="button" name="update" class="btn-primary">상품수정</button>
   		<button type="button" name="delete" class="btn-second psubmit">상품삭제</button>
   		<button type="button" class="btn-second" onclick="location.href='/productList'">상품목록</button>
   	</div>
	</form>
</div>
</body>
</html>