<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정페이지</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources//css/board.css">
<style>
@font-face {
     font-family: 'DungGeunMo';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

h2 {
margin-top:80px;
 font-family: 'DungGeunMo';
}
body {
background-image:url(${ pageContext.request.contextPath }/resources/images/bg_1.png);
background-color: #E5F3E5;

}

	table, th, td {
    border: 1px solid #BCE067;
    background-color: #E7F45C;
  	}
 	
 	td {
 	background-color: white;	
 }
  	table {
    width: 75%;
     height:500px;
 }
 

hr {
background: #598700;
height: 0.5px;
border: 0px;
/* width:1000px; */
margin-top: 30px;
}
</style>
<script>
	function doWrite() {
		
		let f = document.inputForm
		
		if(f.title.value == '') {
			alert('제목을 입력하세요')
			f.title.focus()
			return false
		}
		
		if(f.writer.value == '') {
			alert('글쓴이를 입력하세요')
			f.writer.focus()
			return false
		}
		
		if(f.content.value == '') {
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}
		
		return true
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topmenu.jsp" />
	</header>
	<section>
		<div align="center">
		<hr>
		<h2>게시글 수정</h2>
		<hr>
		<br>
		<form action="${ pageContext.request.contextPath }/board/update.do" method="post" 
			  name="inputForm" onsubmit="return doWrite()">
			 <input type="hidden" name="no" value="${ param.no }" />
			<table border="1">
				<tr>
					<th>번호</th>
					<td>${ board.no }</td>
				</tr>
				
				<tr>
					<th width="23%">제목</th>
					<td>
						<input type="text" name="title" value="<c:out value='${ board.title }'/>" >
					</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>
						${ userVO.id }
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="7" cols="60">${ board.content }</textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="수정">
		</form>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>


