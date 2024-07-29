<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="../css/OrderDetail.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/product.js" defer="defer"></script>
<script src="../js/cart.js" defer="defer"></script>
<script src="../js/layout.js" defer="defer"></script>
<script src="../js/zipCheck.js" defer="defer"></script>
</head>
<script type="text/javascript" src="https://testpay.kcp.co.kr/plugin/payplus_web.jsp"></script>
<script type="text/javascript">
/****************************************************************/
/* m_Completepayment 설명 */
/****************************************************************/
/* 인증완료시 재귀 함수 */
/* 해당 함수명은 절대 변경하면 안됩니다. */
/* 해당 함수의 위치는 payplus.js 보다먼저 선언되어여 합니다. */
/* Web 방식의 경우 리턴 값이 form 으로 넘어옴 */
/****************************************************************/
function m_Completepayment(FormOrJson, closeEvent) {
	var frm = document.kcp_order_info;
	/********************************************************************/
	/* FormOrJson은 가맹점 임의 활용 금지 */
	/* frm 값에 FormOrJson 값이 설정 됨 frm 값으로 활용 하셔야 됩니다. */
	/********************************************************************/
	GetField(frm, FormOrJson);
	console.log(frm);
	// alert("m_Completepayment : " + frm.res_cd.value);
	if (frm.res_cd.value == "0000") {
		/*
		[가맹점 리턴값 처리 영역] 
		인증이 완료되면 frm에 인증값이 들어갑니다. 해당 데이터를 가지고
		승인요청을 진행 해주시면 됩니다.
		
		 */
		//폼 id = kcp_order_info
		var form = document.getElementById("kcp_order_info");
		closeEvent();
		
		// 
		frm.action = "/payProc2";
		frm.submit();
	} else {
		/*
		(인증실패) 인증 실패 처리 진행
		 */
		// alert("[" + frm.res_cd.value + "] " + frm.res_msg.value);
		closeEvent();
	}
}
/* 이 함수를 실행하여 표준웹 실행 */
function jsf__pay() {
	try {
		var form = document.kcp_order_info;
		KCP_Pay_Execute(form);
	} catch (e) {
		/* IE 에서 결제 정상종료시 throw로 스크립트 종료 */
	}
}
</script>

<body id="userStyle">
	<!-- [상단영역] -->
	<header id="header">
		<!-- app tag -->
		<div id="ec-orderform-header-head"></div>
		<div class="header">
			<h1 class="xans-element- xans-layout xans-layout-logotop ">
				<a href="/">Dimple Case</a>
			</h1>
			<div class="headerMenu gLeft">
				<span class="xans-element- xans-layout xans-layout-mobileaction btnBack ">
					<a href="#none" onclick="document.referrer ? history.go(-1) : location.href='/';return false;">
					"뒤로가기"
					</a>
				</span>
			</div>
			<div class="headerMenu gRight">
				<span class="xans-element- xans-layout xans-layout-orderbasketcount btnBasket ">
					<a href="cartlist">
					"장바구니"
						<span class="count EC-Layout_Basket-count-display">
							<span class="EC-Layout-Basket-count">
								${cartTot}
							</span>
						</span>
					</a>
				</span>
				<a href="/" class="xans-element- xans-layout xans-layout-statelogon btnMy ">
				마이쇼핑
				</a>
			</div>
		</div>
		<div class="titleArea">
			<h1>주문/결제</h1>
		</div>
		<!-- app tag -->
		<div id="ec-orderform-header-tail"></div>
	</header>
	<div id="titleArea" class="titleArea">
		<h1>주문/결제</h1>
	</div>
	
