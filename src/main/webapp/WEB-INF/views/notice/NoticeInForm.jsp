<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" type="text/css" href="/css/notice.css" />
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/notice.js"></script>
</head>
<body>
<div id="Notice">
	<c:if test='${ssKey.m_role}'></c:if>
   	<h2>공지사항 등록</h2>
	<form action="" name="form1" method="post">
   	<table>
   		<tbody>
			<tr>
				<th class="ncol1d">제목</th>
				<th class="ncol2d">
					<input type="text" name="subject" class="chk" title="제목" placeholder="제목 입력"> 
				</th>
				
  			</tr>
			<tr>
				<th class="ncol1d">작성자</th>
				<th class="ncol2d">
					<input type="text" name="writer" class="chk" title="작성자" placeholder="작성자 입력"> 
				</th>
				
  			</tr>
			<tr>
				<th class="ncol1d">내용</th>
				<th class="ncol2d">
					<textarea rows="10" cols="50" name="content" title="내용" class="chk" title="내용"></textarea>
				</th>
				
  			</tr>
			<tr>
				<th class="ncol1d">작성일자</th>
				<th class="ncol2d">
					<input type="date" name="regdate" title="작성일자" placeholder=""> 
				</th>
				
  			</tr>
  			<tr>
				<th class="ncol1d">종료일자</th>
				<th class="ncol2d">
					<input type="date" name="vdate" class="chk" title="종료일자" placeholder=""> 
				</th>
				
  			</tr>
   		</tbody>
   	</table>
   	<div class="btnArea" align="center">
   		<button type="button" class="btn-primary notisubmit1">등록</button>
   		<button type="button" class="btn-second btn-primary" onclick="location.href='/admin/notice'">공지사항목록</button>
   		<!-- <button type="button" name="update" class="btn-primary psubmit">수정</button> -->
   	</div>
	</form>
</div>
</body>
</html>