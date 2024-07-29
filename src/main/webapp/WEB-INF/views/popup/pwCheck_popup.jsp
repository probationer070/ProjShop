<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewpoint" content="width=600, height=200, user-scaleable=no">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<style>
	body {
		margin: 0;
		width: 600px;
		height: 200px;
		overflow: hidden;
		box-sizing: border-box;
	}
	
	table.popupTable {
		margin: 0;
		width: 500px;
		height: 190px;
		border: 1px solid #eee;
		border-collapse: collapse;
	}
	
	table.popupTable tr, td, th {
		font-style: 20px;
	}
	
	table.popupTable .col1 {
		width: 30%;
		padding: 5px;	
	}
</style>
<title>비밀번호 확인</title>
</head>
<body class="popupBody d-flex justify-content-center">
	<form name="popForm" action="memUpdateForm" method="post">
		<table class="popupTable">
			<tr>
				<th class="form-label">비밀번호 입력</th>
				<td><input type="password" class="form-control" id="pwck"></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn btn-outline-primary pwck" value="확인">확인</button>
					<button class="btn btn-outline-danger" value="닫기" onclick="window.close()">닫기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>