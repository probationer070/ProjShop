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
</head>
<body>
	<!-- <table>
		<thead>
			<tr>
			<th>orderNumber</th>
			<th>amount</th>
			<th>cardName</th>
			<th>authNumber</th>
			<th>authDateTime</th>
			<th>thansactionId</th>
			<th>responseCode</th>
			<th>responseMsg</th>
			</tr>
		</thead>	
		<tbody>
			<tr>
			<th>${data.orderNumber}</th>
			<th>${data.amount}</th>
			<th>${data.cardName}</th>
			<th>${data.authNumber}</th>
			<th>${data.authDateTime}</th>
			<th>${data.transactionId}</th>
			<th>${data.responseCode}</th>
			<th>${data.responseMsg}</th>
			</tr>
		</tbody>
	
	</table> -->
	<p>${data}</p>
	<c:if test="${data.responseCode eq '0000'}" >
		<p>${responseMsg}</p>
		<p>처리 성공</p>
	</c:if>
	<!-- 'ne' == '!=' -->
	<c:if test="${data.responseCode ne '0000'}" >
		<p>${responseMsg}</p>
		<p>처리 실패</p>
	</c:if>
	
	<!-- <a href="/cancelForm">취소하기</a> -->
	<a href="/cancelProc2">취소하기2</a>
</body>
</html>