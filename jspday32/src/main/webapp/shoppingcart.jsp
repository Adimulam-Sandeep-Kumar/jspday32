<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*" import = "ai.jobiak.model.Product" import = "javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>

<%! 
    private ArrayList<Product> getProducts() {
    	
		String userName = "root";
		String password = "admin";
		String url ="jdbc:mysql://localhost:3306/world";
		Connection con = null;
		
		ArrayList<Product>productList = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,userName,password);
			
			Statement st = con.createStatement();
			String sql = "Select * from products";
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				Product p= new Product(rs.getString(1),rs.getString(2),rs.getDouble(3));
				productList.add(p);
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
		
		return productList;
    }
    
%>
<%

	ArrayList<Product>itemsList = null;
	itemsList=getProducts();		 
	out.println("<hr/>");	
	for(int i=0;i<itemsList.size();i++) {		
		out.println("<a href = 'shoppingcart.jsp?item="+itemsList.get(i).getProductId()+"'>AddItem"+" "+itemsList.get(i).getProductId()+"</a><br/>");

	}
	out.println("<hr/>");		
	HttpSession shoppingCart = request.getSession();
	ArrayList<Product>selectedItemsList = null;
	
	if(shoppingCart.isNew()) {
		selectedItemsList = new ArrayList<>();
		shoppingCart.setAttribute("items", selectedItemsList);
	}else {
					
		String queryStr = request.getQueryString();
		String splitArray[] = queryStr.split("=");
		String productId = splitArray[1];
		
		for(int i=0;i<itemsList.size();i++) {
			
			if(itemsList.get(i).getProductId().equals(productId)) {
				selectedItemsList = (ArrayList<Product>)shoppingCart.getAttribute("items");
				selectedItemsList.add(itemsList.get(i));
				shoppingCart.setAttribute("items", selectedItemsList);
				break;				
			}			
		}	
	}
	
	if(selectedItemsList!=null){
		double sum=0;
	for(Product p:selectedItemsList) {
		sum = sum+p.getPrice();
		out.println(p.getProductId()+"::"+p.getDescription()+"::"+p.getPrice()+"<br/>");
	} 
	out.println("<hr/>");
	out.println("<h3>Total Price = "+sum);
	}
	out.println("<hr/>");
	out.println("<h3>Items in the cart#"+itemsList.size());
		
%>
</body>
</html>