<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유게시판 저장</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
			
		String s_passwd = request.getParameter("s_passwd");
		String s_subject = request.getParameter("s_subject");
		String s_content = request.getParameter("s_content");
		String s_ip = request.getRemoteAddr();
		PreparedStatement pstmt = null;
		
		
		try{
			String sql = "insert into shareboard(s_passwd, s_subject, s_content, s_writedate, s_readnum, s_ip,m_id) values(?,?,?,sysdate(),0,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_passwd);
			pstmt.setString(2, s_subject);
			pstmt.setString(3, s_content);
			pstmt.setString(4, s_ip);
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