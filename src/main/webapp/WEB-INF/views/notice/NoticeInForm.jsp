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
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/notice.js"></script>
</head>
<body>
<div id="Notice" align="center">
	<c:if test='${ssKey.m_role}'></c:if>
		<h2>공지사항 등록</h2>
	  <form action="" name="form1" method="post">
	<div class="ArticleContentBox">
		<div class="article_header">
			<div class="article_Title">
				<div class="title_area">
   					<h3 style="text-align: left;">
   					<span class="sname" style="font-size: 18px;">
						<label>제목 | </label>
						<input type="text" name="subject" title="제목"  > 
					</span>
   					</h3>
   					<!-- <input type="hidden" name="noti_no" >
 -->					
				</div>
			</div>
			<div class="WriterInfo mb-3">
				<div class="profile_area">
			
					<span class="wname" style="font-size: 18px;">
						<label>작성자 | </label>
						<input type="text" name="writer" title="작성자"> 
					</span>
					<ul class="date">
						<li>
							<span class="rdate">
								<label>작성일자 | </label>
								<input type="date" name="regdate" title="작성일자">
							</span>
							<span class="rdate">
								&nbsp;&nbsp;&nbsp;
								<label>종료일자 | </label>
								<input type="date" name="vdate" title="종료일자">							
							</span>
							
						</li>
					</ul>			
				</div>
			</div>
			<div class="ArticleTools">
			</div>
		</div>
		<div class="article_container">
			<pre class="textaread" style="text-align: left;">
				<textarea name="content" title="내용" class="chk Noti-contentArea"></textarea>
			</pre>
		</div>
	</div>
   	<div class="btnArea mt-2" align="center">
   			<button type="button" class="btnJoin notisubmit1">등록및전송</button>
   			<button type="button"class="btnJoin " onclick="location.href='/noticeFIX'">취소</button>
   	</div>
	  </form>
</div>
</html>