<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		String b_passwd=request.getParameter("b_passwd");
		String b_subject = request.getParameter("b_subject");
		String b_separate = request.getParameter("b_separate");
		String b_author =  request.getParameter("b_author");
		String b_publisher = request.getParameter("b_publisher");
		String b_categori = request.getParameter("b_categori");
		String b_content = request.getParameter("b_content");
		String b_writedate = request.getParameter("b_writedate");
		int b_page = Integer.parseInt(request.getParameter("b_page"));
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql1 = "select b_passwd,b_subject, b_separate, b_author, b_publisher, b_categori, b_content, b_page, b_writedate from books where b_num=?";
			
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, b_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String passwd = rs.getString("b_passwd");
				
				if(b_passwd.equals(passwd)){
					String sql2 = "update books set b_subject=?,b_separate=?,b_author=?,b_publisher=?,b_categori=?,b_content=?,b_writedate=?,b_page=? where b_num=?";
					
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1, b_subject);
					pstmt.setString(2, b_separate);
					pstmt.setString(3, b_author);
					pstmt.setString(4, b_publisher);
					pstmt.setString(5, b_categori);
					pstmt.setString(6, b_content);
					pstmt.setString(7, b_writedate);
					pstmt.setInt(8, b_page);
					pstmt.setInt(9, b_num);
					pstmt.executeUpdate();
					
					%>
						<script>
							alert("도서 수정완료!");
							location.href="list.jsp";
						</script>
					<%
				}else{
					%>
						<script>
							alert("비밀번호가 틀렸습니다. 다시 입력해주세요.");
							history.back();
						</script>
					<%
				}
			}
		}catch(SQLException ex){
			out.println(ex.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>