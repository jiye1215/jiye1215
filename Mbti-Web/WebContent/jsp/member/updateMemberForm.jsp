<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.mlec.member.vo.MemberVO" %>
<%@ page import="kr.co.mlec.member.dao.MemberDAO" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>

<script>
function updateCheck() {

 if (confirm("���� �����Ͻðڽ��ϱ�??") == true){    //Ȯ��

     document.removefrm.submit();

 }else{   //���

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
<title>ȸ������ ����</title>

</head>
<body>
	<h1 class="cls1" style="color:#0F3900" align="center">ȸ�� ���� ����</h1>
	<form class="cls2" method="post" action="${contextPath}/member/updateMember.do"} align="center">
		<input type="hidden" name="id" value="${member.id}">
		<table class="t">
				<th>
					<p>���̵�</p>
				</th>
				<td><input type="text" name="id" value="${member.id}" disabled></td>
			</tr>
		
			<tr>
				<th>
					<p>��й�ȣ</p>
				</th>
				<td><input type="text" name="password" value="${member.password}"></td>
			</tr>
			
				

			<tr>
				<th>
					<p>�̸�</p>
				</th>
				<td><input type="text" name="addr" value="${member.addr}"></td>
			</tr>
			
			<tr>
				<th>
					<p>���� MBTI</p>
				</th>
				<td><input type="text" name="mymbti" value="${member.mymbti}"></td>
			</tr>
			
			<tr>
				<th>
					<p>�����ϴ� MBTI</p>
				</th>
				<td><input type="text" name="likembti" value="${member.likembti}"></td>
			</tr>
			
			<tr>
				<th>
					<p>�Ⱦ��ϴ� MBTI</p>
				</th>
				<td><input type="text" name="dislikembti" value="${member.dislikembti}"></td>
			</tr>
			
			<tr>
				<th>
					<p>����</p>
				</th>
				<td><input type="text" name="addrx" value="${member.addrx}"></td>
			</tr>
			
			<tr>
				<th>
					<p>�浵</p>
				</th>
				<td><input type="text" name="addry" value="${member.addry}"></td>
			</tr>
			</table>
			
			<tr align="center">
				<td></td>
				<td><input id="su" type="submit" value="�����ϱ�" onclick="updateCheck()"></td>
			</tr>
			
			<tr align="center">
			<td></td>
			<td><input id="su2" type="reset" value="�ٽ��Է�"></td>
			</tr>
		

	</form>
			
</body>
</html>