<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 --%>

<%@ page import="java.util.*"%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AOP Login </title>
    <!-- Add Bootstrap CSS link -->
   <link href="./css/bootstrap.min.css" rel="stylesheet">
    <!-- Add custom CSS for styling -->
    <style>
    
 
        /* header starts*/
.navbar {
	background-color: #191970de;
    color:white;
  }
  .navbar-brand, .navbar-nav .nav-link {
      color: white;
  }
  body{
  margin:0;
  padding:0;
  }
  .navbar {
   display: flex;
   align-items: center;
  }
  .site-name{
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
        .width-200 img{
        width: 200px;
        }
/* header ends*/
/* footer starts */
.footer-container {
	background: #0e56a3;
	padding:20px 0;
	color: #FFF;
	
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
.socialIcon > a img {
 width: 30px;
 margin-left: 5px;
}
/* footer ends */
    </style>
</head>
<body>
<div class="header-container">
    <!-- Navigation Bar -->
    <div class="navbar navbar-expand-sm navbar-dark p-0">
    
        <div class="img-container width-200">
            <img src="./images/waisllogo.png" alt="Your Logo">
        </div>
                <h1 class="center site-name">ATR PROJECT</h1>
            <button type="submit"

			style="background-color: red; color: white; font-size: 16px; padding: 10px 20px;">

			<a href="./logout" style="text-decoration: none; color: inherit;" >Logout</a>

		</button>
 </div>
 

 <nav class="navbar navbar-expand-lg navbar-light bg-light">
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
            <%
Map<String, Object> userid= (Map<String,Object>)session.getAttribute("user");

		if("ADMIN".equals(userid.get("USERTYPE"))){ %>
                <li class="nav-item">
                    <a class="nav-link" href="./newAtr">New ATR</a>
                </li>
                <%} %>
                <li class="nav-item">
                    <a class="nav-link" href="./OpenAtrs">Open ATR List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./Reports">Reports</a>
                </li>
            </ul>
        </div>
    </nav>
    
 
</div>
    <!-- Login Form -->
    <div></div>
   

</body>
</html>
