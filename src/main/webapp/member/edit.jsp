<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../conf/dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="../boardStyle.css">
<script src="../autoslideshow.js"></script>
</head>
<body>
	<div id="container">
		<header>
			<div id="topheader">
				<div id="loginbox">
					<ul>
					<%
						String m_id = "";
						if(session.getAttribute("m_id")!= null){
							m_id=(String)session.getAttribute("m_id");
						}
						if(m_id.equals("admin")){
					%>
						
						<li id="login-menu"><%=m_id %>님 환영합니다. &nbsp;
						<a href="../login/logout.jsp">로그아웃 |&nbsp;</a>
						<a href="../admin/list.jsp" target="_top">회원목록보기</a>
						</li>
						
					<%
						}
						else if(!m_id.equals("")){
					%>
						<li id="login-menu"><%=m_id %>님 환영합니다. &nbsp;
							<a href="../login/logout.jsp">로그아웃 |&nbsp;</a>
							<a href="edit.jsp" target="_top">회원정보수정 |&nbsp;</a>
							<a href="delete.jsp" target="_top">회원탈퇴</a>
						</li>
							
					<%	
						}
					else{
					%>
					<li id="login-menu">
						<a href="../login/login.jsp">로그인 |&nbsp; </a>
					</li>
					<li id="login-menu">
						<a href="regist.jsp"> 회원가입 </a>
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
				m_id = (String)session.getAttribute("m_id"); 
			
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String sql = "select * from member where m_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,m_id);
					rs = pstmt.executeQuery();
					
					if(rs.next()){
						String m_name = rs.getString("m_name");
						String m_email = rs.getString("m_email");
						String m_tel = rs.getString("m_tel");
						String m_gender = rs.getString("m_gender");
						String m_hobby = rs.getString("m_hobby");
						String m_profile = rs.getString("m_profile");
			%>
						<h3>회원정보수정</h3>
						<form action="edit_ok.jsp" name="member" method="post">
							<p>	아이디 : <%=m_id %>
							<p>	비밀번호 : <input type="password" name="m_passwd">
							<p>	이름 : <input type="text" name="m_name" value="<%=m_name %>">
							<p> 이메일 : <input type="text" name="m_email" value="<%=m_email %>">
							<p>	연락처 : <select name="m_tel1">
									<option value="010" <% if(m_tel.substring(0,3).equals("010")){%> selected <%}%>>010</option>
									<option value="011" <% if(m_tel.substring(0,3).equals("011")){%> selected <%}%>>011</option>
									<option value="016" <% if(m_tel.substring(0,3).equals("016")){%> selected <%}%>>016</option>
									<option value="017" <% if(m_tel.substring(0,3).equals("017")){%> selected <%}%>>017</option>
									<option value="018" <% if(m_tel.substring(0,3).equals("018")){%> selected <%}%>>017</option>
									<option value="019" <% if(m_tel.substring(0,3).equals("019")){%> selected <%}%>>019</option>
								</select> - <input type="text" maxlength="4" size="4" name="m_tel2" value="<%=m_tel.substring(4,8)%>"> -
								<input type="text" maxlength="4" size="4" name="m_tel3" value="<%=m_tel.substring(4,8)%>">
							<p>	성별 : <input type="radio" name="m_gender" value="남성" <% if(m_gender.equals("남성")){%> checked <%}%>>남성 
									<input	type="radio" name="m_gender" value="여성" <% if(m_gender.equals("여성")){%> checked <%}%>>여성
							<p>	취미 : 독서<input type="checkbox" name="m_hobby" value="독서" <% if(m_hobby.contains("독서")){%> checked <%}%>>     
									운동<input type="checkbox" name="m_hobby" value="운동" <% if(m_hobby.contains("운동")){%> checked <%}%>>
									영화<input type="checkbox" name="m_hobby" value="영화" <% if(m_hobby.contains("영화")){%> checked <%}%>>
							<p>	<textarea name="m_profile" cols="30" rows="3"><%=m_profile %></textarea>
							<p>	<input type="submit" value="수정하기"> 
								<input type="reset"  value="다시쓰기">
						</form>
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