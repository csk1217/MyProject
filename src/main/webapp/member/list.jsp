<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/admin.jsp" %> 
<%@ include file="../conf/dbconn.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록보기</title>
</head>
<body>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select m_num,m_id, m_name,m_email, m_tel, m_gender, m_date from member order by m_num desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	%>
			<h3>회원목록보기</h3>
			<table border="1" width="600">
				<tr>	
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>성별</th>
					<th>가입일</th>
				</tr>
	<% 		while(rs.next()){ %>		
				<tr>	
					<td><%=rs.getString("m_num") %></td>
					<td><%=rs.getString("m_id") %></td>
					<td><%=rs.getString("m_name") %></td>
					<td><%=rs.getString("m_email") %></td>
					<td><%=rs.getString("m_tel") %></td>
					<td><%=rs.getString("m_gender") %></td>
					<td><%=rs.getString("m_date") %></td>
				</tr>
	<%
			}
		}catch(SQLException ex){
			out.println(ex.getMessage());
		}finally{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>			
			</table>
	
	<a href="#">회원정보수정</a>
	<a href="#">회원삭제</a>
	<a href="../login/logout.jsp">로그아웃</a>		
</body>
</html>