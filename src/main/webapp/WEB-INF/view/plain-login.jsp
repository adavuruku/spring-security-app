<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="Abdulraheem Sherif A.">
	    <meta name="generator" content="Jekyll v4.1.1">
	    <title>Spring MVC Security App</title>
	    <style>
	    	.failed{
	    		color:red;
	    	}
	    </style>
	</head>
	<body>
		<h2>Custom Login Authentication Form</h2>
		<!-- checking for failed login since 
			spring security provide ?error url 
			for failed login-->
		<c:if test="${param.error != null }">
			<i class="failed" >Sorry! You entered invalid username/password</i>
		</c:if>
		<!-- checking for logout since 
			spring security provide ?logout url -->
		<c:if test="${param.logout != null }">
			<i>You have been logged out</i>
		</c:if>
		<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
			User Name : <input type="text" name="username"/>
			<br/><br/>
			Password (*) :<input type="password" name="password"/>
			<br/><br/>
			<input type="submit" value="Login"/>
		</form:form>
	</body>
</html>