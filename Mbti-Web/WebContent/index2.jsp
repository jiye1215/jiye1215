<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<title>MBTI FRIENDS</title>
</head>
<style type="text/css">
body { 
    cursor: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg'  width='40' height='48' viewport='0 0 100 100' style='fill:black;font-size:24px;'><text y='50%'>💗</text></svg>") 16 0, auto;
}   
   @font-face {
     font-family: 'DungGeunMo';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
   .myButton {
      box-shadow:inset 0px 1px 0px 0px #efdcfb;   
      background-color: #FF3636;
      border-radius:6px;
      border:1px solid #FF3636;
      display:inline-block;
      cursor:pointer;
      color:#ffffff;
      font-family:Arial;
      font-size:15px;
      font-weight:bold;
      padding:10px 38px;
      margin-top: 450px;
      margin-left: 550px;
      text-decoration:none;
      text-shadow:0px 1px 0px #C90000;
      font-family: 'DungGeunMo';
      cursor: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg'  width='40' height='48' viewport='0 0 100 100' style='fill:black;font-size:24px;'><text y='50%'>💗</text></svg>") 16 0, auto;
   }
   
   
   .myButton:hover {
      background: #C90000;
      background-color: #C90000;
   }
   .myButton:active {
      position:relative;
      top:1px;
   }
   
   .main {
/*        width:100%; */
/*        height:100%; */
      background-image: url("resources/images/index2.png");
      background-repeat: no-repeat;
      background-size: 100%;
      background-color: #E6F45D;
      
      
</style>

<body class="main">
   <a href="${ pageContext.request.contextPath }/index.jsp" class="myButton" >입장하기</a>
</body>
</html>