<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" type="text/css" href="./css/NoticeDetail.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/notice.js"></script>
</head>
<body>
<div id="Notice" align="center">
	
	<form action="" name="form1" method="post">
	<div class="ArticleContentBox">
		<div class="article_header">
			<div class="article_Title">
				<div class="title_area">
   					<h2>제목 : ${notice.subject}</h2>
   					<input type="hidden" name="noti_no" value="${notice.noti_no}">
   					<input name="subject" type="hidden" value="${notice.subject}">
				</div>
			</div>
			<div class="WriterInfo mb-3">
				<div class="thumb_area">
					프로필 이미지?
				</div>
				<div class="profile_area">
					<input type="hidden" name="writer" class="chk" title="작성자" value="${notice.writer}" readonly="readonly"> 
				</div>
			</div>
			<div class="ArticleTools">
			</div>
		</div>
		<div class="article_container mb-4">
			<textarea class="textaread" name="content" class="chk" title="내용" type="hidden"
			           readonly="readonly">${notice.content}</textarea>
			<input type="date" name="vdate" title="종료일자" value="${notice.vdate}" readonly="readonly">
			<input type="date" name="regdate" title="작성일자" value="${notice.regdate}" readonly="readonly">  
		</div>
	</div>
	
   	<%-- <table>
   		<tbody>
			<tr>
				<input type="hidden" name="noti_no" value="${notice.noti_no}">
				<th class="">
					<label>종료일자</label>
				<input type="date" name="vdate" value="${notice.vdate}" readonly="readonly">
					<label>작성일자</label>
					<input type="date" name="regdate" value="${notice.regdate}" readonly="readonly"> 
				</th>
  			</tr>
			<tr>
				<th class="">
					<label>작성자</label>
					<input type="text" name="writer" class="chk" title="작성자" value="${notice.writer}" readonly="readonly"> 
				</th>
  			</tr>
			<tr>
				<th class="" colspan="1">
					<label>내용</label>
					<textarea class="textaread" rows="10" cols="50" name="content" title="내용" class="chk" title="내용" readonly="readonly">${notice.content}</textarea>
				</th>
  			</tr>
   		</tbody>
   	</table> --%>
   	<div class="btnArea mt-2" align="center">
   		<c:if test='${ssKey.m_role=="mem" or ssKey.m_role==null}'>
   			<button type="button" class="btn-second btn-primary" onclick="location.href='/notice'">공지사항목록</button>
   		</c:if>
   		<c:if test='${ssKey.m_role=="admin"}'>
   			<button type="button" class="btn btn-outline-dark" onclick="location.href='/noticeFIX'">공지사항목록</button>
   			<button type="button" name="update" class="btn btn-dark notisubmit">수정</button>
   			<button type="button" name="delete" class="btn btn-dark notisubmit">삭제</button>
   		</c:if>
   	</div>
	</form>
</div>
</body>
</html>