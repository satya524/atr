<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<head>

<meta charset="UTF-8">

<title>OPEN-ATRS</title>
<!-- Add Bootstrap CSS link -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css"
	rel="stylesheet">
<style>
td {
   white-space:nowrap;
   
   max-width: 350px;
   overflow-y:hidden;
}
table{
width:80%
}
.container{
width:80%;
margin:0 auto;
}
.content-placement {
	padding: 100px 0 50px;
} 
body{
height:100vh;
overflow-x:scroll;
}
form{
height:65vh;
width:80%
}
</style>
</head>
<body>

	<%@include file="./global.jsp"%>
	<ul class="nav-links">



	</ul>
	<div>
	
	
	
		<table id="example" class="display nowrap" style="width: 100%">
			<thead>
			
			<%
				Map<String, Object> user1 = (Map<String, Object>) session.getAttribute("user");
				 
				%>
				<tr>
					<th>ATRID</th>
					<th>Domain_Name</th>
					<th>Issued_By</th>
					<th>Action_Item</th>
					
					<th>Target_Date</th>
					<th>Current_Status</th>
					
					
					
				</tr>
				
			</thead>
			<tbody>

				<%
				List<Map<String, Object>> details=(List<Map<String, Object>>)session.getAttribute("details");
				Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
				for(int i=0;i<details.size();i++){
			Map<String, Object> openAtrMap = details.get(i);
		//	System.out.println(openAtrMap);
					if ("ADMIN".equals(user.get("USERTYPE"))) {
						
			%>
				<tr>
				
					<td><a href="./editSubmit?id=<%=openAtrMap.get("ATRID") %>"><%=openAtrMap.get("ATRID") %></a></td>
					<td><%=openAtrMap.get("DOMAINNAME")%></td>
					<td><%=openAtrMap.get("IssuedBy")%></td>
					<td><%=openAtrMap.get("ActionItems")%></td>
					
					<td><%=openAtrMap.get("TargetDate")%></td>
					<td><%=openAtrMap.get("Atr_CurrentStatus")%></td>
					
				</tr>

				<%
			} else {
				%>

				<tr>
					<td><a href="./editSubmit?id=<%=openAtrMap.get("ATRID") %>"><%=openAtrMap.get("ATRID") %></a></td>
					<td><%=openAtrMap.get("DOMAINNAME")%></td>
					<td><%=openAtrMap.get("IssuedBy")%></td>
					<td  ><%=openAtrMap.get("ActionItems")%></td>
					
					
					
							
                       <td><%=openAtrMap.get("TargetDate")%></td>
                       <td><%=openAtrMap.get("Atr_CurrentStatus")%></td>
							
							
				</tr>
				<%
				}}
				%>
			</tbody>
			<tfoot>
				
			</tfoot>
			
		</table>
		
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
					
						dom : 'Bfrtip',
						buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]
					
					
				});
			});
		</script>
</body>

</html>