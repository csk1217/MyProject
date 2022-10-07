<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../boardStyle.css">
<script src="../registCheck.js"></script>
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
						<a href="edit.jsp" target="_top">회원정보수정 |&nbsp;</a>
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
					<form action="regist_ok.jsp" name="member" method="post">
						<table border="0">
							<tr>
								<td>아이디 * </td>
								<td><input type="text" name="m_id"><input type="button" value="아이디 중복검사" onclick="newwin()">
								<p>아이디는 6~18자의 영문 소문자와 숫자로 입력해주세요.</p></td>
							</tr>
							<tr>
								<td>비밀번호 * </td>
								<td><input type="password" name="m_passwd">
								<p>비밀번호는  6~18자의 영문 대소문자와 숫자를 포함하여 입력하세요.</p></td>
							</tr>
							<tr>
								<td>비밀번호 확인 * </td>
								<td><input type="password" name="m_passwd2"></td>
							</tr>
							<tr>
								<td>이름 * </td>
								<td><input type="text" name="m_name"></td>
							</tr>
							<tr>
								<td>이메일 * </td>
								<td><input type="text" name="m_email"></td>
							</tr>
							<tr>
								<td>연락처 </td>
								<td>
									<select name="m_tel1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">017</option>
									<option value="019">019</option>
									</select> - <input type="text" maxlength="4" size="4" name="m_tel2"> -
									<input type="text" maxlength="4" size="4" name="m_tel3">
								</td>
							</tr>
							<tr>
								<td>성별 </td>
								<td><input type="radio" name="m_gender" value="남성" checked>남성 
									<input	type="radio" name="m_gender" value="여성" >여성
								</td>
							</tr>
							<tr>
								<td>취미 </td>
								<td>
									독서<input type="checkbox" name="m_hobby" value="독서" checked>
									운동<input type="checkbox" name="m_hobby" value="운동" > 
									영화<input type="checkbox" name="m_hobby" value="영화" >
								</td>
							</tr>
							<tr>
								<td>가입인사 </td>
								<td><textarea name="m_profile" cols="30" rows="3" placeholder="가입인사를 입력해주세요"></textarea></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" value="가입하기" onclick=registCheck();>									
									<input type="button" value="가입취소" onclick=history.back();>
								</td>
							</tr>
							
						</table>	
					</form>
				
			</fieldset>
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
	<script src="../autoslideshow.js"></script>
</body>
</html>