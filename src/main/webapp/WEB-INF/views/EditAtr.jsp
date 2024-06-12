<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 --%>

<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>


<!DOCTYPE html>
<html>
<head>
<title>EDITATR</title>
<!-- Add Bootstrap CSS link -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

        

<!-- Add custom CSS for styling -->
<style>
body {
	margin: 0;
	padding: 0;
	height: 100vh;
}

form {
	height: auto;
	padding: 20px;
}

.button-group .row {
	justify-content: center;
}

.button-group .row .col-3 {
	text-align: center;
	padding: 30px 12px;
}

.container {
	margin: 40px;
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

button.btn-primary {
	padding: 10px; /* Adjust the padding as needed */
	font-size: 14px; /* Adjust the font size as needed */
	width: auto;
	/* Allow the button to adjust its width based on content */
	text-align: center;
}

.con {
	display: flex;
	justify-content: space-between;
	padding-top: 20px;
}

p {
	padding-top: 20px;
}

.footer-jsp {
	bottom: 0;
}
</style>
</head>
<body>

	<%@include file="./global.jsp"%>



	<div>
		<div id="submit">
			<div class="container">
				<div class="content-placement">


					<form action="./EditAtrById" id="form" method="POST">

                    <div class="center-text" style="text-align:center;">
				<%
				String mess=(String)session.getAttribute("mail");
				if(mess!=null){
				if(mess.equalsIgnoreCase("Email Sent Successfully")){
				%>
				<span style="color:green;"><%=mess%></span>
				<%}else{ %>
				<span style="color:red;"><%=mess%></span>
				<%} }%>
			</div>

						<div class="con">
							<div>
								<label>ATRID:</label> <input type="text" name="ATRID"
									value="<%=session.getAttribute("id")%>" readonly>
							</div>
							
							
							<%
							Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
							List<Map<String, Object>> AtrIdDetails = (List<Map<String, Object>>) session.getAttribute("details");
							List<String> Trackingdates = (List<String>) session.getAttribute("RevisedDatesList");
							Map<String, Object> ParticularIdDetails = (Map<String, Object>) AtrIdDetails.get(0);
							 SimpleDateFormat inputformatter = new SimpleDateFormat("dd-MM-yyyy");
							SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							Date target= inputformatter.parse((String)ParticularIdDetails.get("TargetDate"));
							String targetdate=formatter.format(target);
							 
							if ("ADMIN".equals(user.get("USERTYPE"))) {
							%>
							<div>
								<label for="domainname">Domain Name:</label> <select
									name="domainname" id="domainname" required>
									<option value="<%=ParticularIdDetails.get("DOMAINNAME")%>"><%=ParticularIdDetails.get("DOMAINNAME")%></option>

									<%
									List<String> Domainnames = (List<String>) session.getAttribute("Domaindetails");
									for (int i = 0; i < Domainnames.size(); i++) {
										if(!ParticularIdDetails.get("DOMAINNAME").equals(Domainnames.get(i))){
									%>
									<option value="<%=Domainnames.get(i)%>"><%=Domainnames.get(i)%></option>
									<%
									}}
									%>

								</select>
							</div>
							<input type="hidden" name="targetdate" id="targetdate" value="<%=targetdate %>">
							<div>
								<label for="issuedby">Issued By:</label> <select name="issuedby"
									id="issuedby" required>
									<option value="<%=ParticularIdDetails.get("IssuedBy")%>"><%=ParticularIdDetails.get("IssuedBy")%></option>
									<%
									List<String> issueddetails = (List<String>) session.getAttribute("issuedbydetails");
									for (int i = 0; i < issueddetails.size(); i++) {
										if(!ParticularIdDetails.get("IssuedBy").equals(issueddetails.get(i))){

									%>
									<option value="<%=issueddetails.get(i)%>"><%=issueddetails.get(i)%></option>

									<%
									}}
									%>


								</select>
							</div>
						</div>
						<div class="form-group">

							<p class="field-wrapper">
								<label for="ActionItems"> ActionItems</label> *
								<textarea rows="4" cols="50" class="form-control"
									id="actionitem" name="actionitem" required><%=ParticularIdDetails.get("ActionItems")%> </textarea>
							</p>

						</div>
						<div class="form-group">

							<p class="field-wrapper">
								<label for="Updates"> Updates</label> *
								<textarea rows="4" cols="50" class="form-control" id="updates"
									name="updates" required> <%=ParticularIdDetails.get("Updates")%></textarea>
							</p>

						</div>


						<div class="form-group">


							<label for="enddate"> Target Dates</label> <input type="date"
								class="form-control" id="enddate" name="enddate"
								value=<%=targetdate %> required>
			</div>
						<div>

							<%
							for (int i = 1; i < Trackingdates.size(); i++) {
							%>


							<h5><%=Trackingdates.size()-i%>st RevisedDate:<span
									Style="Color: red; text-decoration: line-through ;"><%=Trackingdates.get(i)%></span>
							</h5>
							<%
							}
							%>

						</div>

						<div>

							<div style="padding-top: 20px";>

								<label for="Status">Status:</label> <select name="Status"
									id="Status" required>


									<option value="OPEN">OPEN</option>
									<option value="CLOSED">CLOSED</option>

								</select>
							</div>
						</div>



						<%
						} else {
						%>


                      <input type="hidden" name="targetdate" id="targetdate" value="<%=targetdate %>">
                       

						<div>
							<label for="domainname">Domain Name:</label> <input type="text"
								name="domainname"
								value="<%=ParticularIdDetails.get("DOMAINNAME")%>" readonly>
						</div>
						<div>
							<label for="issuedby">Issued By:</label> <input type="text"
								name="issuedby" value="<%=ParticularIdDetails.get("IssuedBy")%>"
								readonly>
						</div>
				</div>
				<div class="form-group">

					<p class="field-wrapper">
						<label for="ActionItems"> ActionItems</label> *
						<textarea rows="4" cols="50" class="form-control" id="actionitem"
							name="actionitem" required readonly><%=ParticularIdDetails.get("ActionItems")%> </textarea>
					</p>

				</div>

				<%
				if (!ParticularIdDetails.get("Updates").equals("")) {
				%>
				<div class="form-group">

					<p class="field-wrapper">
						<label for="Updates"> Updates</label> *
						<textarea rows="4" cols="50" class="form-control" id="updates"
							name="updates" required> <%=ParticularIdDetails.get("Updates")%></textarea>
					</p>


				</div>
				<%
				} else {
				%>

				<div class="form-group">

					<p class="field-wrapper">
						<label for="Updates"> Updates</label> *
						<textarea rows="4" cols="50" class="form-control" id="updates"
							name="updates" required></textarea>
					</p>
				</div>
				<%
				}
				%>


				<div class="form-group">

					<p class="field-wrapper">
						<label for="Status">Status:</label> <input type="text"
							name="Status"
							value="<%=ParticularIdDetails.get("Atr_CurrentStatus")%>"
							readonly>
					</p>


                   <input type="hidden" name="date" id="date" value="<%=targetdate%>">
                   
					<div class="form-group">

						<label for="enddate"> Target Date</label> <input type="date"
							class="form-control" id="enddate" name="enddate"
							value=<%=targetdate%> required>

					</div>
					<div>
						<div class="form-group">


							<%
							for (int i = 1; i < Trackingdates.size(); i++) {
							%>

							<h5><%=Trackingdates.size()-i%>st RevisedDate:<span
									Style="Color: red; text-decoration: line-through;"><%=Trackingdates.get(i)%></span>
							</h5>
							<%
							}
							%>

						</div>


					</div>


					<%
					}
					%>
					
					

					<div class="form-group">
						<button type="submit" name="Atr" value="Update"
							class="btn btn-primary btn-block mx-auto">Update</button>
					</div>
				</div>
				</form>
			</div>
			<% if (!"ADMIN".equals(user.get("USERTYPE"))){%>
			
													
					  <a style="position: absolute;top: 170px;right: 20px;"href="./CloseAtr"><input type="submit" value="CloseAtr"></a>
					<%} %>


		</div>


	</div>


	<%@include file="./footer.jsp"%>
	</div>



	<!-- Add jQuery and Bootstrap JS scripts -->
	<script src="./css/jquery-3.5.1.min.js"></script>
	<script src="./css/bootstrap.min.js"></script>
	<script>

	  

	  document.getElementById("form").addEventListener("submit", function (event) {
	    event.preventDefault();
	    const enddate = document.getElementById("enddate");
	   const targetdate=document.getElementById("targetdate");
	    console.log(targetdate.value);

	    const today = new Date();
	    var year = today.toLocaleString("default", {
	      year: "numeric"
	    });
	    var month = today.toLocaleString("default", {
	      month: "2-digit"
	    });
	    var day = today.toLocaleString("default", {
	      day: "2-digit"
	    });

	    var formattedDate = year + "-" + month + "-" + day;
	    console.log(formattedDate);
	   
	  

	    if (enddate.value < targetdate.value) {
	      event.preventDefault();
	      console.log("alert1");
	      alert("Your new target date should be greater than or equal to previous target date");
	    } else {
	    	 event.target.submit();
	  }
	  });

	

	</script>
</body>
</html>