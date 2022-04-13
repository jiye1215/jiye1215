<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources//css/board.css">
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
		$('#new').click(function() {
			location.href = "${ pageContext.request.contextPath }/board/writeForm.do"
		})
		
	})
   
   
   function doAction(boardNo){
	   <c:choose>
	   		<c:when test="${ not empty userVO }"> //updateCnt먼저 갔다가 아래 주소로 가게 추가
	   			location.href = "${ pageContext.request.contextPath }/board/detail.do?no=" + boardNo
	   					
			</c:when>
	   		<c:otherwise>
	   			if(confirm('로그인 서비스가 필요합니다\n로그인페이지로 이동하시겠습니까?')){
	   				location.href = '${ pageContext.request.contextPath }/login.do'
	   			}	
	   		</c:otherwise>
   	   </c:choose>
   }
</script>
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
background-color: #FDFFDF; 
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
    font-family: 'DungGeunMo';
    height:500px;
 }
hr {
background: #C4B747;
height: 0.5px;
border: 0px;
/* width:1000px; */
margin-top: 30px;
}

.aside_menu {
margin-right: 320px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topmenu.jsp" />
	</header>
	<section>
		<div align="center">
		<c:url var="action" value="/board/searchBoard.do" />
			<hr>
			<h2>검색 결과</h2>
			
			<br>
			<table border="1" class="list">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">작성자</th>
					<th width="10%">조회수</th>
					<th width="20%">등록일</th>
				</tr>
				
			<c:forEach items="${ sbList }" var="board">
			<tr>
						<td>${ board.no }</td>
						<td><a href="javascript:doAction(${ board.no })"> 
						<c:out value="${ board.title }" />
						</a></td>
						<td>${ board.writer }</td>
						<td>${ board.viewCnt }</td>
						<td>${ board.regDate }</td>
					</tr>
			</c:forEach>
			</table>
			<jsp:include page="/jsp/board/searchPaging.jsp">
				<jsp:param value="${paging2.page}" name="page" />
				<jsp:param value="${paging2.beginPage}" name="beginPage" />
				<jsp:param value="${paging2.endPage}" name="endPage" />
				<jsp:param value="${paging2.prev}" name="prev" />
				<jsp:param value="${paging2.next}" name="next" />
			</jsp:include>
			<br>
			<br>
			<c:if test="${ not empty userVO }">
				<button id= "new">새글등록</button>
			</c:if>
			<br>
			<br>
		</div>
		<div class='aside_menu'>
			<form method="get" name="search" action="${ pageContext.request.contextPath }/board/searchBoard.do">
				<ASIDE style='float: right;'>
					<SELECT name='choice'>
						<!-- 검색 컬럼 -->
						<OPTION ${(param.choice == "writer")? "selected" : ""} value='writer'>작성자</OPTION>
						<OPTION ${(param.choice == "title")? "selected" : ""} value='title'>제목</OPTION>
						<OPTION ${(param.choice == "content")? "selected" : ""} value='content'>내용</OPTION>
						<OPTION ${(param.choice == "titleNcontent")? "selected" : ""} value='titleNcontent'>제목+내용</OPTION>
					</SELECT> <input type='text' name='word' value="${param.word }" 
						placeholder="특수문자는 사용하실 수 없습니다.">
					<button id='search' type='submit'>검색</button>
				</ASIDE>
			</FORM>
			<DIV class='menu_line' style='clear: both'></DIV>
		</div>
	</section>
	<br>
	<br>
	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>