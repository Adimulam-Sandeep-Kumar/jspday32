<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*" import = "ai.jobiak.data.Fruit" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fruit Cart</title>
</head>
<body>

<%! 
    private ArrayList<Fruit> getFruits() {
    	
		String userName = "root";
		String password = "admin";
		String url ="jdbc:mysql://localhost:3306/world";
		Connection con = null;
		
		ArrayList<Fruit>fruitList = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,userName,password);
			
			Statement st = con.createStatement();
			String sql = "Select * from fruits";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				Fruit p= new Fruit(rs.getString(1),rs.getString(2),rs.getDouble(3));
				fruitList.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con!=null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return fruitList;
    }
    
%>
<%
	ArrayList<Fruit>itemsList = null;
	itemsList=getFruits();		 
	out.println("<hr/>");	
	for(int i=0;i<itemsList.size();i++) {		
		out.println("<a href = 'fruitcart.jsp?item="+itemsList.get(i).getFruitId()+"'>Item"+" "+itemsList.get(i).getFruitId()+"</a><br/>");

	}
	
	out.println("<hr/>");		
	HttpSession fruitCart = request.getSession();
	ArrayList<Fruit>selectedItemsList = null;
	
	if(fruitCart.isNew()) {
		selectedItemsList = new ArrayList<>();
		fruitCart.setAttribute("items", selectedItemsList);
	}else {
					
		String queryStr = request.getQueryString();
		String splitArray[] = queryStr.split("=");
		String fruitId = splitArray[1];
		
		for(int i=0;i<itemsList.size();i++) {
			
			if(itemsList.get(i).getFruitId().equals(fruitId)) {
				selectedItemsList = (ArrayList<Fruit>)fruitCart.getAttribute("items");
				selectedItemsList.add(itemsList.get(i));
				fruitCart.setAttribute("items", selectedItemsList);
				break;				
			}			
		}	
	}
		
	for(Fruit p:selectedItemsList) {
		out.println(p.getFruitId()+"::"+p.getDescription()+"::"+p.getPrice()+"<br/>");
	} 

	out.println("<hr/>");
	out.println("<h3>Items in the cart#"+itemsList.size());
		
%>
</body>
</html>