<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function check(){
		if(search.method.value==""){
			alert("검색방법을 선택해주세요.");
			return false;
		}
		search.submit();
	}
</script>
<form action="search_ok.jsp" method="get" name="search">
	<select name="method">
		<option value="">선택하세요.</option>
		<option value="b_subject">제목</option>
		<option value="b_content">내용</option>
		<option value="b_author">저자/역자</option>
	</select>
	<input type="text" name="keyword">
	<input type="button" value="검색" onclick=check()>
</form>