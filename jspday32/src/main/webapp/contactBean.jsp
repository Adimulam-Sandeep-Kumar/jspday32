<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jobiak Contact Page</title>
</head>
<body>

	<%!
	   private Connection connect() {
    	
			String userName = "root";
			String password = "admin";
			String url ="jdbc:mysql://localhost:3306/world";
			Connection con = null;
		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(url,userName,password);	 
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			return con;
	    }
	   	
	%>
	<%
	String contactIdStr = request.getParameter("contactId");
	String nameStr = request.getParameter("name");
	String mobilenumStr = request.getParameter("mobilenum");
			
	Connection con = connect();
	int count = 0;
	try {
		PreparedStatement ps = con.prepareStatement("insert into contacts values(?,?,?)");
		ps.setString(1, contactIdStr);
		ps.setString(2, nameStr);
		ps.setString(3, mobilenumStr);
		
		count = ps.executeUpdate();
		
	} catch (SQLException e) {	
		e.printStackTrace();
	}						
		
	%>

	<jsp:useBean id="userBean" class="ai.jobiak.data.Contacts"></jsp:useBean>
	<jsp:setProperty name="userBean" property = "contactId" param="contactId"/>
	<jsp:setProperty name="userBean" property = "name" param="name"/>
	<jsp:setProperty name="userBean" property = "mobilenum" param="mobilenum"/>

	<hr>			
		<hr>
		<h3>Inserted Data is : <br>
		 ID :<jsp:getProperty name="userBean" property="contactId"/><br>
		 Name :<jsp:getProperty name="userBean" property="name"/><br>
		 Mobile :<jsp:getProperty name="userBean" property="mobilenum"/><br>		
		</h3>	
	<hr>
			
</body>
</html>