<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
<style>
   hr{
      width: 100%;
   }
   #logo {
   display: block;
   margin: 0px auto; 

/*    margin-left:300px; */
   margin-top:40px;
/*    margin-bottom:-100px; */
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

h1 {
margin-top: 100px;
}
 .aa {
 width:100%;
 height:500px;
 }
</style>
<script src="${ pageContext.request.contextPath }/resources/js/myJS.js"></script>
<script>
   function checkForm(){
      let f = document.loginForm;
      if(isNull(f.id, '아이디를 입력하세요'))
         return false
      if(isNull(f.password, '패스워드를 입력하세요'))
         return false
      return true
   }
</script>
</head>
 
<body onLoad="loginForm.id.focus()">
<div>
   <a href="${ pageContext.request.contextPath }/index.jsp">
  <img id="logo" src= "${ pageContext.request.contextPath }/resources/images/logo3.png" alt=""/>
  </a>
</div>
<br>
	<hr>
      <h1 align="center">로그인</h1>
   <br>
    <div  align="center">
   <br /><br />
      <form name="loginForm" method="post" action="${ pageContext.request.contextPath }/loginProcess.do" onsubmit="return checkForm()">
         <table>
         <tr>
               <td>아이디</td>
               <td><input type="text" name="id"></td>
         </tr>
            <tr>
               <td>패스워드</td>
               <td><input type="password" name="password"></td>
            </tr>
            </table>
         <br>
         <input type="submit" value="로그인" >
            </form>
      </div>
   <br><br>
   <br><br>
   <div class="aa">
   
   </div>
   <footer>
      <%@ include file="/jsp/include/footer.jsp" %> <!-- xml,include,forward의 /는 Mission-Web까지 말함 -->
   </footer>
</body>
</html>