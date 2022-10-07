<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회수</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		
		PreparedStatement pstmt = null;
		
		try{
			
			String sql = "update shareboard set s_readnum= s_readnum + 1 where s_num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_num);
			
			pstmt.executeUpdate();
			
			response.sendRedirect("content.jsp?s_num="+s_num);
			
		}catch(SQLException ex){
			out.println(ex.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>