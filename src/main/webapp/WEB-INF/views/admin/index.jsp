<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script type="text/javascript" src="../js/jquery-3.7.1.min.js"></script>    
<script type="text/javascript" src="../js/layout.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShopTest</title>

</head>
<body>
<div class="large-container">
	<div class="container" style="">
		<c:import url="../layouts/header.jsp" />
		<div class="content">
			<div class="site-desc">
				<section class="site-desc-direction">
					<div class="TwoColumn-Sec">
						<div class="TwoColumn-Sec-Col">
							<div class="TwoCol-Sec-MediaContainer">
								<img class="colimg" src="../images/cont2.jpg">
							</div>
						</div>
						<div class="TwoColumn-Sec-Col">
							<div class="TwoCol-Sec-MediaContainer">
								<div class="Cols-Title mb-4">
									<h1>What We Stand For</h1>
								</div>
								<div class="Cols-event-Item">
									<div class="Cols-icon">
										<img src="../images/icon1.png">
									</div>
									<div class="Cols-context mb-1">
										<h2>IMPACT PROTECTION</h2>
										<p>Pioneering impact protection technology that protects your devices like no other.</p>
									</div>
								</div>
								<div class="Cols-event-Item">
									<div class="Cols-icon">
										<img src="../images/icon2.png">
									</div>
									<div class="Cols-context mb-1">
										<h2>SUSTAINABILITY</h2>
										<p>From recycled materials to intelligent bio-technology formulas, we protect your tech and our planet.</p>
									</div>
								</div>
								<div class="Cols-event-Item">
									<div class="Cols-icon">
										<img src="../images/icon3.png">
									</div>
									<div class="Cols-context mb-1">
										<h2>DESIGN INNOVATION</h2>
										<p>Whether it’s product design or lab-developed material additives, we are always innovating our products.</p>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</section>
			</div>
			<div>
				
				<div align="right">
					<!-- <a href="/itemNew">
						<button type="button" id="AddItem">Add Item</button>
					</a> -->
				</div>
			</div>
			<p>Ads</p>	
		</div>
	</div>
	<c:import url="../layouts/footer.jsp" />
</div>
<div class="load" id="load">
	<img src="images/loading2.webp">
</div>
</body>
</html>