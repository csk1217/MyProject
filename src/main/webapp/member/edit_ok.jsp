<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String m_id = (String)session.getAttribute("m_id");
		
		String m_passwd = request.getParameter("m_passwd");
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("m_email");
		String m_tel = request.getParameter("m_tel1")+"-"+request.getParameter("m_tel2")+"-"+request.getParameter("m_tel3");
		String m_gender = request.getParameter("m_gender");
		String[] hobby = request.getParameterValues("m_hobby");
		String m_profile = request.getParameter("m_profile");
		
		String m_hobby="";
		if(hobby != null){
			for(int i=0;i<hobby.length;i++){
				m_hobby += hobby[i]+" ";
			}
		}
		
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
					String sql2 = "update member set m_name=?,m_email=?,m_tel=?,m_gender=?,m_hobby=?,m_profile=? where m_id=?";
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1,m_name);
					pstmt.setString(2,m_email);
					pstmt.setString(3,m_tel);
					pstmt.setString(4,m_gender);
					pstmt.setString(5,m_hobby);
					pstmt.setString(6,m_profile);
					pstmt.setString(7,m_id);
					pstmt.executeUpdate();
	%>				
					<script>
						alert("회원정보 수정이 처리되었습니다.");
						location.href = "../login/login.jsp";
					</script>
	<%				
				}
				else{
	%>
					<script>
						alert("비밀번호가 틀려서 회원수정이 되지 않았습니다.");
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