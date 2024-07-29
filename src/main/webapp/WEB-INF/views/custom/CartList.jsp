<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="../css/CartList.css" />
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/product.js" defer="defer"></script>
<script src="../js/cart.js" defer="defer"></script>
</head>
<body>
<div class="section titleArea" data-ez="module-0jx8sdy-1"
data-ez-module="user-defined/1" data-ez-name="USER DEFINED"
data-ez-type="plain">
	<h2>장바구니</h2>
</div>
<div class="section ec-base-step" data-ez="module-0u6cz5d-1"
data-ez-module="user-defined/1" data-ez-name="USER DEFINED"
data-ez-type="plain">
	<ol class="step">
		<li class="selected">
		1. 장바구니&nbsp;&nbsp;&nbsp;>
		</li>
		<li class="selected">
		  &nbsp;&nbsp;&nbsp;2. 주문서작성&nbsp;&nbsp;&nbsp;>
		</li>
		<li class="selected">
		&nbsp;&nbsp;&nbsp;3. 주문완료
		</li>
	</ol>
</div>
<div data-ez="contents-1bjg9aa-1"
class="xans-element- xans-order xans-order-basketpackage section ">
	<div class="xans-element- xans-order xans-order-tabinfo ec-base-tab  typeNav ">
		<ul class="menu">
			<li class="selected ">
				<a href="/order/basket.html">
					국내배송상품 (${cartTot})
				</a>
			</li>
			<li class=" ">
				<a href="/order/basket.html?delvtype=B">
					해외배송상품 (0)
				</a>
			</li>
		</ul>
		<p class="right displaynone RW">
			장바구니에 담긴 상품은 7일 동안 보관됩니다.
		</p>
	</div>
	<div class="cart-container">
		<div class="cart-product">
			<div class="xans-element- xans-order
			xans-order-emptyitem ec-base-fold theme1
			selected eToggle ">
				<div class="title">
					<h3>장바구니 상품</h3>
				</div>
				<div class="contents2">
					<div class="xans-element- xans-order
					xans-order-normtitle title subTitle ">
						<h4>일반상품 (${cartTot})</h4>
					</div>
					<div class="xans-element- xans-order
					xans-order-normnormal xans-record-">
						<div class="xans-element- xans-order
						xans-order-list">
						<c:forEach var="cart" items="${cartList}">
							<div class="ec-base-prdInfo
							gCheck xans-record-">
								<div class="prdBox">
									<input type="checkbox" id="basket_chk_id_0"
									name="basket_product_normal_type_normal"
									class="check">
									&nbsp;
									<div class="thumbnail">
										<a>
											<img class="proimg" alt="이미지" src="/upload/${cart.image}">
										</a>
									</div>
									<div class="description">
										<strong class="prdName" title="상품명"
										id="basket_prod_id_0">
										${cart.p_name}
											<a href="/product/mini-checker-board/49/category/24/"
											class="ec-product-name">
											<input type="hidden" name="itemName" value="${cart.p_name}" class="" readonly="readonly">
											<input type="hidden" name="userName" value="${cart.mem_id}" class="" readonly="readonly"> 
											</a>
										</strong>
										<ul class="price">
											<li id>
												₩
												<strong>
													${cart.price}
												</strong>
												<input type="hidden" name="price" value="${cart.price}" class="number" readonly="readonly">
												원 
												<span class="displaynone">
													<span></span>
												</span>
											</li>
											<li id>
												<span class="displaynone">
													<span></span>
												</span>
											</li>
										</ul>
										<ul class="info">
											<li>
											배송 : 
												<span class>
													₩3,000원
													<span class="refer displaynone">
													</span>
												</span>
												 [조건] / 기본배송 
											</li>
											<li class="displaynone">
											배송주기 
												<span class="txtEm"></span>
											</li>
											<li title="적립금" id="product_mileage0" class="mileage">
											-
											</li>
											<li class="displaynone">
											상품중량: 
												<span>
												1.00kg * 1개 = 1.00kg
												</span>
											</li>
										</ul>
									</div>
									<ul class="xans-element- xans-order
									xans-order-optionall optionGroup">
										<li class="xans-record-">
											<div class="name">
												<span class="product displaynone">
												mini checker board
													
												</span>
												<span class="optionStr">
												[옵션: black/아이폰 13 mini]
												</span>
												<span class="displaynone">
												(1개)
												</span>
												<span class>
													<a href="#none"
													onclick="Basket.showOptionChangeLayer('option_modify_layer_0', $(this))"
													class="btnText displaynone">
													옵션변경
													</a>
												</span>
											</div>
										</li>
									</ul>
									<div class="quantity">
										<span class="label">수량</span>
										<div>
											<span class="ec-base-qty">
												<input id="quantity_id_0" name="quantity" size="2"
												value="${cart.quantity}" type="text">
							   					<input type="hidden" name="p_no" value="${cart.p_no}" readonly="readonly">
												<input type="hidden" name="price" value="${cart.price}" readonly="readonly">
												<input type="hidden" name="stock" value="${cart.stock}">
												<a href="javascript:;" class="up"
												onclick="fnCalCount('p',this);">
												수량증가
												</a>
												<a href="javascript:;" class="down"
												onclick="fnCalCount('m',this);">
												수량감소
												</a>
											</span>
											<a href="javascript:;" class="btnNormal sizeQty"
											onclick="cartUpdate('U', this)">
											변경
											</a>
											<a href="javascript:;" class="btnNormal sizeQty"
											onclick="cartUpdate('D', this)">
											삭제
											</a>
										</div>
										<div class="displaynone">
										1
										</div>
									</div>
									<div class="sumPrice">
										<span class="label">
										주문금액
										</span>
											₩&nbsp;
										<strong class="total">
											${cart.price * cart.quantity}
										</strong>원
										<input type="hidden" name="total" value="${cart.price * cart.quantity}" class="number" readonly="readonly">
										<span class="displaynone">
										</span>
									</div>
									<div class="buttonGroup">
										<a href="#none" onclick="BasketNew.moveWish(0);"
										class="btnNormal sizeL">관심상품</a>
										<a href="#none" onclick="Basket.orderBasketItem(0);"
										class="btnNormal sizeL ">주문하기</a>
										<a href="#none" onclick="Basket.orderBasketItem(0);"
										class="btnSubmit sizeL displaynone">정기배송 신청</a>
									</div>
								</div>
								<a href="#none" onclick="Basket.deleteBasketItem(0);"
								class="btnDelete">삭제</a>
							</div>
						</c:forEach>
						</div>
						<div class="summary">
							<div class="title">
								<h5>[기본배송]</h5>
							</div>
							<div>
							<c:choose>
								<c:when test="${cartTot != 0}">
									<span class="label">
										상품주문금액
										</span>
											₩&nbsp;
										<strong class="total_price">
										</strong>원
									<span class="displaynone">()</span>
									<span class="displaynone"></span>
									<span class="displaynone">
									+ 부가세
									<strong></strong>
									<span class="displaynone"></span>
									</span>
									+ 배송비 ₩
									<strong id="normal_normal_ship_fee" class="num">3,000
									</strong>
									<span class="displaynone"></span>
									<span id="normal_normal_benefit_price_area"
									class="sale displaynone">
									- 상품할인금액
										<strong id="normal_normal_benefit_price">
										0
										</strong>
									</span>
									<span class="total">
									합계 : ₩
										<strong id="normal_normal_ship_fee_sum" class="total_price_d">
										</strong>
										<input type="hidden" name="total" value="${cart.price * cart.quantity}" class="number" readonly="readonly">
										<span class="displaynone"></span>
									</span>
								</c:when>
								<c:otherwise>
									<p>장바구니에 담긴 상품이 없습니다.</p>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
					<div class="xans-element- xans-order xans-order-weight displaynone ">
						<div class="totalWeight">
						전체 상품중량 : 
							<span>
								<span id="total_weight">1.00</span>
								kg
							</span>
						</div>
					</div>
					<div class="xans-element- xans-order xans-order-selectorder ec-base-button typeMulti ">
						<div class="gLeft">
							<a href="#none" class="btnNormal sizeS"
							id="product_select_all" data-status="off">전체선택</a>
							<a href="#none" onclick="Basket.deleteBasket()"
							class="btnNormal sizeS">선택삭제</a>
						</div>
						<div class="gRight">
							<a href="#none" class="btnNormal sizeS"
							onclick="Basket.estimatePrint(this)"
							link="/estimate/userform.html">견적서출력</a>
							<a href="#none" onclick="Basket.moveOversea()"
							class="btnNormal sizeS">해외장바구니로 이동</a>
							<a href="#none" onclick="Basket.orderStorePickupSelectBasket(this)"
							class="btnNormal sizeS displaynone"
							link-order="/order/orderform.html?basket_type=all_buy"
							link-login="/member/login.html">
							스토어픽업 상품 선택
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="cart-total">
			<div class="sticky">
				<!-- 총 주문금액 : 국내배송상품 -->
				
				<div class="xans-element- xans-order xans-order-totalsummary 
				totalSummary ">
					<div class="totalSummary__item">
						<div class="heading">
							<h4 class="title">총 상품금액</h4>
							<div class="data">
                                ₩
                               	<strong class="total_price">
                               	</strong>
                               	원 
                               	<span class="refer displaynone">
                               		<span class="total_product_price_display_back">
                               		</span>
                               	</span>
							</div>
						</div>
						<div class="contents displaynone">
							<div class="item">
								<h5 class="title">상품금액</h5>
								<div class="data">
									<span class="total_product_price_display_front_mobile">
									0
									</span>
								</div>
							</div>
							<div class="item">
								<h5 class="title">부가세</h5>
								<div class="data">
									<span class="total_product_vat_price_front_mobile">
									₩0원
									</span>
								</div>								
							</div>
						</div>
					</div>
					<div class="title shipping totalSummary__item">
						<div class="heading">
							<h4 class="title">총 배송비</h4>
							<div class="data">
							₩
								<strong id="total_delv_price_front">
									<span class="total_delv_price_front">
									3,000
									</span>
								</strong>
								<span class="refer displaynone">
									<span class="total_delv_price_back"></span>
								</span>
								<div class="shippingArea displaynone">
									<span class="status">(</span>
									<div class="shippingFee">
										<a href="#none" class="btnText" id>자세히</a>
										)
										<div class="ec-base-tooltip" 
										style="display: none;">
											<strong class="title">배송비할인</strong>
											<div class="content">
												<strong class="title"></strong>
												<div class="ec-base-table">
													<table border="1">
														<caption>배송비 할인 이벤트 정보</caption>
														<colgroup>
															<col style="width:80px;">
															<col style="width:auto;">
														</colgroup>
														<tbody>
															<tr>
																<th scope="row">혜택</th>
																<td>
																	<strong class="txtEm"></strong>
																	<p></p>
																</td>
															</tr>
															<tr class="displaynone">
																<th scope="row">기간</th>
																<td>
																	<strong class="txtEm"></strong>
																	<p></p>
																</td>
															</tr>
															<tr class="displaynone">
																<th scope="row">대상</th>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<button type="button" class="btnClose">
											닫기
											</button>
									</div>
								</div>
							</div>
						</div>	
					</div>
				</div>
				<p class="displaynone ec-base-help">
				착불 상품이 포함되어 있습니다
				</p>
				
				<div class="total">
					<c:choose>
						<c:when test="${cartTot != 0}">
							<h3 class="title">결제예정금액</h3>
							<div class="paymentPrice">
							₩
								<strong id="normal_normal_ship_fee_sum" class="total_price_d">
								</strong>
								<input type="hidden" name="total" value="${cart.price * cart.quantity}" class="number" readonly="readonly">
								원
								<span class="refer displaynone">
									<span id="total_order_price_back"></span>
								</span>
							</div>
						</c:when>
						<c:otherwise>
							<p>장바구니에 담긴 상품이 없습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<form action="/orderDetail" id="orderDetail">
			<div id="orderFixItem" 
			class="xans-element- xans-order xans-order-totalorder ">
				<div class="ec-base-button">
					<input type="hidden" class="num" name="amount" value="">
					<input type="hidden" class="num" name="cartTot" value="${cartTot}">
					<input type="hidden" name="itemName" value="test">
					<input type="hidden" name="userName" value="${ssKey.mem_id}">
					<input class="btnSubmit gFull sizeL" type="button" value="전체상품주문" id="order">
					<a href="#none" onclick="Basket.orderSelectBasket(this)" 
					link-order="/order/orderform.html?basket_type=all_buy" 
					link-login="/member/login.html" 
					class="btnNormal gFull sizeL ">선택상품주문</a>
				</div>
				<!-- 네이버 체크아웃 구매 버튼 -->
				<div id="NaverChk_Button"></div>
				<div id="appPaymentButtonBox"></div>
			</div>
			</form>
			<div class="xans-element- xans-order 
			xans-order-basketpriceinfoguide gInnerMargin  ">
				<ul class="ec-base-help">
					<li>할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</li>
					<li class="displaynone">주문서 작성 시 배송비를 확인할 수 있습니다.</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div data-ez="contents-126sre5-1" 
class="xans-element- xans-order xans-order-basketguide section ec-base-help">
	<h3>이용안내</h3>
	<div class="inner">
		<h4>장바구니 이용안내</h4>
		<ul>
			<li class=" ">"해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다."</li>
			<li class=" ">"해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다."</li>
			<li>"선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다."</li>
			<li>"[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다."</li>
			<li>"장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다."</li>
			<li>"파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다."</li>
		</ul>
		<h4>무이자할부 이용안내</h4>
		<ul>
			<li>"상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다."</li>
			<li>"[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다."</li>
			<li>"단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다."</li>
			<li class=" ">"무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다."<br>
			"실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다."
			</li>
			<li class="displaynone">무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시됩니다.</li>
		</ul>
	</div>
</div>
</body>
</html>