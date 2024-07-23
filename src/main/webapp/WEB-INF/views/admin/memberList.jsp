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
	<h2 style="text-align: center;">고객관리</h2>
	<div align="right" class="mb-2">
       <button class="btn btn-dark">총 회원수 : ${memTot}</button>
    </div>

	<table class="table table-hover text-center table-bordered border-dark">
		<thead>
			<tr>
				<th class="tbcol mcol1">고객명(고객아이디)</th>
				<th class="tbcol mcol2">고객이메일</th>
				<th class="tbcol mcol3">고객연락처</th>
				<th class="tbcol mcol4">고객가입일</th>
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
	   					<td class="tbcol mcol1">
		   					<input type="text" name="m_name" value="${member.m_name}(${member.mem_id})"
		    					class="mdetail" readonly="readonly" style="text-align: center;">
		   					<input type="hidden" name="mem_id" value="${member.mem_id}" class="">
		   					<input type="hidden" name="zipcode" value="${member.zipcode}" class="">
		   					<input type="hidden" name="address" value="${member.address}" class="">
		   					<input type="hidden" name="address2" value="${member.address2}" class="">
		   					<input type="hidden" name="m_job" value="${member.m_job}" class="">
	    				</td>
		   				<td class="tbcol mcol2">
		   					<input type="text" name="m_email" value="${member.m_email}"
			   					class="" readonly="readonly" style="text-align: center;">
		   				</td>
	     				<td class="tbcol mcol3">
	     					<input type="text" name="m_phone" value="${member.m_phone}"
		   						class="number" readonly="readonly" style="text-align: center;">
		   				</td>
		   				<td class="tbcol mcol4">
		   					<input type="text" name="m_regdate" value="${member.m_regdate}"
			   					class="number" readonly="readonly" style="text-align: center;">
		   				</td>
		   				</tr>
					</c:forEach> 
				</c:when>
			</c:choose>
		</tbody>
	</table>
	<!-- 페이지  -->
     <div class="PageNation" align="center">
     <c:if test="${pgVo.startPg>PBlock}">
	     <font color="4c5317">
	         <a href="/memberFIX?curPg=${pgVo.startPg-PBlock}&curBl=${pgVo.curBl-1}">[이전]</a>
	     </font>
     </c:if>
     <c:forEach var="pgno" begin="${pgVo.startPg}" end="${pgVo.endPg}" step="1">
         <c:set scope="page" var="list" 
                  value="./memberFIX?curPg=${pgno}&curBl=${pgVo.curBl}"/> 
         <a href="${list}" style=" text-decoration:none;">
         <c:choose>
             <c:when test="${pgVo.curPg==pgno}">
                <font color="4c5317" style="font-weight: bold;">[${pgno}]</font>
              </c:when>
             <c:otherwise>
               <font color="4c5317">[${pgno}]</font>
              </c:otherwise>
           </c:choose>
         </a>                  
     </c:forEach>
      <c:if test="${pgVo.endPg<pgVo.pgCnt}">
             <font color="4c5317">
               <a href="./productFIX?curPg=${pgVo.startPg+PBlock}&curBl=${pgVo.curBl+1}">[다음]</a>
             </font>
       </c:if> 
     </div>
     <div style="margin-bottom: 15px;"></div>
     <!-- 페이지 끝 -->
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