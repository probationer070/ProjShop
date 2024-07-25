	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/aloneLogin.css" />
<script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="BigConatiner">
	<div class="container">
			<div class="loginform">
			<div id="Large-login-box">
			<div class="login-title">회원로그인</div>
			<form action="loginProc" method="post" name="LoginForm">
				<ul class="large-login-input">
					<li>
						<input type="text" name="mem_id" class="id chk" title="ID" placeholder="ID">
					</li>
					<li>
						<input type="password" name="m_passwd" class="pw chk" title="PW" placeholder="PASSWORD">
					</li>
				</ul>
				<button class="btn btn-dark login-btn">Login</button>
			
			</form>
			</div>
		</div>
		<div id="join_search" style="display: flex; justify-content: center;">
     <a href="/memSearch" style="color: gray; font-size: 16px; text-decoration: none; padding-left: 270px;">Find ID </a>
  </div>
	</div>
</div>
</body>
</html>