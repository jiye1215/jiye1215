<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.mlec.board.dao.BoardDAO" %>
<%@page import="kr.co.mlec.board.vo.BoardVO"%>
<%@page import="kr.co.mlec.util.JDBCClose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="kr.co.mlec.util.ConnectionFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function delCheck() {

 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

     document.removefrm.submit();

 }else{   //취소

     return false;

 }

}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberList.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/topmenu.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<title>관리자페이지</title>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<style>
#logo {
   display: block;
   margin: 0px auto; 

/*    margin-left:300px; */
   margin-top:40px;
/*    margin-bottom:-100px; */
}      
table{
width : 80%;
}
@font-face {
     font-family: 'DungGeunMo';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
 body {
       font-family: 'DungGeunMo';
       background-image: url(${ pageContext.request.contextPath }/resources/images/bg_1.png);
 }
 
 .ds {
 width:100%;
 height:500px;
 }

</style>
</head>
 
<body>
 <br><br>
 <div>
   <a href="${ pageContext.request.contextPath }/index.jsp">
  <img id="logo" src= "${ pageContext.request.contextPath }/resources/images/logo3.png" alt=""/>
  </a>
</div>
<div class="title" align="center">관리자 페이지</div>

<div class="list" align="center">
   <h2>전체 회원 목록</h2>
   <table>
      <tr>
         <th>NO</th>
         <th>ID</th>
         
         <th>NAME</th>
         
         <th>TYPE</th>
         <th>DATE</th>
         <th>MY_MBTI</th>
         <th>LIKE_MBTI</th>
         <th>DISLIKE_MBTI</th>
         <th>ADDR_X</th>
         <th>ADDR_Y</th>
         <th>수정</th>
         <th>삭제</th>

      </tr>
      
      <c:choose>
         <c:when test="${empty list }">
            <tr>
               <td colspan="12">
                  <b>등록된 회원이 없습니다.</b>
               </td>
            </tr>
         </c:when>
      
          <c:when test="${!empty list}"> 
             <c:forEach var="member" items="${list}"> 
               <tr>
                  <td>${ member.no }</td>
                  <td>${ member.id }</td>
                  
                  <td>${ member.name }</td>
                 
                  <td>${ member.type }</td>
                  <td>${ member.regDate }</td>
                  <td>${ member.mymbti }</td>
                  <td>${ member.likembti }</td>
                  <td>${ member.dislikembti }</td>
                  <td>${ member.addrx }</td>
                  <td>${ member.addry }</td>   
                  <td>
                  <a href="${ pageContext.request.contextPath }/member/updateMemberForm.do?id=${member.id}">
                  <input id="update" type="submit" value="수정">
                  </a></td>
                  <td>
                  <a href="${ pageContext.request.contextPath }/member/delMember.do?id=${member.id}">
                  <input id="del" type="submit" value="삭제" onclick="delCheck()">
                  </a></td>               
               </tr>
             </c:forEach> 
          </c:when> 
      </c:choose>
   </table>
   <br><br>
   <br><br>   
</div>
<div class="ds">

</div>
<footer>
   <jsp:include page="/jsp/include/footer.jsp" />
</footer>
</body>
</html>