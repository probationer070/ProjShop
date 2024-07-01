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
<div id="join">
	<table class="signup-main">
	<h3>회원가입</h3>
	<tr>
      <th class="col1" >아이디</th>
      <th class="col2"><input type="text"  name="mem_id" id="idchk" title="아이디" 
         class="chk form-control" placeholder="아이디를 입력하시오">
      </th>
      <th class="col3">&nbsp;<font id="warning" size="2" color="red"></font></th>
    </tr>
    <tr>
      <th class="col1">패스워드</th>
      <th class="col2"><input type="password" name="m_passwd" id="check1"
          title="패스워드" class="chk form-control" placeholder="패스워드를 입력하시오">
      </th>
      <th class="col3">&nbsp;<font id="check" size="2" color="green"></font></th>
    </tr>
    <tr>
      <th class="col1">패스워드 확인</th>
      <th class="col2"><input type="password"  name="m_repasswd" id="check2" 
          title="패스워드 확인" class="chk form-control" placeholder="패스워드를 확인하시오">
      </th>
      <th class="col3">&nbsp;</th>
    </tr>
     <tr>
       <th class="col1">이름</th>
       <th class="col2">
         <input type="text" name="m_name" class="chk form-control" title="이름"
            placeholder="이름을 입력하시오.">
       </th>
       <td class="col3">&nbsp;</td>
      </tr>
      <tr>
       <th class="col1">이메일</th>
       <td class="col2">
         <input type="text" name="m_email" class ="form-control" 
           placeholder="aaa@himidia.co.kr">
       </td>
	  <td class="col3"><font class="emailNm" size="2"></font></td>
      </tr>
      <tr>
       <th class="col1">전화번호</th>
       <td class="col2">
         <input type="text" name="m_phone" class="chk form-control" title="전화번호"
           placeholder="전화번호(010-1111-1234)">
       </td>
        <td class="col3">&nbsp;</td>
      </tr>
      <tr>
        <th class="col1">우편번호</th>
       <td class="col2">
         <input type="text" name="zipcode" id="sample6_postcode" 
           readonly="readonly"
           class="chk form-control"  title="우편번호"
           placeholder="우편번호를 검색하시오">
       </td>
       <td class="col3"><button class="btn btn-outline-info" 
          type="button" onclick="zipCheck()">우편번호찾기</button> 
        </td>
      </tr>
      <tr>
        <th class="col1">주소</th>
        <td class="col2">
          <input type="text" name="address"
               class="chk form-control" 
               readonly="readonly" id="sample6_address"
               placeholder="주소를 입력합니다." title="우편번호검색">
          <input type="text" name="address2"  class="chk form-control"  
             id="sample6_detailAddress" placeholder="상세주소">
          <input type="hidden" id="sample6_extraAddress">
        </td>
        <td class="col3"></td>
      </tr>
      <tr>
        <th class="col1">직업</th>
        <td class="col2">
           <select name="m_job" class="form-control">
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
        </td>
        <td class="col3">&nbsp;</td>
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
</div>
</body>
</html>