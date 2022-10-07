<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		String s_passwd=request.getParameter("s_passwd");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql1 = "select s_passwd from shareboard where s_num=?";
			
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, s_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String passwd = rs.getString("s_passwd");
				
				if(s_passwd.equals(passwd)){
					String sql2 = "delete from shareboard where s_num=?";
					
					pstmt = conn.prepareStatement(sql2);
					pstmt.setInt(1, s_num);
					pstmt.executeUpdate();
					
					%>
						<script>
							alert("게시물 삭제완료!");
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