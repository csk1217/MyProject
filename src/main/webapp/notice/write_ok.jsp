<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 저장</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String n_id = (String)session.getAttribute("m_id");
		String n_passwd = request.getParameter("n_passwd");
		String n_subject = request.getParameter("n_subject");
		String n_content = request.getParameter("n_content");
		String n_ip = request.getRemoteAddr();
		PreparedStatement pstmt = null;
		
		
		try{
			String sql = "insert into notice(m_id, n_passwd, n_subject, n_content, n_writedate, n_readnum, n_ip) values(?,?,?,?,sysdate(),0,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n_id);
			pstmt.setString(2, n_passwd);
			pstmt.setString(3, n_subject);
			pstmt.setString(4, n_content);
			pstmt.setString(5, n_ip);
			
			pstmt.executeUpdate();
			
	%>
				<script>
					alert("공지사항 작성완료!");
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