<div>
		<br>
		<c:forEach var="cart" items="${cart}">	
			<input type="hidden" name="price" value="${cart.price}" class="num" readonly="readonly">
			<input type="hidden" name="quantity" class="num" value="${cart.quantity}">
			<input type="hidden" name="totPrice" value="${cart.price * cart.quantity}" class="num" readonly="readonly">
			<input type="hidden" name="itemName" value="${cart.p_name}">
			<input type="hidden" name="userName" value="${ssKey.mem_id}">
		<br>
		</c:forEach>
	</div>
		<div>
		</div>
		<div id="mCafe24Order" class="xans-element- xans-order xans-order-form typeHeader xans-record-">
			<div id="ec-jigsaw-area-productdetail"></div>
			<div class="billingNshipping">
				<!-- 주문자정보 -->
				<div id="ec-jigsaw-area-billingInfo" class="ec-base-fold eToggle displaynone">
					<div id="ec-jigsaw-title-billingInfo" class="title">
						<h2>주문 정보</h2>
						<span id="ec-jigsaw-heading-billingInfo" class="txtEm gRight">undefined(dfgh2877@naver.com)
						</span>
					</div>
				</div>
				
				<!-- 수령자 정보 -->
				<div id="ec-jigsaw-area-shippingInfo" class="ec-base-fold eToggle selected">
					<div id="ec-jigsaw-title-shippingInfo" class="title">
						<h2>배송지</h2>
						
					</div>
					<div class="contents">
						<!-- app tag -->
						<div id="ec-orderform-billingNshipping-head"></div>
						<!-- 국내배송 정보 -->
						<div class>
							<div id="ec-jigsaw-tab-shippingInfo" class="ec-base-tab ">
								<ul>
									<li id="ec-jigsaw-tab-shippingInfo-recentAddress" class>
										<a href="#none">최근 배송지</a>
									</li>
									<li id="ec-jigsaw-tab-shippingInfo-newAddress" class="selected">
										<a href="#none">직접입력</a>
									</li>
								</ul>
							</div>
							<!-- 최근배송지 -->
							<div id="ec-shippingInfo-recentAddress" class="tabCont recentShipArea 1" style="display: none;">
								<div id="ec-shippingInfo-recentAddressText" class="segment">
									<div class="ec-shop-deliveryInfoText recent">
										<strong class="name">
											<span class="txtEm" id="ec-shop-deliveryInfoMainLabel"></span>
											<span id="ec-shop-deliveryInfoName">이지호</span>
										</strong>
										<p class="address gBlank10">
											[
											<span id="ec-shop-deliveryInfoZipcode"></span>
											] 
											<span id="ec-shop-deliveryInfoAddress"> </span>
										</p>
										<dl class="contact">
											<dt class>휴대전화</dt>
											<dd class id="ec-shop-deliveryInfoCell">010-4711-7805</dd>
											<dt class="displaynone">일반전화</dt>
											<dd class="displaynone" id="ec-shop-deliveryInfoTel"></dd>
										</dl>
									</div>
									<span class="sideRight">
										<button type="button" id="ec-shippingInfo-showRecentAddressList" class="btnNormal mini">
										배송지 목록
										</button>
									</span>
								</div>
								<div id="ec-shippingInfo-recentAddressList" class="segment" style="display:none;">
									<ul class="shippingList">
										<li class="xans-element- xans-order xans-order-deliverylist ">
											<strong class="name">
												<span id="ec-shippingInfo-recentAddressList-mainLabel-" class="txtEm"></span>
											</strong>
											<div class="description">
												<span class="choice">
													<input type="radio" id="ec-shippingInfo-recentAddressList-choice-select-" name="ec-shippingInfo-recentAddressList-choice" value class="fRadio" autocomplete="off">
												</span>
												<p class="address gBlank10">
													[
													<span class="ec-shippingInfo-recentAddressList-zipcode-"></span>
													] 
													<span class="ec-shippingInfo-recentAddressList-addr1-"></span>
													<br>
													<span class="ec-shippingInfo-recentAddressList-addr2-"></span>
												</p>
												<dl class="contact">
													<dt>휴대전화</dt>
													<dd></dd>
													<dt>일반전화</dt>
													<dd></dd>
												</dl>
											</div>
											<span class="button">
												<button type="button" id="ec-shippingInfo-recentAddressList-choice-modify-" class="btnText">수정</button>
											</span>
										</li>
									</ul>
									<span class="sideRight">
										<button type="button" id="ec-shippingInfo-closeRecentAddressList" class="btnBase mini">닫기</button>
									</span>								
								</div>
							</div>
							<!-- 새 배송지 -->
							<div id="ec-shippingInfo-newAddress" class="tabCont newShipArea ">
								<div class="segment ec-shippingInfo-sameaddr ">
									<input id="sameaddr0" name="sameaddr" fw-filter fw-label="1" fw-msg value="M" type="radio" autocomplete="off">
									<label for="sameaddr0">회원 정보와 동일</label>
									<input id="sameaddr1" name="sameaddr" fw-filter fw-label="1" fw-msg value="F" type="radio" autocomplete="off">
									<label for="sameaddr1">새로운 배송지</label>
								</div>
								<div class="ec-base-table typeWrite">
									<table border="1">
										<caption>배송 정보 입력</caption>
										<colgroup>
											<col style="width:102px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr class="ec-shippingInfo-newAddress-name">
												<th scope="row">
													받는사람 
													<span class="icoRequired">필수</span>
												</th>
												<td>
													<input id="rname" name="rname" fw-filter="isFill" fw-label="수취자 성명" class="inputTypeText" placeholder size="15" value type="text">
												</td>
											</tr>
											<tr id="ec-receiver-address">
														<th scope="row">주소 <span class=""><span class="icoRequired">필수</span></span>
													</th>
			                                <td>
			                                    <ul class="ec-address">
											            <li id="receiver_country_wrap" class="displaynone" style="display: none;">
											                <span id="receiver_directInputCheck_wrap" class="ec-base-label">
											                     <input id="receiver_directInputCheck" name="receiver_directInputCheck" type="checkbox" disabled="">
											                        <label id="receiver_directInputCheckLabel" for="receiver_directInputCheckLabel">직접입력</label>
											                </span>
											            </li>
											            <li id="receiver_zipcode_wrap" class="ec-address-zipcode" style="">
											                <input type="text" name="zipcode" id="sample6_postcode" class="chk form-control" value="${mvo.zipcode}"placeholder="우편번호">
											                  <button class="btnBasic" type="button" onclick="zipCheck()">주소검색</button> 
							               				      <span class="ec-base-label">
							                                      <input id="no_rzipcode0" name="no_rzipcode0" class="displaynone" type="checkbox" disabled="" fw-filter="" style="display: none; cursor: unset;">
							                                      <label id="receiver_zipcode_check_label" for="no_rzipcode0" class="dis0playnone" disabled="" style="display: none;" fw-filter="">우편번호 없음</label>
							                                  </span>
							                                  <span id="receiver_zipcodeNotFoundMsg_wrap" class="ec-base-label displaynone">
							                                    우편번호가 정확하지 않습니다. 다시 확인해 주세요.
							                                  </span>
							                             </li>
							                             <li id="" class="" style="">
													          <input id="sample6_address" name="raddr1" value="${mvo.address}" placeholder="기본주소" fw-filter="isFill" class="inputTypeText" type="text" size="60" maxlength="100" readonly="" fw-label="기본주소" style="">
													     </li>
													     <li id="sample6_extraAddress" class="" style="">
													          <input id="sample6_detailAddress" name="raddr2"  value="${mvo.address2}" placeholder="나머지 주소(선택 입력 가능)" fw-filter="" class="inputTypeText" type="text" size="60" maxlength="255" fw-label="나머지 주소(선택 입력 가능)" style="">
													     </li>
												 </ul> 
											 </td>
							                </tr>
											<tr class="ec-shippingInfo-receiverCell ">
												<th scope="row">
													휴대전화
													<span class>
														<span class="icoRequired">필수</span>
													</span>
												</th>
												<td>
													<div class="ec-base-mail">
														<select id="rphone2_1" name="rphone2_[]" fw-filter="isNumber&isFill" fw-label="수취자 핸드폰번호" fw-alone="N" fw-msg>
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="016">016</option>
															<option value="017">017</option>
															<option value="018">018</option>
															<option value="019">019</option>
														</select>
														-
														<input id="rphone2_2" name="rphone2_[]" maxlength="4" fw-filter="isNumber&isFill" fw-label="수취자 핸드폰번호" fw-alone="N" fw-msg placeholder size="4" value type="text">
														-
														<input id="rphone2_3" name="rphone2_[]" maxlength="4" fw-filter="isNumber&isFill" fw-label="수취자 핸드폰번호" fw-alone="N" fw-msg placeholder size="4" value type="text">
													</div>
												</td>
											</tr>
											<tr class="ec-orderform-emailRow ec-shop-deliverySimpleForm ">
												<th scope="row">
													이메일
													<span class="icoRequired icon_order_email" style>필수</span>
												</th>
												<td>
													<div class="ec-base-mail">
														<input id="oemail1" name="oemail1" class="mailId" value type="text">
														@ 
														<span class="mailAddress">
															<select id="oemail3">
																<option value selected="selected">
																-이메일 선택-
																</option>
																<option value="naver.com">naver.com</option>
																<option value="daum.net">daum.net</option>
																<option value="gmail.com">gmail.com</option>
																<option value="etc">직접입력</option>
															</select>
															<span class="directInput ec-compact-etc">
																<input id="oemail2" name="oemail2" placeholder="직접입력" readonly="readonly" value type="text">
															</span>
														</span>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 주문상품 -->
				<div id="ec-jigsaw-area-orderProduct" class="ec-base-fold eToggle selected">
				    <div id="ec-jigsaw-title-orderProduct" class="title">
				        <h2>주문상품</h2>
				        <span id="ec-jigsaw-heading-orderProduct" class="txtStrong gRight" style="display: none;">1개</span>
				    </div>
					    <div class="contents">
					        <!-- app tag -->
					        <div id="ec-orderform-orderProduct-head"></div>
					        <!-- 국내배송상품 주문내역 -->
					        <div class="orderArea ">
					        <c:forEach var="cart" items="${cart}">
					            <!-- 기본배송 -->
					            <div class="xans-element- xans-order xans-order-normallist"><!-- 참고: 상품반복 -->
									<div class="ec-base-prdInfo xans-record-">
					                    <div class="prdBox">
					                        <div class="displaynone"><input id="chk_order_cancel_list0" name="chk_order_cancel_list_basic0" value="49:0BZL:F:6218" type="checkbox" disabled=""></div>
					                        <div class="thumbnail">
					                        	<img src="/upload/${cart.image}" alt="Sandwich" style="width:100%; height: 5.5rem;">
					                        </div>
					                        <div class="description">
					                            <strong class="prdName" title="상품명"> <a href="/product/mini-checker-board/49/category/24/" class="ec-product-name">mini checker board</a></strong>
					                            <ul class="info">
					                                <li title="옵션">
					                                    <p class="option ">[옵션: black/아이폰 13 mini]</p>
					                                    </li>
					                                <li>수량: ${cart.quantity}개</li>
					                                <li id="" class="displaynone">
					                                    <span class="txtWarn displaynone">()</span>
					                                </li>
					                            </ul>
					                            <div class="proPrice">
					                                <span class="displaynone"></span>
					                                <span class="display">
					                                    <span id="">
					                                    <p>
					                                    	<input type="text" value="${cart.price}원" class="num inputPrice" readonly="readonly">
					                                    </p>
					                                    </span>
					                                     <span class="displaynone">()</span>
					                                </span>
					                            </div>
					                        </div>
					                        <button type="button" class="btnRemove " id="btn_product_one_delete_id0" prd="49:0BZL:F:6218" set_prd_type="">삭제</button>
					                    </div>
					                </div>
					<!-- //참고 -->
					<!-- 참고: 상품반복 -->
					<!-- //참고 -->
					</div>
					</c:forEach>
				            <div class="totalPrice ">
				                <div class="title">
				                    <h3>배송비</h3>
				                    <span class="deliveryFee"><span id="domestic_ship_fee">3,000</span>원</span>
				                </div>
				            </div>
				        <!-- app tag -->
				        <div id="ec-orderform-orderProduct-tail"></div>
				    </div>
				    <div id="ec-shop-directbuy-order-product-info" class="displaynone"></div>
				</div>
			</div>
			<!-- 결제정보 -->
			<div id="ec-jigsaw-area-payment" class="ec-base-fold eToggle selected">
    <div id="ec-jigsaw-title-payment" class="title">
        <h2>결제정보</h2>
    </div>
    <div class="contents">
        <!-- app tag -->
        <div id="ec-orderform-payment-head"></div>

        <div class="segment">
            <div class="ec-base-table gCellNarrow">
                <table border="1">
					<caption>결제정보 상세</caption>
					                    <colgroup>
					<col style="width:155px">
					<col style="width:auto">
					</colgroup>
					<tbody>
					<tr>
					<th scope="row">주문상품</th>
					                        <td class="right"><span id="total_product_base_price_id" class="price">
					                     	${SubTot}원
					                        </span></td>
					                    </tr>
					<tr class="">
					<th scope="row">배송비 <span class="displaynone info">(착불 상품 포함)</span>
					</th>
					                        <td class="right"><span class="price"><span id="total_ship_price_id">3,000원</span></span></td>
					                    </tr>
					<tr id="ec-shop-payment_discount_list_view" class="paymentList" style="display: none;">
					<td colspan="2">
			</td>
			        </tr>
			</tbody>
			</table>
			</div>
	     </div>
			        <div class="totalPay paymentPrice">
			            <h3 class="heading">최종 결제 금액</h3>
			            <strong class="txtStrong">
			                <strong id="payment_total_order_sale_price_view" class="total_price_d"></strong>원
			            </strong>
			            <input type="hidden" name="total" value="${SubTot}" class="number" readonly="readonly">
			            <span class="displaynone"></span>
			        </div>
			
			        <!-- app tag -->
			        <div id="ec-orderform-payment-tail"></div>
			    </div>
			</div>
			<!-- 결제수단 -->
			<div id="ec-jigsaw-area-paymethod" class="ec-base-fold eToggle selected">
  			  <div id="ec-jigsaw-title-paymethod" class="title">
       			 <h2>결제수단</h2>
   			  </div>
   		    </div>
   		    <div id="ec-jigsaw-area-agreement">
   		    	<div class="agreeArea" id="all_agreement_checkbox">
   		    		<div class="allAgree" style="display: none;">
   		    			<input type="checkbox" id="allAgree">
   		    			<label for="allAgree">
   		    				<strong>모든 약관 동의</strong>
   		    			</label>
   		    		</div>
   		    		<div class="checkNone">
   		    			<ul>
   		    				<li id="chk_purchase_agreement1" style>
   		    					<div class="agree">
   		    						<span class="check">
   		    							<label for="chk_purchase_agreement0">
   		    							구매조건 확인 및 결제진행 동의
   		    							</label>
   		    						</span>
   		    					</div>
   		    				</li>
   		    			</ul>
   		    			<div class="agree-msg" id="agreeMsg">
   		    				<p>주문 내용을 확인하였으며 동의합니다.</p>
   		    			</div>
   		    		</div>
   		    	</div>
   		    </div>
			
	   		<div class="ec-base-button gFull" id="orderFixItem">
	   		<form name="kcp_order_info" id="kcp_order_info" action="/authPay" method="post" accept-charset="euc-kr">
					<input type="hidden" name="ordr_idxx" value="${data.ordr_idxx }"> 
					<input type="hidden" name="good_name" value="${data.good_name }"> 
					<input type="hidden" name="good_mny" value="${data.good_mny }">
					<input type="hidden" name="buyr_name" value="${data.buyr_name }"> 
					<input type="hidden" name="site_cd" value="${data.site_cd }">
			
					<!-- 고정값 -->
					<input type="hidden" name="req_tx" value="pay">
					<input type="hidden" name="pay_method" value="100000000000">
					<input type="hidden" name="site_name" value="payup" />
			
						<!--
						 ※ 필 수
						 필수 항목 : 표준웹에서 값을 설정하는 부분으로 반드시 포함되어야 합니다
						 값을 설정하지 마십시오
						-->
					<input type="hidden" name="res_cd" value="" />
					<input type="hidden" name="res_msg" value="" />
					<input type="hidden" name="enc_info"value="" />
					<input type="hidden" name="enc_data" value="" />
					<input type="hidden" name="ret_pay_method" value="" />
					<input type="hidden" name="tran_cd" value="" />
					<input type="hidden" name="use_pay_method" value="" />
					<input type="hidden" name="buyr_mail" value="">
					<input type="hidden" name="ordr_chk" value="" />
					<!-- 2012년 8월 18일 전자상거래법 개정 관련 설정 부분 -->
					<!-- 제공 기간 설정 0:일회성 1:기간설정(ex 1:2012010120120131) -->
					<input type="hidden" name="good_expr" value="0">
					<!-- 표준웹 설정 정보입니	다(변경 불가) -->
					<input type="hidden" name="module_type" value="01" />
					<!-- 필수 항목 : 결제 금액/화폐단위 -->
					<input type="hidden" name="currency" value="WON" />

	   		    	<button type="button" class="btnSubmit" id="btn_payment" onclick="javascript:jsf__pay();" value="결제하기">
	   		    		<strong id="total_order_sale_price_view" class="total_price_d">
	
	   		    		</strong>원
						결제하기
	   		    	</button>
			</form>
	   		    </div>

   		    <div class="helpArea">
   		    	<ul class="ec-base-help typeDash">
   		    		<li>
   		    		무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다. 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.
   		    		</li>
   		    		<li>
   		    		최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.
   		    		</li>
   		    	</ul>
   		    </div>
		</div>
	</div>

</body>
</html>