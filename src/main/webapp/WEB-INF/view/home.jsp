<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
	<head>
		<title>Security Test | Home</title>
	</head>
	<body>
		<h2>Home Page</h2>
		<hr/>
		<p>Welcome To Our Page</p>
		<p>User: <security:authentication property="principal.username" /></p>
		<p>Role(s): <security:authentication property="principal.authorities" /></p>
		
		<!-- Add a link to point to /systems this is for admin -->
		<security:authorize access="hasRole('ADMIN')">
		
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a> (Only For Admin Peeps)
		</p>
		</security:authorize>
		<!-- Add a link to point to/leaders this is for managers -->
		<security:authorize access="hasRole('MANAGER')">
			<p>
				<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a> (Only For Managers Peeps)
			</p>
		</security:authorize>
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			
			<input type="submit" value="Log Out"/>
		</form:form>
	</body>
</html>