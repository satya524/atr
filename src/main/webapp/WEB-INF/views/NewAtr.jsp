<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 --%>

<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Services</title>
<!-- Add Bootstrap CSS link -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<!-- Add custom CSS for styling -->
<style>
body{
margin:0;
padding:0;
height:100vh;
}
form{
height:65vh;
padding:20px;
}
.button-group .row {
	justify-content: center;
}

.button-group .row .col-3 {
	text-align: center;
	padding: 30px 12px;
}
.container{
margin:40px;}
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
 button.btn-primary {
            padding: 10px; /* Adjust the padding as needed */
            font-size: 14px; /* Adjust the font size as needed */
            width: auto; /* Allow the button to adjust its width based on content */
            text-align: center;
        }
        
        .con{
        display:flex;
        justify-content:space-between;
        padding-top:20px;
        }
        p{
        padding-top:20px;}
</style>
</head>
<body>

	<%@include file="./global.jsp"%>


<div>
	<div id="submit">
		<div class="container">
			<div class="content-placement">
			
			
				
				<form action="./NewAtrSubmit" id="form" method="POST">
				
			<%-- 	<div class="center-text" style="text-align:center;">
				<%
				String mess=(String)session.getAttribute("message");
				if(mess!=null){
				if(mess.equalsIgnoreCase("SuccessfullySubmitted")){
				%>
				<span style="color:green;"><%=mess%></span>
				<%}else{ %>
				<span style="color:red;"><%=mess%></span>
				<%} }%>
			</div>--%>
			
				<div class="con">
					<div >
					
								<label for="domainname">Domain Name:</label> 
								<select name="domainname" id="domainname" required>
								<option value=""></option>
								<%
		            List<String> Domainnames= (List<String>) session.getAttribute("Domaindetails");
		            for(int i=0;i<Domainnames.size();i++) {
		                
					%>
								<option value  <%= Domainnames.get(i)%>"><%= Domainnames.get(i)%></option>
					<%} %>				
								</select>
							</div>
							<div >
						
							
								<label for="issuedby">Issued By:</label> 
								<select name="issuedby" id="issuedby" required>
								<option value=""></option>
								
									<%
							List<String> issueddetails= (List<String>)session.getAttribute("issuedbydetails");
				            for(int i=0;i<issueddetails.size();i++) {
		                
					%>
								<option value="<%= issueddetails.get(i)%>"><%= issueddetails.get(i)%></option>
									
							<%} %>		
								</select>
							</div>
							</div>
							<div class="form-group">

							<p class="field-wrapper">
								<label for="ActionItems"> ActionItems</label> *
								<textarea rows="4" cols="50" class="form-control"
									id="actionitem" name="actionitem" required></textarea>
							</p>

						</div>

					
					

					<div class="form-group">

						<label for="enddate"> Target Date</label> <input type="date"

							class="form-control" id="enddate" name="enddate"   placeholder="dd-mm-yyyy" value=""
        min="1997-01-01" max="2900-12-31"  required>

					</div>
					<button type="submit" class="btn btn-primary btn-block mx-auto">Submit</button>
				</form>
						</div>
						</div>
				
			</div>
		
	

</div>
<%@include file="./footer.jsp"%>

	<!-- Add jQuery and Bootstrap JS scripts -->
	<script src="./css/jquery-3.5.1.min.js"></script>
	<script src="./css/bootstrap.min.js"></script>
	<script>
	
	
	document
	.getElementById("form")
	.addEventListener(
			"submit",
			function(event) {
				event.preventDefault();
				const
				date = document.getElementById("enddate");
			
				console.log(date.value);
				
				
				
				const today = new Date();
				var year = today.toLocaleString("default", { year: "numeric" });
				var month = today.toLocaleString("default", { month: "2-digit" });
				var day = today.toLocaleString("default", { day: "2-digit" });

				
				var formattedDate = year + "-" + month + "-" + day;
				console.log(formattedDate);
				console.log(today);
				if (date.value< formattedDate) {
					event.preventDefault();
					console.log("alert");
					alert("Your TargetDate should be Greater than TodayDate");
					
				} 
				else {
					event.target.submit();
				}
			});
	
	
</script>
</body>
</html>