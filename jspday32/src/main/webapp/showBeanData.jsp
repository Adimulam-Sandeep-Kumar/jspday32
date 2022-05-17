<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="userBean" class="ai.jobiak.model.User" scope="request"></jsp:useBean>

	<hr>
		<h3>Your Data is:<br>
		 First name :<jsp:getProperty name="userBean" property="fname"/><br>
		 Email :<jsp:getProperty name="userBean" property="email"/><br>
		 Mobile # :<jsp:getProperty name="userBean" property="mobile"/><br>		
		</h3>
		
	<hr>

</body>
</html>