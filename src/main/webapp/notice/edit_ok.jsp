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
	
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		String n_passwd=request.getParameter("n_passwd");
		String n_subject =request.getParameter("n_subject");
		String n_content =request.getParameter("n_content");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql1 = "select n_passwd from notice where n_num=?";
			
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, n_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String rpasswd = rs.getString("n_passwd");
				
				if(n_passwd.equals(rpasswd)){
					String sql2 = "update notice set n_subject=?,n_content=? where n_num=?";
					
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1, n_subject);
					pstmt.setString(2, n_content);
					pstmt.setInt(3, n_num);
					pstmt.executeUpdate();
					
					%>
						<script>
							alert("공지사항 수정완료!");
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