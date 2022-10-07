<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 추천 사이트</title>
<link rel="stylesheet" href="indexStyle.css">
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
						<a href="login/logout.jsp">로그아웃 |&nbsp;</a>
						<a href="member/edit.jsp" target="_top">회원정보수정 |&nbsp;</a>
						<a href="admin/list.jsp" target="_top">회원목록보기</a>
						</li>
						
					<%
						}
						else if(!m_id.equals("")){
					%>
						<li id="login-menu"><%=m_id %>님 환영합니다. &nbsp;
							<a href="login/logout.jsp">로그아웃 |&nbsp;</a>
							<a href="member/edit.jsp" target="_top">회원정보수정 |&nbsp;</a>
							<a href="member/delete.jsp" target="_top">회원탈퇴</a>
						</li>
							
					<%	
						}
					else{
					%>
					<li id="login-menu">
						<a href="login/login.jsp">로그인 |&nbsp; </a>
					</li>
					<li id="login-menu">
						<a href="member/regist.jsp"> 회원가입 </a>
					</li>
					</ul>
					<%	
						}
					%>	
				</div>			
			</div>
			<div id="logo">
				<a href="index.jsp">
					<h1>Book of us</h1>
				</a>
			</div>
			<nav>
				<ul id="topMenu">
					<li><a href="etc/introduce.jsp">사이트 소개</a>
						<ul>
							<li><a href="etc/introduce.jsp">Book of Us</a></li>
						</ul>
					</li>
					<li><a href="notice/list.jsp">알림마당</a>
						<ul>
							<li><a href="notice/list.jsp">공지사항</a></li>
						</ul>
					</li>
					<li><a href="books/list_all.jsp">추천도서</a>
						<ul>
							<li><a href="books/list.jsp">국내도서</a></li>
							<li><a href="books/list2.jsp">국외도서</a></li>
						</ul>
					</li>
					<li><a href="shareboard/list.jsp">게시판</a>
						<ul>
							<li><a href="shareboard/list.jsp">공유게시판</a></li>
							<li><a href="reviewboard/list.jsp">리뷰게시판</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</header>
		<div id="slideShow">
			<div id = "slides">
				<img src="images/b1.jpg" alt="">
				<img src="images/b2.jpg" alt="">
				<img src="images/b3.jpg" alt="">
			</div>
		</div>
		<div id="contents">
			<div id="tabMenu">
				<section>
					<iframe src="notice/notice.jsp" width="600" height="200" frameborder="0"></iframe>
				</section>
			</div>
			<div id="links">
				<ul>
					<li>
						<a href="etc/etc1.jsp">
							<span id="quick-icno1"><img src="images/etc1.jpg"></span>
							<p>좋은 독서습관</p>
						</a>
					</li>
					<li>
						<a href="etc/etc2.jsp">
							<span><img src="images/etc2.jpg"></span>
							<p>올바른 책읽기자세</p>
						</a>
					</li>
					<li>
						<a href="etc/etc3.jsp">
							<span><img src="images/etc3.jpg"></span>
							<p>독서하는 목적</p>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<footer>    
	      <div id="bottomMenu">
	        <ul>
	          <li><a href="etc/introduce.jsp">사이트 소개</a></li>
	          <li><a href="etc/pi.jsp">개인정보취급방침</a></li>
	          <li><a href="etc/terms.jsp">이용약관</a></li>
	          <li><a href="etc/email.jsp">이메일 수집거부</a></li>
	        </ul>
	        <div id="sns">
	          <ul>
	            <li><a href="#"><img src="images/sns-1.png"></a></li>
	            <li><a href="#"><img src="images/sns-2.png"></a></li>
	            <li><a href="#"><img src="images/sns-3.png"></a></li>
	          </ul>
	        </div>
	      </div>
	      <div id="company">
	        <p>경상남도 ***동 ***로 *** (Email) sang1532@naver.com</p> 
	      </div>     
    	</footer>  
	</div>
	<script src="autoslideshow.js"></script>
</body>
</html>