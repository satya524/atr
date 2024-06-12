<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>




<!DOCTYPE html>
<html>
<head>
<title>Services</title>
<!-- Add Bootstrap CSS link -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<!-- Add custom CSS for styling -->
<style>
html, body {
	font-family: calibri;
}
body{
height:100vh;
}
.container {
	width: 80%;
	margin: 0 auto;
}

/* .content-placement {
	padding: 100px 0 50px;
} */


.button-group .row {
	justify-content: center;
}

.button-group .row .col-3{
	text-align: center;
	padding: 30px 12px;
}

.button-group input {
	min-height: 100px;
	padding: 20px;
	border: 0px;
	border-radius: 0;
	color: #FFF;
	cursor: pointer;
	background: #4c85cb;
	margin: 0 10px;
	font-size: 18px;
	font-weight: bold;
	text-transform: uppercase;
	opacity: 0.8;
}

.button-group input:hover {
	opacity: 1;
	transform: translateY(0);
	transition-duration: .35s;
	box-shadow: 0 0 5px #4c85cb;
}

.button-group input:hover:after {
	opacity: .5;
}

.button-group input:active {
	box-shadow: rgba(0, 0, 0, .1) 0 3px 6px 0, rgba(0, 0, 0, .1) 0 0 10px 0,
		rgba(0, 0, 0, .1) 0 1px 4px -1px;
	transform: translateY(2px);
	transition-duration: .35s;
}

.button-group input:active:after {
	opacity: 1;
}

@media ( min-width : 768px) {
	.button-group input {
		padding: 12px 0;
		width: 180px;
		min-height: 120px;
		text-align: center;
	}
}

/* header starts*/
.navbar {
	background-color: #191970de;
	color: white;
}

.navbar-brand, .navbar-nav .nav-link {
	color: white;
}

.navbar {
	display: flex;
	align-items: center;
}

.site-name {
	width: calc(100% - 200px);
	left: -100px;
	position: relative;
	text-align: center;
	color: #FFF;
	font-weight: 600;
	margin: 0;
}

.width-200 {
	width: 200px;
}

.width-200 img {
	width: 200px;
}

.socialIcon>a img {
	width: 30px;
	margin-left: 5px;
}
/* header ends*/
/* footer starts */
.footer-container {
	background: #0e56a3;
	padding: 20px 0;
	color: #FFF;
	position: fixed;
	bottom: 0;
	width: 100%;
}

.f-container {
	margin: 0 5%;
	max-width: 1600px;
}

.f-container p {
	margin: 0;
	padding: 0;
}

.nav-links {
	width: 100%;
	display: flex;
	justify-content: end;
	padding-right: 24px;
	/* position: fixed; */
	bottom: 60px;
	width: 100%;
}

.nav-links li {
	float: right;
	margin: 0 12px;
	list-style: none;
}

.nav-links li:before {
	content: "<";
	padding-right: 5px;
	color: #0056b3;
	font-family: cursive;
}

.logoutbutton {
	background: blue;
	float: right;
	margin-top: 20px;
}
.buttons{
display:flex;
justify-conent:center;
align-items:center;
height:70vh;
}
/* footer ends */
</style>
</head>
<body>
<%@include file="./global.jsp"%>

	<div id="serviceinfo">
		<div class="container">
		
	<div id="serviceinfo">
	<div class="container">
			<div class="content-placement">
			
					<div class="button-group">
						<div class="row">
						
						<%
						Map<String, Object> user= (Map<String,Object>)session.getAttribute("user");
						if("ADMIN".equals(user.get("USERTYPE"))){
						%>
						<div class="buttons">
						     <a href="./newAtr"><input type="submit" value="NEW-ATR"></a>
							 <a href="./OpenAtrs"><input type="submit" value="OPENATRS"></a>
		        		    <a href="./Report"><input type="submit" value="REPORT"></a>
		        		   </div>
						<%} else{ %>
						<div class="buttons">
						 <a href="./OpenAtrs"><input type="submit" value="OPENATRS"></a>
		        		<a href="./Report"><input type="submit" value="REPORT"></a>
		        		</div>
						<%} %>	
				
						</div>
					</div>
				
			</div>
		</div>
	</div>


		
	<!-- <ul class="nav-links">
		<li><a href="/">Logout</a></li> -->
		</div>
		<%@include file="./footer.jsp"%>
		
			<!-- Add jQuery and Bootstrap JS scripts -->
			<script src="./css/jquery-3.5.1.min.js"></script>
    <script src="./css/bootstrap.min.js"></script>
</body>
</html>