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
<link rel="stylesheet" type="text/css" href="/css/notice.css" />
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/notice.js"></script>
</head>
<body>
<div id="Notice">
	<c:if test='${ssKey.m_role=="admin"}'>
   	<h2 class="NotiUp" align="center">공지사항 수정</h2>
	<form action="" name="form1" method="post">
		<div class="article_header">
			<div class="article_Title">
				<div class="title_area">
   					<input type="hidden" name="noti_no" value="${notice.noti_no}">
   					<input type="text" name="subject" value="${notice.subject}" class="noti-sub">
				</div>
			</div>
			<div class="WriterInfo mb-3">
				<div class="profile_area">
					<span class="wname" style="font-size: 18px;">
						<label>작성자 | </label>
						<input type="text" name="writer" title="작성자" value="${notice.writer}" > 
					</span>
					<ul class="date">
						<li>
							<span class="rdate">
								<label>종료일자 | </label>
								<input type="date" name="vdate" title="종료일자" value="${notice.vdate}" >							
							</span>
							
							<span class="rdate">
								&nbsp;&nbsp;&nbsp;
								<label>작성일자 | </label>
								<input type="date" name="regdate" title="작성일자" value="${notice.regdate}" >
							</span>
						</li>
					</ul>			
				</div>
			</div>
			<div class="ArticleTools">
			</div>
		</div>
		<div class="article_container">
			<pre class="textaread">
				<textarea name="content" title="내용" class="chk Noti-contentArea">${notice.content}</textarea>
			</pre>
		</div>
   
   	<div class="btnArea" align="center">
   		<button type="button" class="btnJoin notisubmit2">수정완료</button>
   		<button type="button" class="btnCancel" onclick="location.href='/noticeFIX'">공지사항목록</button>
   		<!-- <button type="button" name="update" class="btn-primary psubmit">수정</button> -->
   	</div>
	</form>
	</c:if>
</div>
</body>
</html>