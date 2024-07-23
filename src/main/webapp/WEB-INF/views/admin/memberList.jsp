<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="../css/MemberList.css" />

<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script src="./js/product.js" defer="defer"></script>
</head>
<body>
	
<div id="productmgt">
	<h2>고객관리</h2>
	<div align="right" class="mb-2">
       <button class="btn btn-dark">총 회원수 : ${memTot}</button>
    </div>

	<table class="table table-hover text-center table-bordered border-dark">
		<thead>
			<tr>
				<th>고객명(고객아이디)</th>
				<th>고객이메일</th>
				<th>고객연락처</th>
				<th>고객가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(members)==0}">
					<tr>
						<th colspan="5">등록된 고객이 없습니다.</th>
					</tr>
				</c:when>
				<c:when test="${fn:length(members)>0}">
					<c:forEach var="member" items="${members}">
						<tr>
	   					<td>
		   					<input type="text" name="m_name" value="${member.m_name}(${member.mem_id})"
		    					class="mdetail" readonly="readonly">
		   					<input type="hidden" name="mem_id" value="${member.mem_id}" class="">
		   					<input type="hidden" name="zipcode" value="${member.zipcode}" class="">
		   					<input type="hidden" name="address" value="${member.address}" class="">
		   					<input type="hidden" name="address2" value="${member.address2}" class="">
		   					<input type="hidden" name="m_job" value="${member.m_job}" class="">
	    				</td>
		   				<td>
		   					<input type="text" name="m_email" value="${member.m_email}"
			   					class="" readonly="readonly">
		   				</td>
	     				<td>
	     					<input type="text" name="m_phone" value="${member.m_phone}"
		   						class="number" readonly="readonly">
		   				</td>
		   				<td>
		   					<input type="text" name="m_regdate" value="${member.m_regdate}"
			   					class="number" readonly="readonly">
		   				</td>
		   				</tr>
					</c:forEach> 
				</c:when>
			</c:choose>
		</tbody>
	</table>
	<form name="form1" method="post" action="">
		<input type="hidden" name="mem_id" value="">
		<input type="hidden" name="m_name" value="">
		<input type="hidden" name="zipcode" value="">
		<input type="hidden" name="address" value="">
		<input type="hidden" name="address2" value="">
		<input type="hidden" name="m_job" value="">
		<input type="hidden" name="m_phone" value="">
		<input type="hidden" name="m_email" value="">
		<input type="hidden" name="m_regdate" value="">
	</form>
</div>
			
</body>
</html>