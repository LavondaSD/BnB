<%@ page import="java.util.Date, java.util.TimeZone, java.text.SimpleDateFormat" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">			
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index.jsp" target="_self">Home</a>
			</div>

			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="../index.jsp">LIS4368</a></li>
					<li><a href="../a1/index.jsp">A1</a></li>
					<li><a href="../a2/index.jsp">A2</a></li>
					<li><a href="../a3/index.jsp">A3</a></li>
					<li><a href="../customerform.jsp?assign_num=a4">A4</a></li>
					<li><a href="../customerform.jsp?assign_num=a5">A5</a></li>
					<li><a href="../p1/index.jsp">P1</a></li>
					<li><a href="../customerform.jsp?assign_num=p2">P2</a></li>
					<li><a href="../test/index.jsp">Test</a></li>					
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>

<%
//https://docs.oracle.com/javase/6/docs/api/java/text/SimpleDateFormat.html
SimpleDateFormat timeFormat = new SimpleDateFormat("M/d/yy h:m a ");
timeFormat.setTimeZone(TimeZone.getTimeZone("America/New_York"));
String time = timeFormat.format(new Date());
%>
<%= time %>	
