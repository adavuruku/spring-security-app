<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<title>Security Test | Home</title>
	</head>
	<body>
		<h2>Home Page</h2>
		<hr/>
		<p>Welcome To Our Page</p>
		
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			
			<input type="submit" value="Log Out"/>
		</form:form>
	</body>
</html>