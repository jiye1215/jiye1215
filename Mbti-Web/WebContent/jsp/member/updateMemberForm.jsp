<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.mlec.member.vo.MemberVO" %>
<%@ page import="kr.co.mlec.member.dao.MemberDAO" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<script>
function updateCheck() {

 if (confirm("정말 수정하시겠습니까??") == true){    //확인

     document.removefrm.submit();

 }else{   //취소

     return false;

 }

}
</script>
<style>
.t {
    margin:auto; 
}

</style>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/updateList.css">
<title>회원정보 수정</title>

</head>
<body>
	<h1 class="cls1" style="color:#0F3900" align="center">회원 정보 수정</h1>
	<form class="cls2" method="post" action="${contextPath}/member/updateMember.do"} align="center">
		<input type="hidden" name="id" value="${member.id}">
		<table class="t">
				<th>
					<p>아이디</p>
				</th>
				<td><input type="text" name="id" value="${member.id}" disabled></td>
			</tr>
		
			<tr>
				<th>
					<p>비밀번호</p>
				</th>
				<td><input type="text" name="password" value="${member.password}"></td>
			</tr>
			
				

			<tr>
				<th>
					<p>이름</p>
				</th>
				<td><input type="text" name="addr" value="${member.addr}"></td>
			</tr>
			
			<tr>
				<th>
					<p>나의 MBTI</p>
				</th>
				<td><input type="text" name="mymbti" value="${member.mymbti}"></td>
			</tr>
			
			<tr>
				<th>
					<p>좋아하는 MBTI</p>
				</th>
				<td><input type="text" name="likembti" value="${member.likembti}"></td>
			</tr>
			
			<tr>
				<th>
					<p>싫어하는 MBTI</p>
				</th>
				<td><input type="text" name="dislikembti" value="${member.dislikembti}"></td>
			</tr>
			
			<tr>
				<th>
					<p>위도</p>
				</th>
				<td><input type="text" name="addrx" value="${member.addrx}"></td>
			</tr>
			
			<tr>
				<th>
					<p>경도</p>
				</th>
				<td><input type="text" name="addry" value="${member.addry}"></td>
			</tr>
			</table>
			
			<tr align="center">
				<td></td>
				<td><input id="su" type="submit" value="수정하기" onclick="updateCheck()"></td>
			</tr>
			
			<tr align="center">
			<td></td>
			<td><input id="su2" type="reset" value="다시입력"></td>
			</tr>
		

	</form>
			
</body>
</html>