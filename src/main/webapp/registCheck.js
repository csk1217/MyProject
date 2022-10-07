function newwin(){
		window.open("idcheck.jsp","_blank","width=500,height=200,left=0,top=0");
	}

function registCheck() {
	var m_id = document.member.m_id;
	var m_passwd = document.member.m_passwd;
	var m_passwd2 = document.member.m_passwd2;
	var m_name = document.member.m_name;
	var m_email = document.member.m_email;
		 
	var idTest = /^[a-z0-9]{6,18}$/;
	var passwdTest = /^[a-zA-Z0-9]{6,18}$/;
	var nameTest = /^[가-힣]{2,30}$/;
	
	if(m_id.value == ""){
		alert("아이디를 입력해주세요.")
		m_id.focus();
		return false;
	}
	
	if(!idTest.test(m_id.value)){
		alert("아이디는 6~18자의 영문 소문자와 숫자로 입력해주세요");
		m_id.focus();
		return false;
	}
	
	if(m_passwd.value == ""){
		alert("비밀번호를 입력해주세요.")
		m_passwd.focus();
		return false;
	}
	if(!passwdTest.test(m_passwd.value)){
		alert("비밀번호는  6~18자의 영문 대소문자와 숫자를 포함하여 입력하세요.");
		m_passwd.focus();
		return false;
	}
	if(m_id.value == m_passwd.value){
		alert("아이디와 비밀번호는 같을 수 없습니다.")
		m_passwd.focus();
		return false;
	}
	
	if(m_passwd2.value == ""){
		alert("비밀번호를 확인하세요.")
		m_passwd2.focus();
		return false;
	}
	
	if(m_passwd.value != m_passwd2.value){
		alert("비밀번호가 맞지 않습니다.");
		m_passwd.value = "";
		m_passwd2.value = "";
		m_passwd.focus();
		return false;
		
	}
	
	if(m_name.value == ""){
		alert("이름을 입력해 주세요.");
		m_name.focus();
		return false;
	}
	
	if(!nameTest.test(m_name.value)){
		alert("2글자 이상의 한글성명을 입력하세요");
		m_name.focus();
		return false;
	}
	
	if(m_email.value == ""){
		alert("이메일을 입력해 주세요.");
		m_email.focus();
		return false;
	}
	
	document.member.submit();
}
  
var current = 0; 
showSlides();  

function showSlides() {
  var slides = document.querySelectorAll("#slides > img");  
  for (let i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  current++; 
  if(current > slides.length)  
    current = 1;   
  slides[current - 1 ].style.display = "block";  
  setTimeout(showSlides, 8000); 
} 