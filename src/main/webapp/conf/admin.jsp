<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_id = "";
	if(session.getAttribute("m_id")!= null){
		m_id = (String)session.getAttribute("m_id");
	}
	
	if(!m_id.equals("admin")){
		%>
		<script>
			alert("접근할 수 없습니다.");
			location.href="../index.jsp";
		</script>
<% 
	}
%>