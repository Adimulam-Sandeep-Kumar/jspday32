<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*" import = "ai.jobiak.model.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
<% 
		String ProductId = request.getParameter("ProductId");
		String userName = "root";
		String password = "admin";
		String url ="jdbc:mysql://localhost:3306/world";
		Connection con = null;
		
		ArrayList<Product>productList = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,userName,password);
			
			Statement st = con.createStatement();
			String sql = "delete from products where productId =?";
			PreparedStatement pst = con.prepareStatement("delete from products where productId = ?"); 
			pst.setInt(1, 11);
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		

    

%>
</body>
</html>