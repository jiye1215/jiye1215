<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록페이지</title>
<link rel="stylesheet" href="/Mission-Web/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/css/board.css">

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

.re {
width:100%;
height: 300px;
}

/* input { */
/* margin-bottom: 100px; */
/* } */

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
	<div align="center">
		<hr>
		<h2>새글 등록</h2>
		
		<br>
		<form action="${ pageContext.request.contextPath }/board/write.do" method="post" name="inputForm" onsubmit="return doWrite()" enctype="multipart/form-data">
			<input type="hidden" name="writer" value="${ userVO.id }">
				<table border="1" bordercolor="#598700">
				<tr>
					<th width="23%">제목</th>
					<td>
						<textarea name="title" rows="3" cols="200"></textarea>
					</td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td>
						${ userVO.id }
						<!-- <input type="text" name="writer"> -->
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="30" cols="200"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="attachfile1"><br>
						<input type="file" name="attachfile2"><br>
					</td>
				</tr>
			</table>
			<br>
			<input  type="submit" value="새글등록">
			<br>
		</form>
	</div>
	<div class="re">
	
	</div>

</body>
<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</html>