<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/signup.css" />
<script type="text/javascript" src="js/member.js"></script>
</head>
<body>
<form action="registerProc" name="form1" method="post">
<div id="join">
	<h2>회원가입</h2>
	<table class="signup-main">
	<colgroup>
	  <col style="width:220px";>
	  <col style="width:auto";>
	</colgroup>
	<tr>
      <th class="col1"><img src="/images/blue_dot.gif">아이디</th>
      <th class="col2">
      <div class="input-container">
	      <input type="text"  name="mem_id" id="idchk" title="아이디" class="chk form-control">
	      <span class="txtInfo">(영문소문자/숫자, 4~16자)</span>
      </div>
      </th>
      <th class="col3">&nbsp;<font id="warning" size="2" color="red"></font></th>
    </tr>
    <tr>
      <th class="col1"><img src="/images/blue_dot.gif">패스워드</th>
      <th class="col2">
      	<div class="input-container">
	        <input type="password" name="m_passwd" id="check1" title="패스워드" class="chk form-control">
	        <span class="txtInfo">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span>
      	</div>
      </th>
      <th class="col3">&nbsp;<font id="check" size="2" color="green"></font></th>
    </tr>
    <tr>
      <th class="col1"><img src="/images/blue_dot.gif">패스워드확인</th>
      <th class="col2">
      	<div class="input-container">
      	  <input type="password"  name="m_repasswd" id="check2" title="패스워드 확인" class="chk form-control">
      	</div>
      </th>
      <th class="col3">&nbsp;</th>
    </tr>
     <tr>
       <th class="col1"><img src="/images/blue_dot.gif">이름</th>
       <th class="col2">
         <div class="input-container">
           <input type="text" name="m_name" class="chk form-control" title="이름" placeholder="홍길동">
         </div>
       </th>
       <td class="col3">&nbsp;</td>
      </tr>
      <tr>
       <th class="col1"><img src="/images/blue_dot.gif">이메일</th>
       <td class="col2">
       	 <div class="input-container">	
           <input type="text" name="m_email" class ="form-control" placeholder="user123@naver.com">
       	 </div>
       </td>
	  <td class="col3"><font class="emailNm" size="2"></font></td>
      </tr>
      <tr>
       <th class="col1"><img src="/images/blue_dot.gif">전화번호</th>
       <td class="col2">
         <div style="float: left">  
           <select id="mobile1" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N">
             <option value="010">010</option>
             <option value="011">011</option>
             <option value="016">016</option>
             <option value="017">017</option>
             <option value="018">018</option>
             <option value="019">019</option>
           </select>
           -
           <input id="mobile2" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" type="text">
           -
           <input id="mobile3" maxlength="4" fw-filter="isNumber&isFill" fw-label="휴대전화" fw-alone="N" type="text">
           <input class="m_phone" name="m_phone" type="hidden" value="010">
         </div>
       </td>
        <td class="col3">&nbsp;</td>
      </tr>
      <tr>
        <th class="col1"><img src="/images/blue_dot.gif">주소</th>
        <td class="col2">
          <div class="input-container">
          	<div>
             <input type="text" name="zipcode" id="sample6_postcode" readonly="readonly"
           		class="chk form-control"  title="우편번호">
             <button class="btn" type="button" onclick="zipCheck()">우편번호</button>
          	</div>
            <input type="text" name="address" class="chk form-control" 
               readonly="readonly" id="sample6_address" title="우편번호검색">
            <input type="text" name="address2"  class="chk form-control"  
             id="sample6_detailAddress" placeholder="상세주소">
            <input type="hidden" id="sample6_extraAddress">
          </div>
        </td>
        <td class="col3"></td>
      </tr>
      <tr>
			<th class="col1"><img src="/images/blue_dot.gif">직업</th>
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
		<tr>
			<td colspan="3">
				<button type="button" class="btnBack" onclick="location.href='/'">취소</button>
				<button type="button" id="submit1" class="btnJoin">가입하기</button>
			</td>
		</tr>
		</tfoot>
	</table>
	
</div>
</form>
</body>
</html>