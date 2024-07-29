<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/layouts.css" />
<link rel="stylesheet" href="../css/footer.css" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>폰케이스</title>
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script> 
</head>
<body>	
	<div class="large-container">
		<div class="container">
		<c:choose>
			<c:when test="${ssKey.m_role=='admin'}">
				<c:import url="layouts/header.jsp" />
			</c:when>
			<c:otherwise>
            	<c:import url="layouts/header.jsp" />
       		</c:otherwise>
		</c:choose>
			<div class="contents">
				<c:import url="${content}"></c:import>			
			</div>
		</div>
		<c:import url="layouts/footer.jsp" />
	</div>
</body>
</html>