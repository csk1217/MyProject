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
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		
		PreparedStatement pstmt = null;
		
		try{
		
			String sql = "update reviewboard set r_readnum= r_readnum + 1 where r_num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r_num);
			
			pstmt.executeUpdate();
			
			response.sendRedirect("content.jsp?r_num="+r_num);
			
		}catch(SQLException ex){
			out.println(ex.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>