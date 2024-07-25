<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAY RESULT</title>
<style>
	table, tr, th {
	border-collapse: collapse;
	border: 1px solid #000;
	padding: 4px;
	}
</style>
<link rel="stylesheet" type="text/css" href="./css/PayRes.css" />
</head>
<body>
	<c:if test="${data.responseCode eq '0000'}" >
		<%-- <p>${responseMsg}</p> --%>
		<div class="success-header">
			class="success-title">결제 성공</h1>
			<p>결제금액 : ${data.amount}</p>
			<p>결제수단 : ${data.cardName}</p>
			<p>결제날짜 : ${data.authDateTime}</p>
			<br>
		</div>
		<div class="success-article">
			<p>
			
			</p>
		</div>

	</c:if>
	<!-- 'ne' == '!=' -->
	<c:if test="${data.responseCode ne '0000'}" >
		<div class="fail-header">
			<h1 class="fail-title">결제 실패</h1>
			<p>${data.responseMsg}</p>
			<p>자세한 사항은 고객센터에 문의바랍니다.</p>
			<br>
		</div>
		<br>
		<div class="fail-article">
			<p>
			<span style="font-size: 10pt; font-family: Arial; text-align: center;" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;신용카드 결제 중 오류가 나는 원인에는 여러가지가 있을 수 있습니다. 1. 결제시 카드정보 오입력 결제시 카드번호, 비밀번호, 카드 유효기간, 주민등록번호 등이 정상적으로 입력되지 않은 경우, 결제오류가 발생할 수 있습니다. 결제정보 입력 시, 정확한 정보를 확인 후 입력해주시기 바랍니다. 2. 결제 카드 자체 오류 결제하려는 카드의 한도가 초과되었거나 사용중지가 된 경우, 오류가 발생할 수 있습니다. 3. 타임아웃 오류 카드결제 승인 과정에서 일정 시간이 초과될 경우, 타임아웃 오류가 발생할 수 있습니다. 일시적으로 발생하는 오류이니 조금 후에 다시 시도해 주시기 바랍니다. 카드정보가 옳지 않아 오류가 발생한 경우, 카드 승인이 발생하지 않으므로 주문건 또한 무효화됩니다. 위 사항외에도 안심클릭이나 ISP 결제 등 결제 서비스의 오류로 인하여 카드 실패가 일어날 수 있으며, 이 경우 각각의 오류 사유를 가지고 각 해당 카드사에 직접 문의하여 주시기 바랍니다.&quot;}" data-sheets-userformat="{&quot;2&quot;:8403779,&quot;3&quot;:[null,0],&quot;4&quot;:[null,2,16777215],&quot;9&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0,&quot;14&quot;:[null,2,4473924],&quot;15&quot;:&quot;\&quot;Nanum Gothic\&quot;, dotum, arial, sans-serif&quot;,&quot;16&quot;:9,&quot;26&quot;:400}">신용카드 결제 중 오류가 나는 원인에는 여러가지가 있을 수 있습니다.</span></p><p><span style="font-size: 10pt; font-family: Arial; text-align: center;" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;신용카드 결제 중 오류가 나는 원인에는 여러가지가 있을 수 있습니다. 1. 결제시 카드정보 오입력 결제시 카드번호, 비밀번호, 카드 유효기간, 주민등록번호 등이 정상적으로 입력되지 않은 경우, 결제오류가 발생할 수 있습니다. 결제정보 입력 시, 정확한 정보를 확인 후 입력해주시기 바랍니다. 2. 결제 카드 자체 오류 결제하려는 카드의 한도가 초과되었거나 사용중지가 된 경우, 오류가 발생할 수 있습니다. 3. 타임아웃 오류 카드결제 승인 과정에서 일정 시간이 초과될 경우, 타임아웃 오류가 발생할 수 있습니다. 일시적으로 발생하는 오류이니 조금 후에 다시 시도해 주시기 바랍니다. 카드정보가 옳지 않아 오류가 발생한 경우, 카드 승인이 발생하지 않으므로 주문건 또한 무효화됩니다. 위 사항외에도 안심클릭이나 ISP 결제 등 결제 서비스의 오류로 인하여 카드 실패가 일어날 수 있으며, 이 경우 각각의 오류 사유를 가지고 각 해당 카드사에 직접 문의하여 주시기 바랍니다.&quot;}" data-sheets-userformat="{&quot;2&quot;:8403779,&quot;3&quot;:[null,0],&quot;4&quot;:[null,2,16777215],&quot;9&quot;:1,&quot;11&quot;:4,&quot;12&quot;:0,&quot;14&quot;:[null,2,4473924],&quot;15&quot;:&quot;\&quot;Nanum Gothic\&quot;, dotum, arial, sans-serif&quot;,&quot;16&quot;:9,&quot;26&quot;:400}"><br></span></p><p><span style="font-family: Arial; font-size: 10pt; text-align: center;">1. 결제시 카드정보 오입력 결제시 카드번호, 비밀번호, 카드 유효기간, 주민등록번호 등이 정상적으로 입력되지 않은 경우,<br>&nbsp; &nbsp; 결제오류가 발생할 수 있습니다. </span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;">&nbsp; &nbsp; 결제정보 입력 시, 정확한 정보를 확인 후 입력해주시기 바랍니다.</span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;"><br></span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;">2. 결제 카드 자체 오류 결제하려는 카드의 한도가 초과되었거나 사용중지가 된 경우, 오류가 발생할 수 있습니다. </span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;"><br></span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;">3. 타임아웃 오류 카드결제 승인 과정에서 일정 시간이 초과될 경우, 타임아웃 오류가 발생할 수 있습니다. </span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;">&nbsp; &nbsp; 일시적으로 발생하는 오류이니 조금 후에 다시 시도해 주시기 바랍니다. 카드정보가 옳지 않아 오류가 발생한 경우</span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;">&nbsp; &nbsp; 카드 승인이 발생하지 않으므로 주문건 또한 무효화됩니다.</span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;">&nbsp; &nbsp;</span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;">&nbsp; &nbsp; 위 사항외에도 안심클릭이나 ISP 결제 등 결제 서비스의 오류로 인하여 카드 실패가 일어날 수 있으며,</span></p><p><span style=" font-family: Arial; font-size: 10pt; text-align: center;">&nbsp; &nbsp; 이 경우 각각의 오류 사유를 가지고 각 해당 카드사에 직접 문의하여 주시기 바랍니다.</span></p>
		</div>
	</c:if>
	<div class="btnArea" align="center">
		<button type="button" onclick="location.href='/orderList'" class="btnJoin2">주문내역</button>	
		<button type="button" onclick="location.href='/info'" class="btnJoin">마이페이지</button>
	</div>
</body>
</html>