<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
	<head>
		<title>Security Test | Home</title>
	</head>
	<body>
		<h2>Systems Home Page</h2>
		<hr/>
		<p>Welcome To Systems Home Page</p>
		<p>We have our annual holiday Carribbean cruise up. Register now!
		<br/>
			Keep this trip a secret, don't tell the regular employee :-)
		</p>
		<hr/>
		<a href="${pageContext.request.contextPath}/">Back To Home Page</a>
	</body>
</html>