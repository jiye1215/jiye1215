<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/topmenu.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<title>MBTI FRIENDS</title>
<style>
/* body {overflow-x:hidden; */
/* overflow-y:auto; */
/* } */

</style>
</head>
   <header>
      <jsp:include page="/jsp/include/topmenu.jsp" />
   </header>

<body>
   <div id="banner01" >
   <a href="${pageContext.request.contextPath }/map.do"><img id="001" src="resources/images/main_01.png"
       style="max-width:100%; height:auto;"alt="배너1"></a>
   </div>
   
   <div id="banner02">
   <a href="${ pageContext.request.contextPath }/board/list.do"><img id="002" src="resources/images/main_02.png"
       style="max-width:100%; height:auto;"alt="배너2"></a>
   </div>
   
   <div id="banner03">
      <a href="https://www.16personalities.com/"><img id="003" src="resources/images/main_03.png"
          style="max-width:100%; height:auto;"alt="배너3"></a>
      </div>
   
   <div id="banner04">
      <a><img id="004" src="resources/images/main_04.png"
          style="max-width:100%; height:auto;"alt="배너4"></a>
      </div>
<footer>
   <jsp:include page="/jsp/include/footer.jsp" />
</footer>
   
</body>
</html>