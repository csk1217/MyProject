<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String m_id = (String)session.getAttribute("m_id");
		String m_passwd = request.getParameter("m_passwd");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql1 = "select m_passwd from member where m_id=?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1,m_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String passwd = rs.getString("m_passwd");
				if(m_passwd.equals(passwd)){
					String sql2 = "delete from member where m_id=?";
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1,m_id);
					pstmt.executeUpdate();
	%>				
					<script>
						alert("회원탈퇴가 처리되었습니다.");
						location.href = "../login/logout.jsp";
					</script>
	<%				
				}
				else{
	%>
					<script>
						alert("비밀번호가 틀려서 회원탈퇴가 되지 않았습니다.");
						history.back();
					</script>
	<%				
				}
			}
		}catch(SQLException ex){
			out.println(ex.getMessage());
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>