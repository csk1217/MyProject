<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="notice.css">
</head>
<body>
	<%
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			
			String sql = "select n_num,n_subject,n_writedate from notice order by n_num desc limit 5";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
				%>
				<div id = "notice">
					<div id = "notice_k">
						<h3>알립니다</h3>
						<p><a href="../notice/list.jsp" target="_top">더보기 +</a></p>
					</div>
				<table width="100%" border="0">
				
				<%
				
				while(rs.next()){
					String n_subject = rs.getString("n_subject");
					String n_writeday = rs.getString("n_writedate");	
					
					if(n_subject.length() >= 50){
						n_subject = n_subject.substring(0,50) + "..."; 
					}
			%>		
					<tr>
						<td id="subject"><%=n_subject %></td>
						<td align="right" id="date"><%=n_writeday %></td>
					</tr>
				
			<%
			 	}
			%>
				</table>
				</div>
			<%
			
		}catch(SQLException ex){
			out.println(ex.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}
		
	 %>
</body>
</html>