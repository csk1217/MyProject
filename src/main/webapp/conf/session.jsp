<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_id = "";
		
	if(session.getAttribute("m_id")!= null){
		m_id = (String)session.getAttribute("m_id");
	}
	
	if(m_id.equals("")){
	
%>
		<script>
			alert("게시판 사용을 위해 로그인을 해주세요.");
			location.href="../login/login.jsp";
		</script>
<% 
	}
%>
