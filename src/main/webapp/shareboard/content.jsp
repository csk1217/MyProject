<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공유게시판 내용 보기</title>
<link rel="stylesheet" href="../boardStyle.css">
</head>
<body>
<div id="container">
		<header>
			<div id="topheader">
				<div id="loginbox">
					<ul>
					<%
						if(session.getAttribute("m_id")!= null){
							m_id=(String)session.getAttribute("m_id");
						}
						if(m_id.equals("admin")){
					%>
						
						<li id="login-menu"><%=m_id %>님 환영합니다. &nbsp;
						<a href="../login/logout.jsp">로그아웃 |&nbsp;</a>
						<a href="../member/edit.jsp" target="_top">회원정보수정 |&nbsp;</a>
						<a href="../admin/list.jsp" target="_top">회원목록보기</a>
						</li>
						
					<%
						}
						else if(!m_id.equals("")){
					%>
						<li id="login-menu"><%=m_id %>님 환영합니다. &nbsp;
							<a href="../login/logout.jsp">로그아웃 |&nbsp;</a>
							<a href="../member/edit.jsp" target="_top">회원정보수정 |&nbsp;</a>
							<a href="../member/delete.jsp" target="_top">회원탈퇴</a>
						</li>
							
					<%	
						}
					else{
					%>
					<li id="login-menu">
						<a href="../login/login.jsp">로그인 |&nbsp; </a>
					</li>
					<li id="login-menu">
						<a href="../member/regist.jsp"> 회원가입 </a>
					</li>
					</ul>
					<%	
						}
					%>	
				</div>			
			</div>
			<div id="logo">
				<a href="../index.jsp">
					<h1>Book of us</h1>
				</a>
			</div>
			<nav>
				<ul id="topMenu">
					<li><a href="../etc/introduce.jsp">사이트 소개</a>
						<ul>
							<li><a href="../etc/introduce.jsp">Book of Us</a></li>
						</ul>
					</li>
					<li><a href="../notice/list.jsp">알림마당</a>
						<ul>
							<li><a href="../notice/list.jsp">공지사항</a></li>
						</ul>
					</li>
					<li><a href="../books/list_all.jsp">추천도서</a>
						<ul>
							<li><a href="../books/list.jsp">국내도서</a></li>
							<li><a href="../books/list2.jsp">국외도서</a></li>
						</ul>
					</li>
					<li><a href="list.jsp">게시판</a>
						<ul>
							<li><a href="list.jsp">공유게시판</a></li>
							<li><a href="../reviewboard/list.jsp">리뷰게시판</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</header>
		<div id="slideShow">
			<div id = "slides">
				<img src="../images/b1.jpg" alt="">
				<img src="../images/b2.jpg" alt="">
				<img src="../images/b3.jpg" alt="">
			</div>
		</div>
	<div id="contents">
	<h3>공유게시판 내용보기</h3>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select s_num, m_id, s_subject, s_content, s_writedate, s_readnum from shareboard where s_num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				s_num = rs.getInt("s_num");
				int s_readnum = rs.getInt("s_readnum");
				m_id = rs.getString("m_id");
				String s_writedate = rs.getString("s_writedate");
				String s_subject = rs.getString("s_subject");
				String s_content = rs.getString("s_content");
				
	%>
		<table border="1" width="600">
			<tr>
				<td>번호</td>
				<td><%=s_num %></td>
				<td>조회수</td>
				<td><%=s_readnum %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=m_id %></td>
				<td>작성일</td>
				<td><%=s_writedate %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><%=s_subject %></td>
			</tr>
			<tr>
				<td colspan="4" style="white-space:pre-Line"><%=s_content %></td>
			</tr>
		</table>
		<a href="edit.jsp?s_num=<%=s_num%>">수정</a>
		<a href="delete.jsp?s_num=<%=s_num%>">삭제</a>
		<a href="list.jsp">목록</a>
	<%
	
			}	
		}catch(SQLException ex){
			out.println(ex.getMessage());
		}finally{
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();
		}
		
	%>
		</div>
	<footer>    
	      <div id="bottomMenu">
	        <ul>
	          <li><a href="../etc/introduce.jsp">사이트 소개</a></li>
	          <li><a href="../etc/pi.jsp">개인정보취급방침</a></li>
	          <li><a href="../etc/terms.jsp">이용약관</a></li>
	          <li><a href="../etc/email.jsp">이메일 수집거부</a></li>
	        </ul>
	        <div id="sns">
	          <ul>
	            <li><a href="#"><img src="../images/sns-1.png"></a></li>
	            <li><a href="#"><img src="../images/sns-2.png"></a></li>
	            <li><a href="#"><img src="../images/sns-3.png"></a></li>
	          </ul>
	        </div>
	      </div>
	      <div id="company">
	        <p>경상남도 ***동 ***로 *** (Email) sang1532@naver.com</p> 
	      </div>     
   	 </footer>  
	</div>
</body>
</html>