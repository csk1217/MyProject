<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		String r_passwd=request.getParameter("r_passwd");
		String r_subject =request.getParameter("r_subject");
		String r_content =request.getParameter("r_content");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql1 = "select r_passwd from reviewboard where r_num=?";
			
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, r_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String passwd = rs.getString("r_passwd");
				
				if(r_passwd.equals(passwd)){
					String sql2 = "update reviewboard set r_subject=?,r_content=? where r_num=?";
					
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1, r_subject);
					pstmt.setString(2, r_content);
					pstmt.setInt(3, r_num);
					pstmt.executeUpdate();
					
					%>
						<script>
							alert("게시물 수정완료!");
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