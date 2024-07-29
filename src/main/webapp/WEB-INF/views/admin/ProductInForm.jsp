<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="./css/product.css">
<link rel="stylesheet" type="text/css" href="./css/ProductList.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/product.js"></script> 
</head>
<body>
<div id="productMgt">
	<form action="" name="form1" method="post" enctype="multipart/form-data">
	<div data-ez="contents-1vd3ex7-1" class="xans-element- xans-product xans-product-detail section">
		<div class="detailArea ">
			<div class="xans-element- xans-product xans-product-image imgArea">
				<div class="RW ">
					<div class="prdImg">
					</div>
				</div>
			</div>
			<div class="infoArea" data-ez-role="ez-discount-tag">
				<div class="headingArea">
					<div class="icon"></div>
					<h1>상품등록</h1>
				</div>
				<div class="topLogo displaynone">
					<span></span>
				</div>
				<div class="xans-element- xans-product xans-product-detaildesign">
					<table border="1">
		      	<tr class=" xans-record-">
					<th scope="row">
						<span style="font-size:16px;color:#9f1414;font-weight:bold;">상품명</span>
					</th>
					<td>
						<span style="font-size:16px;color:#000;font-weight:bold;">
						<strong id="span_product_price_text"></strong>
						<input type="text" name="p_name" class="form-control chk" 
			         			title="상품명" placeholder="상품명을 입력하시오" >
						</span>
					</td>
				</tr>
		        <tr class=" xans-record-">
					<th scope="row">
						<span style="font-size:16px;color:#9f1414;font-weight:bold;">재고수량</span>
					</th>
					<td>
						<span style="font-size:16px;color:#000;font-weight:bold;">
						<strong id="span_product_price_text"></strong>
						<input type="text" name="stock" class="form-control chk inNum" 
			         			title="재고수량" placeholder="재고수량을 입력하시오" >
						</span>
					</td>
				</tr>
		     <tr class=" xans-record-">
					<th scope="row">
						<span style="font-size:16px;color:#9f1414;font-weight:bold;">상품단가</span>
					</th>
					<td>
						<span style="font-size:16px;color:#000;font-weight:bold;">
						<strong id="span_product_price_text"></strong>
						<input type="text" name="price" class="form-control chk inNum" 
			         			title="상품단가" placeholder="상품단가를 입력하시오" >
						</span>
					</td>
				</tr>
		       <tr class=" xans-record-">
					<th scope="row">
						<span style="font-size:16px;color:#9f1414;font-weight:bold;">상품설명</span>
					</th>
					<td>
						<span style="font-size:16px;color:#000;font-weight:bold;">
						<strong id="span_product_price_text"></strong>
						<input type="text" name="detail" class="form-control chk" 
			         			title="상품설명" placeholder="상품설명을 입력하시오" >
						</span>
					</td>
				</tr>
		        <tr class=" xans-record-">
					<th scope="row">
						<span style="font-size:16px;color:#9f1414;font-weight:bold;">상품이미지</span>
					</th>
					<td>
						<span style="font-size:16px;color:#000;font-weight:bold;">
						<strong id="span_product_price_text"></strong>
						<input type="file" name="image2" class="form-control chk" 
			         			title="이미지" placeholder="이미지를 첨부하시오" >
						</span>
					</td>
				</tr>
		     </table>
		     <div class="btnArea">
		       <button type="button"
		        name="insert" class="btn btn-outline-primary psubmit">등록및전송</button>
		       <button type="button"
		         class="btn btn-outline-secondary" 
		          onclick="javascript:location.href='/productFIX'">상품목록</button>
		</div>
		</div>
		</div>
		</div>
     </div>
     </form>
    </div>
</body>
</html>