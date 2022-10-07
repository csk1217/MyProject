<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 저장</title>
</head>
<body>
	<%
		MultipartRequest multi = new MultipartRequest(request, "D:/JSP/book/src/main/webapp/images", 100 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

		String b_id = (String)session.getAttribute("m_id");
		String b_passwd = multi.getParameter("b_passwd");
		String b_subject = multi.getParameter("b_subject");
		String b_separate = multi.getParameter("b_separate");
		String b_author = multi.getParameter("b_author");
		String b_publisher = multi.getParameter("b_publisher");
		String b_categori = multi.getParameter("b_categori");
		String b_content = multi.getParameter("b_content");
		int b_page = Integer.parseInt(multi.getParameter("b_page"));
		String b_file = multi.getFilesystemName("b_file");
		String b_ip = request.getRemoteAddr();
		PreparedStatement pstmt = null;
		
		
		try{
			String sql = "insert into books(m_id, b_passwd, b_subject, b_separate, b_author, b_publisher, b_categori, b_content, b_page, b_writedate, b_readnum, b_ip,b_file) values(?,?,?,?,?,?,?,?,?,sysdate(),0,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_id);
			pstmt.setString(2, b_passwd);
			pstmt.setString(3, b_subject);
			pstmt.setString(4, b_separate);
			pstmt.setString(5, b_author);
			pstmt.setString(6, b_publisher);
			pstmt.setString(7, b_categori);
			pstmt.setString(8, b_content);
			pstmt.setInt(9, b_page);
			pstmt.setString(10, b_ip);
			pstmt.setString(11, b_file);
			pstmt.executeUpdate();
			
	%>
				<script>
					alert("도서등록 완료!");
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