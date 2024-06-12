<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html>

<head>
<style>
body {
	height: 100vh;
	margin: 0;
	padding: 0;
}

.form-group {
	display: flex;
	flex-direction: column;
}
</style>
<meta charset="UTF-8">
<title>ATR REPORTS</title>
<!-- Add Bootstrap CSS link -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css"
	rel="stylesheet">






<link rel="stylesheet" href="css/reportstyle.css" type="text/css">
<style>
input[type="submit"] {
	height: 50px;
	background-color: #003366;
	color: white;
	font-size: large;
	font-weight: bold;
	border-radius: 4px;
	margin-left: 10%;
	width: 200px;
}

input[type=submit]:hover {
	background-color: #45a049;
}
.report{
display:flex;
justify-content:center;
align-items:center;}
label {
  padding: 12px 12px 12px 0;
  display: inline-block;
  font-size:20px;
}
.button{
margin-left:45% !important}
td {
   white-space:nowrap;
   
   max-width: 350px;
   overflow-y:hidden;
}
</style>
</head>

<body>
	<%@include file="./global.jsp"%>
	<br><br>
	<%Map<String, Object> userData = (Map<String, Object>) session.getAttribute("user"); 
	String Service_Type=(String) userData.get("SERVICE_TYPE");
	%>

	<form action="./Getreports" method="post">
	<div class="report">
		<label> From Date:</label> <input style="margin-bottom:5px" type="date" id="fromdate"
			name="frmdate" placeholder="MM/DD/YYYY" required>
		&nbsp;&nbsp;&nbsp;&nbsp; <label>To Date:</label> <input style="margin-bottom:5px" type="date"
			id="todate" name="todate" placeholder="MM/DD/YYYY" required>

		<label for="Status" style="padding-left:20px">Status:</label> <select style="margin-bottom:5px" name="Status" id="Status"
			required>

             <option value=""></option>
			<option value="OPEN">OPEN</option>
			<option value="CLOSED">CLOSED</option>
			<option value="ALL">ALL</option>
			

		</select> <br>
		<br> <br>
		<br>
		
		</div>
		
		 <input class="button"type="submit" value="GET REPORT">
	
	<br>
	<br>
	<br>
	<br>
</div>
	<div class="table-container">
		<table id="example" class="display nowrap">
			<thead>
				<tr>
					<th>ATR_ID</th>
					<th>Domain_Name</th>
					<th>Issued_By</th>
					<th>Action_Item</th>
					<th>Updates</th>
					<th>Current_Status</th>
					<th>End_Date</th>
				</tr>
			</thead>
			<tbody>
<%
               List<Map<String,Object>> reportlist= (List<Map<String,Object>>) session.getAttribute("reports");
               
           if(reportlist!=null){
                  for(int i=0; i<reportlist.size();i++){
    
                	  Map<String,Object> reportitems=reportlist.get(i);
                	 // System.out.println(reportitems);
              %>
				
					<tr>
						<td><%=reportitems.get("ATRID") %></td>
						<td><%=reportitems.get("DOMAINNAME") %></td>
						<td><%=reportitems.get("IssuedBy") %></td>
						<td><%=reportitems.get("ActionItems") %></td>
						<td><%=reportitems.get("Updates") %></td>
						<td><%=reportitems.get("Atr_CurrentStatus") %></td>
						<td><%=reportitems.get("TargetDate") %></td>
						
					</tr>
			
			</tbody>
		<%} }%>
		</table>
	</div>
	</div>
</form>
	<%@include file="./footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- Add DataTables JavaScript and Buttons extension -->
	<script
		src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>

	<script>
		$(document).ready(function() {
			
			$('#example').DataTable({
				 "order": [[1, "desc"]],
				dom : 'Bfrtip',
				buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]
			});
		});
	</script>
</body>

</html>
