<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conf/dbconn.jsp" %>
<%@ include file="../conf/admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 수정</title>
<link rel="stylesheet" href="booksStyle.css">
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
							<li><a href="../etc/introduce.jsp">사이트란?</a></li>
						</ul>
					</li>
					<li><a href="../notice/list.jsp">알림마당</a>
						<ul>
							<li><a href="../notice/list.jsp">공지사항</a></li>
						</ul>
					</li>
					<li><a href="list_all.jsp">추천도서</a>
						<ul>
							<li><a href="list.jsp">국내도서</a></li>
							<li><a href="list2.jsp">국외도서</a></li>
						</ul>
					</li>
					<li><a href="../shareboard/list.jsp">게시판</a>
						<ul>
							<li><a href="../shareboard/list.jsp">공유게시판</a></li>
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
	<%
		request.setCharacterEncoding("UTF-8");
		
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "select m_id, b_subject, b_separate, b_author, b_publisher, b_categori, b_content, b_page, b_writedate from books where b_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String b_id = rs.getString("m_id");
				String b_subject = rs.getString("b_subject");
				String b_separate = rs.getString("b_separate");
				String b_author = rs.getString("b_author");
				String b_publisher = rs.getString("b_publisher");
				String b_categori = rs.getString("b_categori");
				String b_content = rs.getString("b_content");
				String b_writedate = rs.getString("b_writedate");
				String b_page = rs.getString("b_page");
			
			
	%>
	<h3>도서 수정</h3>
	<form action="edit_ok.jsp" method="post" name="notice">
		<input type="hidden" name="b_num" value="<%=b_num%>">
		<table border="1" width="600">
			<tr>
				<td>작성자</td>			
				<td><%=b_id %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="b_passwd"></td>
			</tr>
			<tr>
				<td>도서 제목</td>
				<td><input type="text" name="b_subject" value="<%=b_subject %>"></td>
			</tr>
			<tr>
				<td>분야</td>
				<td><input type="text" name="b_separate" value="<%=b_separate %>"></td>
			</tr>
			<tr>
				<td>저자/역자</td>
				<td><input type="text" name="b_author" value="<%=b_author %>"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="b_publisher" value="<%=b_publisher %>"></td>
			</tr>
			<tr>
				<td>분류(국내,국외)</td>
				<td><input type="text" name="b_categori" value="<%=b_categori %>"></td>
			</tr>
			<tr>
				<td>도서소개</td>
				<td><textarea name="b_content" rows="5" cols="50"><%=b_content %></textarea></td>
			</tr>
			<tr>
				<td>출판일</td>
				<td><input type="date" name="b_writedate" value="<%=b_writedate %>"></td>
			</tr>
			<tr>
				<td>총 페이지</td>
				<td><input type="text" name="b_page" value="<%=b_page %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성">
					<input type="button" value="작성취소" onclick=history.back()>
				</td>
			</tr>
		</table>
	</form>
	
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