<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 저장</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
			
		String r_passwd = request.getParameter("r_passwd");
		String r_subject = request.getParameter("r_subject");
		String r_content = request.getParameter("r_content");
		String r_ip = request.getRemoteAddr();
		PreparedStatement pstmt = null;
		
		
		try{
			String sql = "insert into reviewboard(r_passwd, r_subject, r_content, r_writedate, r_readnum, r_ip,m_id) values(?,?,?,sysdate(),0,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_passwd);
			pstmt.setString(2, r_subject);
			pstmt.setString(3, r_content);
			pstmt.setString(4, r_ip);
			pstmt.setString(5, m_id);
			
			pstmt.executeUpdate();
			
	%>
				<script>
					alert("게시물 작성완료!");
					location.href="list.jsp";
				</script>
	<% 
		}catch(SQLException ex){
			out.println(ex.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	%>
</body>
</html>