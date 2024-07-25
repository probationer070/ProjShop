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
<div id="productMgt">
	<form action="" name="form1" method="post" enctype="multipart/form-data">
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
				<div class="topLogo displaynone">
					<span></span>
				</div>
				<div class="xans-element- xans-product xans-product-detaildesign">
					<table border="1">
						<tbody>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#9f1414;font-weight:bold;">상품명</span>
								</th>
								<td>
									<span style="font-size:16px;color:#000;font-weight:bold;">
									<strong id="span_product_price_text"></strong>
									<input type="text" name="p_name" class="form-control" 
	         						title="상품명" value="${product.p_name}" >
									</span>
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">상품단가</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text"></strong>
										<input id="product_price" name="price" value="${product.price}" type="text" class="form-control inNum num">
									</span>
								</td>
							</tr>
							<tr class=" xans-record-">
					            <th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">재고수량</span>
							    </th>
							    <td>
							        <span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text"></strong>
										<input id="product_stock" name="stock" value="${product.stock}" type="text" class="form-control inNum num">
								    </span>
							    </td>
						    </tr>
						</tbody>					
						<tr class="xans-record-">
							<th scope="row">
								<span style="font-size:14px;color:#c92727;font-weight:bold;">상품간략설명</span>
							</th>
							<td>
								 <%-- <span style="font-size:13px;">${product.detail}</span> --%>
								 <input type="text" name="detail" class="form-control" title="상품설명" value="${product.detail}" >
							</td>
						</tr>
						<tr>
							<th scope="row">
								<span style="font-size:14px;color:#c92727;font-weight:bold;">상품이미지</span>
							</th>
					        <td>
					            <input type="file" name="image2" class="form-control" 
					              title="이미지">
					            <input type="hidden" name="image" value="${product.image}">
				            </td>
						</tr>
					</table>
					<div class="btnArea" align="center">
				   		<input type="button" name="updatePro" class="btnJoin psubmit" value="수정완료">
				   		<input type="button" class="btnJoin" onclick="location.href='/productFIX'" value="상품목록">
				   	</div>
				</div>
			</div>
			<div id="detail" class="cboth">
			 ::after
			</div>
		</div>
	</div>
	</form>
	</div>
</body>
</html>
