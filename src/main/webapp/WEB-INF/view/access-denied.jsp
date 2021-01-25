<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
	<head>
		<title>Security Test | Home</title>
	</head>
	<body>
		<h2>Ooops Access Denied Page</h2>
		<hr/>
		<h3>Access Denied - You are not authorized to access this resource.</h3>
		<hr/>
		<a href="${pageContext.request.contextPath}/">Back To Home Page</a>
	</body>
</html>