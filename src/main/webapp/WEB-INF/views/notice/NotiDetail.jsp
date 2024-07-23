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
		<h2>공지사항</h2>
		<div class="article_header">
			<div class="article_Title">
				<div class="title_area">
   					<h3 style="text-align: left;">${notice.subject}</h3>
   					<input type="hidden" name="noti_no" value="${notice.noti_no}">
   					<input name="subject" type="hidden" value="${notice.subject}">
				</div>
			</div>
			<div class="WriterInfo mb-3">
				<div class="profile_area">
					<span class="wname">${notice.writer}</span>
					
					<ul class="date">
						<li>
							<span class="rdate">${notice.regdate}</span>
						</li>
					</ul>			
				</div>
			</div>
			<div class="ArticleTools">
			</div>
		</div>
		<div class="article_container">
			<pre class="textaread" style="text-align: left;">
				<textarea name="content" title="내용" class="chk Noti-contentArea" readonly="readonly">${notice.content}</textarea>
			</pre>
			<input type="hidden" name="writer" title="작성자" value="${notice.writer}" readonly="readonly"> 
			<input type="hidden" name="content" title="내용" value="${notice.content}" readonly="readonly"> 
			<input type="hidden" name="vdate" title="종료일자" value="${notice.vdate}" readonly="readonly">
			<input type="hidden" name="regdate" title="작성일자" value="${notice.regdate}" readonly="readonly">  
		</div>
	</div>
   	<div class="btnArea mt-2" align="center">
   		<c:if test='${ssKey.m_role=="mem" or ssKey.m_role==null}'>
   			<button type="button" class="btnJoin" onclick="location.href='/notice'">공지사항목록</button>
   		</c:if>
   		<c:if test='${ssKey.m_role=="admin"}'>
   			<button type="button" class="btnJoin" onclick="location.href='/noticeFIX'">공지사항목록</button>
   			<button type="button" name="update" class="btnJoin notisubmit">수정</button>
   			<button type="button" name="delete" class="btnJoin notisubmit">삭제</button>
   		</c:if>
   	</div>
	</form>
</div>
</body>
</html>