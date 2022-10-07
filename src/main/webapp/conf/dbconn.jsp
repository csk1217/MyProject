<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	
	try{
		String url = "jdbc:mysql://localhost:3306/book?serverTimezone=UTC";
		String user = "root";
		String password = "12345";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	} catch(SQLException ex){
		out.println(ex.getMessage());
	}
%>