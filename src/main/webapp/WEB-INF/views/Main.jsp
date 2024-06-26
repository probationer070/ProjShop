<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShopTest</title>

</head>
<body>	
	<div class="large-container">
		<div class="container" style="">
		<c:choose>
			<c:when test="${ssKey.m_role=='admin'}">
				<c:import url="layouts/header.jsp" />
			</c:when>
			<c:otherwise>
            	<c:import url="layouts/header.jsp" />
       		</c:otherwise>
		</c:choose>
			<div class="content">
				<c:import url="${content}"></c:import>			
			</div>
		</div>
		<c:import url="layouts/footer.jsp" />
	</div>
</body>
</html>