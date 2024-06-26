<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<form action="registerProc" name="form1" method="post">
	<table class="signup-main">
		<tr class="sign-title">
			<th colspan="3">회원가입</th>
		</tr>
		<tr>
			<th class="col1">아이디</th>
			<th class="col2"><input type="text" name="mem_id" id="idchk" 
									title="ID" class="chk" placeholder="ID 입력 필수">
			</th>
			<th class="input-state"><font id="warning" size="2" color="red"></font></th>
		</tr>
		<tr>
			<th class="col1">패스워드</th>
			<th class="col2"><input type="password" name="m_passwd" id="check1" 
				title="password" class="chk" placeholder="PASSWORD 입력 필수">
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
				title="이름" class="chk" placeholder="이름 입력 필수">
			</th>
		</tr>
		<tr>
			<th class="col1">이메일</th>
			<th class="col2"><input type="text" name="m_email" class="chk" title="이메일"
			placeholder="aaa@himedia.co.kr">
		</tr>
		<tr>
			<th class="col1">전화번호</th>
			<th class="col2"><input type="text" name="m_phone"  
				title="전화번호" class="chk" placeholder="010-0000-0000">
			</th>
		</tr>
		<tr>
			<th class="col1">우편번호</th>
			<th class="col2"><input type="text" name="zipcode" id="sample6_postcode"
				readonly="readonly" title="우편번호" 
				class="chk" placeholder="우편번호를 검색하시오">
			</th>
			<th class="input-state">
				<button class="btn-primary" type="button" onclick="zipCheck()">우편번호찾기</button>
			</th>
		</tr>
		<tr>
			<th class="col1">주소</th>
			<th class="col2">
				<input type="text" name="address" 
				class="chk" 
				readonly="readonly" id="sample6_address"
				title="우편번호 검색" placeholder="주소를 검색하시오">
				<input type="text" name="address2" id="sample6_detailAddress" placeholder="상세주소">
				<input type="hidden" id="sample6_extraAddress" >
			</th>
		</tr>
		<tr>
			<th class="col1">직업</th>
			<th class="col2">
				<select name="m_job" class="chk selector">
					<option value="">선택하시오</option>
					<option value="회사원">회사원</option>
					<option value="기술자">기술자</option>
					<option value="학생">학생</option>
				</select>
			</th>
			<th>&nbsp;</th>
		</tr>
		
		<tfoot>
		<tr>
			<td colspan="3">
				<button type="button" id="submit1" class="btn-primary">회원가입</button>
			</td>
		</tr>
		</tfoot>
	</table>
	
</form>
</body>
</html>