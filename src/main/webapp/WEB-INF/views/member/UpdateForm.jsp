<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
<form action="memUpdateProc" name="form1" method="post">
	<table class="signup-main">
		<tr class="sign-title">
			<th colspan="3">회원정보 수정</th>
		</tr>
		<tr>
			<th class="col1">아이디</th>
			<th class="col2">
				<input type="text" name="mem_id"
					title="ID" class="chk" value="${mvo.mem_id}" readonly="readonly">
			</th>
			<th class="input-state"><font id="warning" size="2" color="red"></font></th>
		</tr>
		<tr>
			<th class="col1">패스워드</th>
			<th class="col2"><input type="password" name="m_passwd" id="check1" 
				title="password" class="chk" value="${mvo.m_passwd}">
			</th>
			<th class="input-state"><font id="check" size="2" color="green"></font></th>
			
		</tr>
		<tr>
			<th class="col1">패스워드 확인</th>
			<th class="col2"><input type="password" name="m_repasswd" id="check2" 
				title="passwordChk" class="chk" placeholder="PASSWORD 확인 필수">
			</th>
		</tr>
		<tr>
			<th class="col1">이름</th>
			<th class="col2"><input type="text" name="m_name" 
				title="이름" class="chk" value="${mvo.m_name}">
			</th>
		</tr>
		<tr>
			<th class="col1">이메일</th>
			<th class="col2"><input type="text" name="m_email" class="chk"
				value="${mvo.m_email}">
			</th>
			<th class="col3"><font class="emailNm"></font></th>
		</tr>
		<tr>
			<th class="col1">전화번호</th>
			<th class="col2"><input type="text" name="m_phone"  
				title="전화번호" class="chk" value="${mvo.m_phone}">
			</th>
		</tr>
		<tr>
			<th class="col1">우편번호</th>
			<th class="col2"><input type="text" name="zipcode" id="sample6_postcode"
				readonly="readonly" title="우편번호" 
				class="chk" value="${mvo.zipcode}">
			</th>
			<th class="input-state col3">
				<button class="btn-primary" type="button" onclick="zipCheck()">우편번호찾기</button>
			</th>
		</tr>
		<tr>
			<th class="col1">주소</th>
			<th class="col2">
				<input type="text" name="address" 
				class="chk" 
				readonly="readonly" id="sample6_address"
				title="우편번호 검색" value="${mvo.address}">
				<input type="text" name="address2" id="sample6_detailAddress" value="${mvo.address2}">
				<input type="hidden" id="sample6_extraAddress" >
			</th>
		</tr>
		<tr>
			<th class="col1">직업</th>
			<th class="col2">
				<select name="m_job" class="chk selector">
					 <option value="">선택하시오.</option>
		             <option value="회사원">회사원</option>
					 <option value="기술사">기술사</option>
					 <option value="연구전문직">연구전문직</option>
					 <option value="학생">학생</option>
					 <option value="교수">교수</option>
					 <option value="일반자영업">일반자영업</option>
					 <option value="공무원">공무원</option>
					 <option value="의료인">의료인</option>
					 <option value="전문직">전문직(법률,회계)</option>
					 <option value="종교,언론,예술인">종교.언론/예술인</option>
					 <option value="농,축,수산,광업인">농/축/수산/광업인</option>
					 <option value="주부">주부</option>
					 <option value="무직">무직</option>
					 <option value="기타">기타</option>
				</select>
				<script type="text/javascript">
					$(function(){
						$('select[name="m_job"]').val('${mvo.m_job}')
					})		
				</script>
			</th>
			<th>&nbsp;</th>
		</tr>
		
		<tfoot>
		<c:if test="${ssKey.m_role=='mem'}">
		<tr>
			<td colspan="3">
				<button type="button" id="submit3" class="btn-primary">정보수정</button>
				<button type="button" id="cancel" class="btn-primary">취소</button>
			</td>
		</tr>
		</c:if>
		<c:if test="${ssKey.m_role=='admin'}">
		<tr>
			<td colspan="3">
				<button type="button" id="submit3" class="btn-primary">정보수정</button>
			</td>
		</tr>
		</c:if>
		</tfoot>
	</table>
</form>
</body>
</html>
