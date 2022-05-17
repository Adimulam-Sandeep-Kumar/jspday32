<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="userBean" class="ai.jobiak.data.Contacts" scope="request"></jsp:useBean>

	<hr>
		<h3>Inserted Data is : <br>
		 ID :<jsp:getProperty name="userBean" property="contactId"/><br>
		 Name :<jsp:getProperty name="userBean" property="name"/><br>
		 Mobile :<jsp:getProperty name="userBean" property="mobilenum"/><br>		
		</h3>	
	<hr>
</body>
</html>