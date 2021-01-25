<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
	<head>
		<title>Security Test | Home</title>
	</head>
	<body>
		<h2>Leaders Page</h2>
		<hr/>
		<p>Welcome To Leaders Page</p>
		<p>See you in Brazil ... for our annual Leadership retreat!
		<br/>
			Keep this trip a secret, don't tell the regular employee :-)
		</p>
		<hr/>
		<a href="${pageContext.request.contextPath}/">Back To Home Page</a>
	</body>
</html>