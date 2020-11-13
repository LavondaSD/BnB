<%@page contentType="text/html" pageEncoding="utf-8"%>

<html lang="en">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="My online portfolio that illustrates skills acquired while working through various project requirements.">
	<meta name="author" content="Kayode Adegbite">
	<link rel="icon" href="favicon.ico">

	<title>LIS4368- JSP Forms</title>

	<%@ include file="/css/include_css.jsp" %>		
	
</head>
<body>

	<%@ include file="/global/nav_global.jsp" %>	

	<div class="container">
		<div class="starter-template">
					
					<div class="page-header">
						<%@ include file="/global/header.jsp" %>
					</div>

    <h3>Thanks for joining our customer list!</h3>

    <p>Here is the information that you entered:</p>

		<div class="col-xs-12 col-sm-offset-4 text-left">
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<% //<c:out... prevents cross-site scripting (XSS) attack (escapes output) %>
			<label>FName:</label> <c:out value="${user.fname}" /> <br/>
			<label>LName:</label> <c:out value="${user.lname}" /> <br/>
			<label>Street:</label> <c:out value="${user.street}" /> <br/>
			<label>City:</label> <c:out value="${user.city}" /> <br/>
			<label>State:</label> <c:out value="${user.state}" /> <br/>
			<label>Zip:</label> <c:out value="${user.zip}" /> <br/>
			<label>Phone:</label> <c:out value="${user.phone}" /> <br/>
			<label>Email:</label> <c:out value="${user.email}" /> <br/>
			<label>Balance:</label> <c:out value="${user.service}" /> <br/>
			<label>Total Sales:</label> <c:out value="${user.stylist}" /> <br/>
			<label>Notes:</label> <c:out value="${user.notes}" /> <br/><br/>

			<p>To enter another record click Return.</p>

			<form method="post" class="form-horizontal" action="${pageContext.request.contextPath}/customerAdmin">
				<input type="hidden" name="action" value="join">
				<input type="submit" value="Return">
			</form>

	<%@ include file="/global/footer.jsp" %>

	</div> <!-- end starter-template -->
 </div> <!-- end container -->
		
</body>
</html>
