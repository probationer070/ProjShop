<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" type="text/css" href="./css/notice.css" />
<script type="text/javascript" src="./js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="./js/notice.js"></script>
</head>
<body>
<div id="Notice" align="center">
	
   	<h2 style="margin: 20px 0;">공지사항</h2>
	<form action="" name="form1" method="post">
   	<table>
   		<tbody>
			<tr>
				<th class="ncol1d">제목</th>
				<th class="ncol2d">
					<input type="text" name="subject" class="chk" title="제목" value="${notice.subject}" readonly="readonly">
					<input type="hidden" name="noti_no" value="${notice.noti_no}">
				</th>
				<th class="ncol1d">종료일자</th>
				<th class="ncol2d">
					<input type="text" name="vdate" value="${notice.vdate}" readonly="readonly">
				</th>
				<th class="ncol1d">생성일자</th>
				<th class="ncol2d">
					<input type="text" name="regdate" value="${notice.regdate}" readonly="readonly">  
				</th>
  			</tr>
			<tr>
				<th class="ncol1d" colspan="1">작성자</th>
				<th class="ncol3d" colspan="5">
					<input type="text" name="writer" class="chk" title="작성자" value="${notice.writer}" readonly="readonly"> 
				</th>
  			</tr>
			<tr>
				<th class="ncol1d" colspan="1">내용</th>
				<th class="ncol3d" colspan="5">
					<textarea class="textaread" rows="10" cols="50" name="content" title="내용" class="chk" title="내용" readonly="readonly">${notice.content}</textarea>
				</th>
  			</tr>
   		</tbody>
   	</table>
   	<div class="btnArea" align="center">
   		<c:if test='${ssKey.m_role=="mem" or ssKey.m_role==null}'>
   			<button type="button" class="btn-second btn-primary" onclick="location.href='/noticeFIX'">공지사항목록</button>
   		</c:if>
   		<c:if test='${ssKey.m_role=="admin"}'>
   			<button type="button" class="btn-second btn-primary" onclick="location.href='/admin/noticeFIX'">공지사항목록</button>
   			<button type="button" name="update" class="btn-primary notisubmit">수정</button>
   			<button type="button" name="delete" class="btn-primary notisubmit">삭제</button>
   		</c:if>
   	</div>
	</form>
</div>
</body>
</html>