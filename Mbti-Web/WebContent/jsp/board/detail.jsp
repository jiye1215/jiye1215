<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO"%>
<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.mlec.util.ConnectionFactory"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>
<link rel = "stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel = "stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">

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

   function commentAction(type, cNo) {
      
      switch (type) {
      case 'D':
         if (confirm("정말 삭제하시겠습니까?")) {
            location.href = "${ pageContext.request.contextPath }/board/commentDelete.do?&no=${ param.no }&commentNo="+cNo;
         }
         return false;
      }
   }
   
   function doAction(type) {

      switch (type) {
      case 'U':
         if (confirm("수정하시겠습니까?")) {
            location.href = "${ pageContext.request.contextPath }/board/updateForm.do?no=${ param.no }"
         }
         return false;
         break;

      case 'D':
         if (confirm("정말 삭제하시겠습니까?")) {
            location.href = "${pageContext.request.contextPath}/board/delete.do?no=${ param.no }"
         }
         return false;
         break;

      case 'L':
         location.href = "${ pageContext.request.contextPath }/board/list.do"
         break;

      case 'R':
         location.href = "${ pageContext.request.contextPath }/board/replyForm.do?no=${ param.no }"
         break;
      }
   }
</script>
</head>
<body>
   <header>
      <jsp:include page="/jsp/include/topmenu.jsp" />
   </header>
   <section>
      <div align= "center">
      <hr>
      <h2>게시판 상세</h2>

      <br>
      <table border="1">
         <tr>
            <th width="25%">번호</th>
            <td>${ board.no }</td>
         </tr>
         <tr>
            <th width="25%">제목</th>
            <td>${ board.title }</td>
         </tr>
         <tr>
            <th width="25%">작성자</th>
            <td>${ board.writer }</td>
         </tr>
         <tr>
            <th width="25%">내용</th>
           <td> <pre><c:out value="${ board.content }" /></pre>
            </td>
         </tr>
         <tr>
            <th width="25%">조회수</th>
            <td>${ board.viewCnt + 1 }</td>
         </tr>
         <tr>
            <th width="25%">등록일</th>
            <td>${ board.regDate }</td>
         </tr>
         <tr>
            <th width="25%">첨부파일</th>
            <td>
               <c:forEach items="${ fileList }" var="file">
                  <a href="${ pageContext.request.contextPath }/upload/${ file.fileSaveName }">
                     ${ file.fileOriName }
                  </a>
                     (${ file.fileSize } bytes)<br>
               </c:forEach>
            </td>
         </tr>
      </table>
      <br>
      <c:if test = "${ board.writer eq userVO.id }">
         <button onclick="doAction('U')">수정</button>
         <button onclick="doAction('D')">삭제</button>   
      </c:if>
      <button onclick="doAction('L')">목록</button>
      <button onclick="doAction('R')">답글</button>
      <a href="javascript:history.back()" class="btn btn-primary">
      <button>뒤로가기</button></a>
      <br>
       <br>
      
         <table>
            <tr><th colspan="4">댓글</th></tr>
       
         <c:forEach var="comment" items="${ commentList }">
      
            <tr>
                <td width="200">
                    <div>${ comment.commentId } <br>
            <font size="2" color="lightgray">${ comment.commentDate }</font>
            </div>
            <td width="550">
                    <div class="text_wrapper">${ comment.commentContent }</div>
                </td>
               <td width="100">
               <div id="btn" style="text-align:center;">
                         
                  <c:if test = "${ comment.commentId eq userVO.id }">
                         
                          <button onclick="commentAction('D',${ comment.commentNo })">삭제</button>
                  </c:if>
            </div>
               </td>
            </c:forEach>
              
               <br>
         
         
         <form method="post" action="${ pageContext.request.contextPath }/board/commentWrite.do" >
         <input type="hidden" name="comment_level" value="${ comment.commentLevel }">
         <input type="hidden" name="comment_ref" value="${ comment.commentRef }">
         <input type="hidden" name="comment_no" value="${ comment.commentNo }">
         <input type="hidden" name="no" value="${ board.no }">
         
           
            <tr>
               <td><input type="hidden" name="comment_id" value="${ userVO.id }" >${ userVO.id }</td>
               <td colspan="3"><textarea rows="5" cols="140" name="comment_content"></textarea>
               <input type="submit" value="댓글 작성" ></td>
            </tr>
         </form>
      
         </table>
   </div>   
   </section>    
   <footer>
      <%@ include file="/jsp/include/footer.jsp" %>
   </footer>   
</body>
</html>

