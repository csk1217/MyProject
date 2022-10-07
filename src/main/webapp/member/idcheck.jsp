<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 조회</title>
</head>
<body>
	<% 
		String m_id = request.getParameter("m_id");
	
		if(m_id == null){
	%>
			<h3>아이디 중복 조회</h3>
			<form name="member" method="post" action="idcheck_ok.jsp">
				아이디 : <input type="text" name="m_id"> 
				<input type="submit" value="아이디 중복검사">
			</form>
	<%  } 
		else{
	%>
			<h4><%=m_id %>는 가입할 수 있는 아이디입니다.</h4>
			<input type="button" value="닫기" onclick="window.close()">	
	<%		
		}
	%>
</body>
</html>