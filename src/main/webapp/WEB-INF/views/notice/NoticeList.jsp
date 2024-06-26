<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="/css/Notice.css" />
<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
<script src="/js/notice.js" defer="defer"></script>
</head>
<body>
	
<div id="noticemgt">
	<h2>공지사항</h2>
	<div class="totalitem" align="right">총 게시물 수 : ${noticeTot}</div>
	<table>
		<thead>
			<tr>
				<th class="ncol1">제목</th>
				<th class="ncol2">작성자</th>
				<th class="ncol3">작성일자</th>
				<th class="ncol4">생성일자</th>
				<th class="ncol5">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(nvo)==0}">
					<tr>
						<th colspan="5">등록된 게시물이 없습니다.</th>
					</tr>
				</c:when>
				<c:when test="${fn:length(nvo)>0}">
					<c:forEach var="notice" items="${nvo}">
						<tr>
	   					<td class="ncol1">
	   					<a href="/noticeDetail?noti_no=${notice.noti_no}">
	   					<input type="text" name="subject" value="${notice.subject}"
	    					class="" readonly="readonly">
	   					</a>
		    			</td>
	    				<td class="ncol2">
						<input type="text" name="writer" value="${notice.writer}"
						     					class="" readonly="readonly">
						</td>
	     				<td class="ncol3">
     					<input type="text" name="vdate" value="${notice.vdate}"
	   						class="number" readonly="readonly">
		   				</td>
	     				<td class="ncol4">
     					<input type="text" name="regdate" value="${notice.regdate}"
	   						class="number" readonly="readonly">
		   				</td>
		   				<td class="ncol5">
	   					<input type="text" name="readcount" value="${notice.readcount}"
		   					class="" readonly="readonly">
		   				</td>
		   				</tr>
					</c:forEach> 
				</c:when>
			</c:choose>
		</tbody>
	</table>
	<c:if test="${ssKey.getM_role()=='admin'}">
	<div class="btnArea" align="right">
   		<input name="newForm" type="button" 
   		class="btn-primary" onclick="location.href='/NoticeInForm'" value="공지사항 등록">
   	</div>
	</c:if>
</div>
			
</body>
</html>