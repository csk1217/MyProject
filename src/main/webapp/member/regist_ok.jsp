<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String m_id = request.getParameter("m_id");
		String m_passwd = request.getParameter("m_passwd");;
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("m_email");
		String m_tel = request.getParameter("m_tel1")+"-"+request.getParameter("m_tel2")+"-"+request.getParameter("m_tel3");
		String m_gender = request.getParameter("m_gender");
		String[] hobby = request.getParameterValues("m_hobby");
		String m_profile = request.getParameter("m_profile");
		String m_ip = request.getRemoteAddr();
		
		String m_hobby="";
		if(hobby != null){
			for(int i=0;i<hobby.length;i++){
				m_hobby += hobby[i]+" ";
			}
		}
		
		PreparedStatement pstmt = null;
		
		try{
			String sql = "insert into member(m_id,m_passwd,m_name,m_email,m_tel,m_gender,m_hobby,m_profile,m_date,m_ip) values (?,?,?,?,?,?,?,?,sysdate(),?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			pstmt.setString(2,m_passwd);
			pstmt.setString(3,m_name);
			pstmt.setString(4,m_email);
			pstmt.setString(5,m_tel);
			pstmt.setString(6,m_gender);
			pstmt.setString(7,m_hobby);
			pstmt.setString(8,m_profile);
			pstmt.setString(9,m_ip);
			pstmt.executeUpdate();

			response.sendRedirect("../login/login.jsp");
		}catch(SQLException ex){
			out.println(ex.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	%>
</body>
</html>