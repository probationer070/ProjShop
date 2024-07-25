<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <link rel="stylesheet" href="../css/bootstrap.min.css" /> -->
<link rel="stylesheet" href="../css/layouts.css" />
<link rel="stylesheet" href="../css/footer.css" />
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/zipCheck.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript" src="../js/layout.js"></script>
<title>폰케이스</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="large-container">
	<div class="container">
		<c:import url="./header.jsp" />
		<div class="content">
			<c:import url="../admin/swiper.jsp" />	
		</div>
	</div>
	<c:import url="./footer.jsp" />
</div>
</body>
</html>