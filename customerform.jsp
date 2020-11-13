<%-- Use core library --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!--
"Time-stamp: <Sun, 03-03-19, 16:57:07 Eastern Standard Time>"
//-->
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Online Store">
	<meta name="author" content="CDG LLC>">
	<link rel="icon" href="favicon.ico">

	<title>BnB - Hair Appointment</title>

	<%@ include file="/css/include_css.jsp" %>		
	
</head>
<body>

<!-- display application path -->
<% //= request.getContextPath()%>
	
<!-- can also find path like this...<a href="${pageContext.request.contextPath}${'/a5/index.jsp'}">A5</a> -->	
	
	<%@ include file="/global/nav_global.jsp" %>	

	<div class="container">

		<div class="starter-template">
					
					<div class="page-header">

					<!-- View source or uncomment to display Parameter value...
								Parameter value: <%= request.getParameter("assign_num") %>

								Note: use JSTL (JSP Standard Tag Library) combined with EL (Expression Language), instead of Java scriplets to run conditional logic.
								To use core tag must include tag Library link in first line of file - see top.
								<%  //@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
								Also, need taglib .jar files. See WEB-INF > lib directory.
						-->

					<%  // w/o using taglib: String anum = request.getParameter("assign_num"); %>
					<!-- Or, using JSTL's expression language (EL): request parameters made available in implicit param object. -->
						
					<c:set var="anum" value="${param.assign_num}" scope="request" />
					<!-- Uncomment to Print: -->
					<%-- <c:out value="${anum}" /> --%>
					<c:choose>
						<c:when test="${anum == null || anum == '0'}">
						<%@ include file="/global/header.jsp" %>
					</div>
					<p><i>${message}</i></p>
						</c:when>

						<c:when test="${anum == 'a4'}">
							<%@ include file="/a4/global/header.jsp" %>													
				</div>
						</c:when>

						<c:when test="${anum == 'a5'}">
							<%@ include file="/a5/global/header.jsp" %>
			</div>
						</c:when>

						<c:when test="${anum == 'p2'}">
							<%@ include file="/p2/global/header.jsp" %>													
			</div>
						</c:when>
						
						<c:otherwise>
							<% response.sendRedirect("/lis4368/index.jsp"); %>
						</c:otherwise>
					</c:choose>
					
					<!--
							 https://www.tutorialspoint.com/servlets/servlets-first-example.htm								
							 http://stackoverflow.com/questions/11731377/servlet-returns-http-status-404-the-requested-resource-servlet-is-not-availa								
							 Form action submission to URL with leading slash:
							 <form action="/servlet">
							 Leading slash / makes URL relative to domain, that is, form will submit to:
							 http://localhost:9999/servlet

							 Form action submission to URL w/o leading slash:								
							 <form action="servlet">
							 Makes URL relative to current directory of current URL. Form will submit to:
							 http://localhost:9999/contextname/somedirectory/servlet								

							 Best solution: make URL domain-relative (won't need to fix URLs when JSP/HTML files moved into another folder)
							 <form action="${pageContext.request.contextPath}/servlet">

							 Makes URL context relative. Form will submit to:								
							 <form action="/contextname/servlet">
							 Will *always* submit to correct URL!

							 Use this servlet for testing: ShowParameters								
					-->
					
					<p><a href="customerAdmin?action=display_customers">Display Customers</a></p>

					<% //for debugging, test input (test servlet provided): action="testInput" %>
					<form id="add_customer_form" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/customerAdmin">

						<input type="hidden" name="action" value="add_customer">

						<div class="form-group">
							<label class="col-sm-4 control-label">fName:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="15" name="fname" value="${customer.fname}" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">LName:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="30" name="lname" value="${customer.lname}" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Street:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="30" name="street" value="${customer.street}"/>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">City:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="30" name="city" value="${customer.city}"/>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">State:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="2" name="state" value="${customer.state}"/>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Zip:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="9" name="zip" value="${customer.zip}"/>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Phone:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="10" name="phone" value="${customer.phone}"/>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Email:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="100" name="email" value="${customer.email}" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Service Required:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="32" name="service" value="${customer.service}"/>
							</div>
						</div>						

						<div class="form-group">
							<label class="col-sm-4 control-label">Stylist Preferred:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="32" name="stylist" value="${customer.stylist}"/>
							</div>
						</div>						

						<div class="form-group">
							<label class="col-sm-4 control-label">Notes:</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" maxlength="255" name="notes" value="${customer.notes}"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-6 col-sm-offset-3">
								<button type="submit" class="btn btn-primary" name="signup" value="Sign up">Submit</button>
							</div>
						</div>
					</form>

	<%@ include file="/global/footer.jsp" %>

	</div> <!-- end starter-template -->
	</div> <!-- end container -->

	<!-- <%-- test server-side validation, by not including client-side JavaScript --%> -->
 	<%@ include file="/js/include_js.jsp" %>		
 
 <script type="text/javascript">
$(document).ready(function() {
		
	$('#add_customer_form').formValidation({
			message: 'This value is not valid',
			icon: {
							valid: 'fa fa-check',
							invalid: 'fa fa-times',
							validating: 'fa fa-refresh'
					},
					fields: {
		
						fname: {
									validators: {
											notEmpty: {
													message: 'First name required'
											},
											stringLength: {
													min: 1,
													max: 15,
													message: 'First name no more than 15 characters'
											},
											regexp: {
												//http://www.regular-expressions.info/
												//http://www.regular-expressions.info/quickstart.html
												//http://www.regular-expressions.info/shorthand.html
												//http://stackoverflow.com/questions/13283470/regex-for-allowing-alphanumeric-and-space
												//alphanumeric (also, "+" prevents empty strings):
												regexp: /^[a-zA-Z\-]+$/,
												message: 'First name can only contain letters and hyphens.'
											},									
									},
							},
		
						lname: {
									validators: {
											notEmpty: {
													message: 'Last name required'
											},
											stringLength: {
													min: 1,
													max: 30,
													message: 'Last name no more than 30 characters'
											},
											regexp: {
												regexp: /^[a-zA-Z\-]+$/,
												message: 'Last name can only contain letters and hyphens'
											},									
									},
							},
							
						street: {
									validators: {
											notEmpty: {
													message: 'Street required'
											},
											stringLength: {
													min: 1,
													max: 30,
													message: 'Street no more than 30 characters'
											},
											regexp: {
											//street: only letters, numbers, comma, space character, and period
												regexp: /^[a-zA-Z0-9,\-\s\.]+$/,
												message: 'Street can only contain letters, number, commas, hyphens, or periods'								
											},
									},
							},
		
						city: {
									validators: {
											notEmpty: {
													message:'City required'
											},
											stringLength: {
													min: 1,
													max: 30,
													message: 'City no more than 30 characters'
											},
											regexp: {
											//cities can contain hypens: Winson-Salem
												regexp: /^[a-zA-Z0-9\-\s]+$/,
												message: 'City can only contain letters, number, hyphens, and space characters (29 Palms)'								
											},
									},
							},
							
						state: {
									validators: {
											notEmpty: {
													message:'State required'
											},
											stringLength: {
													min: 2,
													max: 2,
													message: 'State must be two characters'
											},
											regexp: {
												regexp: /^[a-zA-Z]+$/,
												message: 'State can only contain letters'								
											},
									},
							},
		
						zip: {
									validators: {
											notEmpty: {
													message:'Zip required'
											},
											stringLength: {
													min: 5,
													max: 9,
													message: 'Zip must be 5, and no more than 9 digits'
											},
											regexp: {
												regexp: /^[0-9]+$/,
												message: 'Zip can only contain numbers'								
											},
									},
							},
		
						phone: {
									validators: {
											notEmpty: {
													message:'Phone required, including area code, only numbers'
											},
											stringLength: {
													min: 10,
													max: 10,
													message: 'Phone must be 10 digits'
											},
											regexp: {
												regexp: /^[0-9]+$/,
												message: 'Phone must be digits!'								
											},
									},
							},
		
							email: {
									validators: {
											notEmpty: {
													message: 'Email address is required'
											},
		
											/*
											//built-in e-mail validator, comes with formValidation.min.js
											//using regexp instead (below)
											emailAddress: {
													message: 'Must include valid email address'
											},
											*/
										
											stringLength: {
													min: 1,
													max: 100,
													message: 'Email no more than 100 characters'
											},
											regexp: {
											regexp: /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/,
												message: 'Must include valid email'
											},																		
									},
							},
		
						balance: {
									validators: {
											notEmpty: {
													message:'Balance is required'
											},
											stringLength: {
													min: 1,
													max: 7,
													message: 'Balance can be no more than 6 digits, including decimal point'
											},
											regexp: {
												regexp: /^[0-9\.]+$/,
												message: 'Balance can only contain numbers and decimal point'								
											},
									},
							},
		
						total_sales: {
									validators: {
											notEmpty: {
													message:'Total sales is required'
											},
											stringLength: {
													min: 1,
													max: 7,
													message: 'Total sales can be no more than 6 digits, Including decimal point'
											},
											regexp: {
												regexp: /^[0-9\.]+$/,
												message: 'Total sales can only contain numbers and decimal point'								
											},
									},
							},
					}
			});
		});
</script>

</body>
</html>
