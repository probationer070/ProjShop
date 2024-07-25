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
	                   			<img src="/upload/${product.image}" alt="Sandwich" style="width:380px; height: 25rem;" class="pDetail">
						</div>
					</div>
				</div>
			</div>
			<div class="infoArea" data-ez-role="ez-discount-tag">
				<div class="headingArea">
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
									<span style="font-size:16px;color:#000;font-weight:bold;">${product.p_name}</span>
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">판매가</span>
								</th>
								<td>
									<span style="font-size:16px;color:#555555;font-weight:bold;">
										<strong id="span_product_price_text"><input class="num" style="font-weight: bold;" value="${product.price}원"></strong>
										<input id="product_price" name="product_price" value="${product.price}" type="hidden">
									</span>
								</td>
							</tr>
							<tr class="xans-record-">
								<th scope="row">
									<span style="font-size:16px;color:#c92727;font-weight:bold;">상품설명</span>
								</th>
								<td>
									<span style="font-size:14px;color:#555555;font-weight:bold;">
										* PC 젤하드 케이스 (맥세이프)
										<br>
										<br>
										핸드폰 보호, 후면 변색에 강함
										<br>
										안쪽 보호 필름을 제거해주세요.
										<br>
										<br>
										* 배송
										<br>
										영업일 기준 3-5일 후 발송됩니다.
										<br>
										* 하단 유의사항을 읽어주세요.
										<br>
										<br>
										<br>
										<br>
									</span>
								</td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row">
									<span style="font-size:14px;color:#555555;font-weight:bold;">배송비</span>
								</th>
								<td>
									<span style="font-size:14px;color:#555555;font-weight:bold;">
										<span class="delv_price_B">
											<input id="delivery_cost_prepaid" name="delivery_cost_prepaid" value="P" type="hidden">
											<strong>3,000원</strong>
											(50,000원 이상 구매 시 무료)
										</span>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
					<form action="cartProc?flag=add" name="form1" method="post">
						<input type="hidden" name="p_no" title="상품명" value="${product.p_no}" readonly="readonly"> 
						<input type="hidden" name="stock" class="chk" title="재고수량" value="${product.stock}" readonly="readonly"> 
						<input type="hidden" name="quantity" class="chk" title="구매수량" value="1"> 
						<input type="hidden" name="price" class="chk" title="구매수량" value="${product.price}"> 
						<div class="prd-ProductContent_Buy">
							<div class="prd-DetailForm_Buttons">
								<button type="submit" name="add" class="prd-DetailForm_Button btn-Button btn-Button-primary btn-Button-fullWidth fz-13_18" data-ajaxadd-button="">
	                 	 			<span data-ajaxadd-button-text="" class="product__actions-button-text">
									장바구니 담기
									</span>
	                			</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div id="detail" class="cboth">
			</div>
			<div class="detail_tab ">
				<ul class="cboth title_detail">
					<li class="tab_open">
						<strong>상세정보</strong>
							<li class="tab_open1"><img src="/upload/${product.image}" alt="image1" style="width:700px; "></li>
							<li class="tab_open2"><img src="/upload/${product.image}" alt="image2" style="width:700px; "></li>
							<li class="tab_open3"><img src="/upload/${product.image}" alt="image3" style="width:700px; "></li>
							<li class="tab_open4"><img src="/upload/${product.image}" alt="image4" style="width:700px; "></li>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>