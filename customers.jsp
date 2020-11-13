<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="My online portfolio that illustrates skills acquired while working through various project requirements.">
		<meta name="author" content="Lavonda S. Dean">
		<link rel="icon" href="favicon.ico">

		<title>LIS 4368 - JSP Forms</title>

		<%@ include file="/css/include_css.jsp" %>		

	</head>
	<body>

		<!-- display application path -->
		<% //= request.getContextPath()%>
		
		<!-- also, can find path like this...example: <a href="${pageContext.request.contextPath}${'/a5/index.jsp'}">A5</a> -->	
		
		<%@ include file="/global/nav_global.jsp" %>	

		<div class="container-fluid">
			<div class="starter-template">
				
				<div class="page-header">
					<%@ include file="/p2/global/header.jsp" %>
				</div>

				<h2>Customers</h2>

				<% //for debugging, test input (test servlet provided): action="testInput" %>					

				<form id="add_customer_form" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/customerAdmin">										
					<% // goes to info/CustomerServlet.java %>
					<input type="hidden" name="action" value="add_customer">
					<input type="submit" value="Add">
				</form>
				
				<!-- Responsive table.  -->						
				<div class="table-responsive">
					<table id="myTable" class="table table-striped table-condensed" >
						<thead>
							<tr>
								<th class="text-center">Fname</th>
								<th class="text-center">Lname</th>
								<th class="text-center">Street</th>
								<th class="text-center">City</th>
								<th class="text-center">State</th>
								<th class="text-center">Zip</th>
								<th class="text-center">Phone</th>
								<th class="text-center">Service Required</th>
								<th class="text-center">Stylist Preferred</th>
								<th class="text-center">Notes</th>
								<th class="text-center">&nbsp;</th>
								<th class="text-center">&nbsp;</th>

							</tr>
						</thead>

						<tbody>
							<%
							/*
								 Note: "items" contains an ArrayList (or an Object array) to loop over: here, an ArrayList (see CustomerServlet.java and CustomerDB.java)
								 "var" is simply a user-defined variable used to access the current element, while looping through each iteration of "users" ArrayList, using forEach
								 Essentially, customerform.jsp calls CustomerServlet, using the string "display_customers."
								 CustomerServlet then calls CustomerDB.selectCustomers(), and stores the returned ArrayList in a variable called "users."
								 This ArrayList "users," is then passed as a variable from CustomerServlet to customers.jsp
								 See action.equals("display_customers") in CustomerServlet.java file.
								 Then, we just loop through each of the elements and their properties (e.g., fname, lname, street, etc.)
							 */
							%>
							
							<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
							<c:forEach var="user" items="${users}">
								<tr class="text-left">
									<td><c:out value="${user.fname}" /></td>
									<td><c:out value="${user.lname}" /></td>
									<td><c:out value="${user.street}" /></td>
									<td><c:out value="${user.city}" /></td>
									<td><c:out value="${user.state}" /></td>
									<td><c:out value="${user.zip}" /></td>
									<td><c:out value="${user.phone}" /></td>
									<td><c:out value="${user.email}" /></td>
									<td><c:out value="${user.service}" /></td>
									<td><c:out value="${user.stylist}" /></td>
									<td><c:out value="${user.notes}" /></td>

									<!-- Create form buttons and hidden input fields to pass data.  //-->
									<% //for debugging, test input (test servlet provided): action="testInput" %>					
									<td>
										<form
											id="edit_customer_form"
											class="form-horizontal"
											action="${pageContext.request.contextPath}/customerAdmin"
											method="post">
											<input type="hidden" name="modify_customer" value="${user.id}" />
											<input type="submit" value="Edit" />
										</form>
									</td>

									<td>
										<form
											onsubmit="return confirm('Do you really want to delete record?');"
											id="delete_customer_form"
											class="form-horizontal"
											action="${pageContext.request.contextPath}/customerAdmin"
											method="post">
											<input type="hidden" name="delete_customer" value="${user.id}" />
											<input type="submit" value="Delete" />
										</form>
									</td>									
									
								</tr>
							</c:forEach>
							</tbody>
							
						</table>

					</div> <!-- end table-responsive -->

	<%@ include file="global/footer.jsp" %>

	</div> <!-- end starter-template -->
 </div> <!-- end container -->

 	<%@ include file="/js/include_js.jsp" %>		 

 <script type="text/javascript">
	 $(document).ready(function(){
		 $('#myTable').DataTable({
			 //https://datatables.net/reference/option/lengthMenu
			 //1st inner array page length values; 2nd inner array displayed options
			 //Note: -1 is used to disable pagination (i.e., display all rows)
			//Note: pageLength property automatically set to first value given in array
		 "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
	 //permit sorting (i.e., no sorting on last two columns: delete and edit)
    "columns":
		[
		null,			
		null,
		null,
		null,
		null,			
		null,
		null,
		null,
		null,			
		null,
		null,
     { "orderable": false },
     { "orderable": false }			
    ]
		 });
});
	</script>
 
</body>
</html>
