<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

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

table{
width:50%;
}
td {

}
</style>


<script>
//빈칸 체크
function inputCheck(){
   if(document.regFrm.id.value ==''){
      alert("아이디를 입력해 주세요")
      document.regFrm.id.focus()
      return false
   }
   if(document.regFrm.pwd.value == ''){
      alert("비밀번호를 입력해 주세요")
      document.regFrm.pwd.focus()
      return false
   }
   if(document.regFrm.repwd.value == ''){
      alert("비밀번호를 확인해 주세요")
      document.regFrm.repwd.focus()
      return false
   }
   if(document.regFrm.pwd.value != document.regFrm.repwd.value){
      alert("비밀번호가 일치하지 않습니다")
      document.regFrm.repwd.value=""
      document.regFrm.repwd.focus()
      return false
   }
   if(document.regFrm.name.value == ''){
      alert("이름을 입력해 주세요")
      document.regFrm.name.focus()
      return false
   }
   return true;
   
   

   //document.regFrm.submit();
}
   
   
</script>
<script>

   //id중복체크
      function idCheck(id) {
      frm = document.reFrm;
      if(id == "") {
         alert("아이디를 입력해 주세요");
         frm.id.focus();
         return;
      }
      url = "/Mbti-Web/jsp/signup/idCheck.jsp?id=" + id;
      
      window.open(url, "IDCheck", "width=300, height=150");
   } 
</script>
<script>
function insert_btn() {
   frm = document.reFrm;
   if(frm == ''){
      alert("회원가입에 실패하였습니다");
      return false;
   } else {
      alert("회원가입이 완료되었습니다");
      
   }
}

</script>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
</head>
<body onLoad="regFrm.id.focus()">

<div>
   <a href="${ pageContext.request.contextPath }/index.jsp">
  <img id="logo" src= "${ pageContext.request.contextPath }/resources/images/logo3.png" alt=""/>
  </a>
</div>
 <br>
 <hr>
   <h1 align="center">회원가입</h1>
   <br><br>
   
   
   <div align="center">
   <br /><br />
   <form action="${pageContext.request.contextPath }/SignupProcess.do" method="post" name="regFrm" onsubmit="return inputCheck()" >
    <table >
            <tr>
               <td align="center" valign="middle">
                  <table border="0" cellpadding="2" align="center"
                     width=30%>
                 
                     <tr>
                        <td>아이디 :</td>
                        <td><input name="id" size="20" placeholder="아이디를 입력해주세요">
                        <input type="button" value="ID중복확인"
                           onClick="idCheck(this.form.id.value)"></td>
                      
                     </tr>
                     <tr>
                        <td>패스워드 :</td>
                        <td><input type="password" name="pwd" size="20"  placeholder="패스워드를 입력해주세요"></td>
                     </tr>
                     <tr>
                        <td>패스워드 확인 :</td>
                        <td><input type="password" name="repwd" size="20" placeholder="패스워드를 한번 더 입력해주세요"></td>
                     </tr>
                     <tr>
                        <td>이름 :</td>
                        <td><input name="name" size="20"  placeholder="이름을 입력해주세요"></td>
                     </tr>
                     
                     <tr>
                     <td>
                     
                     내 MBTI : 
                        </td>
                        <td>
                        <select name="mymbti" size=1 required="required">
                        <option value="">뭐예요?</option>
                        <option value="ESTJ">ESTJ</option> 
                        <option value="ESTP">ESTP</option> 
                        <option value="ESFP">ESFP</option> 
                        <option value="ESFJ">ESFJ</option> 
                        <option value="ENTP">ENTP</option> 
                        <option value="ENFP">ENFP</option> 
                        <option value="ENFJ">ENFJ</option> 
                        <option value="ENTJ">ENTJ</option> 
                        <option value="ISTJ">ISTJ</option> 
                        <option value="ISTP">ISTP</option> 
                        <option value="ISFP">ISFP</option> 
                        <option value="ISFJ">ISFJ</option> 
                        <option value="ISFP">ISFP</option> 
                        <option value="INFJ">INFJ</option> 
                        <option value="INTP">INTP</option> 
                        <option value="INFP">INFP</option> 
                        <option value="INTJ">INTJ</option>
                        
                        </select>
                        </td>
                     </tr>
                     
                     <tr>
                     <td>
                     당신이 좋아하는 MBTI : 
                     </td>
                     <td>
                      <select name="likembti" size=1 required="required">
                        <option value="">뭐예요?</option>
                        <option value="ESTJ">ESTJ</option> 
                        <option value="ESTP">ESTP</option> 
                        <option value="ESFP">ESFP</option> 
                        <option value="ESFJ">ESFJ</option> 
                        <option value="ENTP">ENTP</option> 
                        <option value="ENFP">ENFP</option> 
                        <option value="ENFJ">ENFJ</option> 
                        <option value="ENTJ">ENTJ</option> 
                        <option value="ISTJ">ISTJ</option> 
                        <option value="ISTP">ISTP</option> 
                        <option value="ISFP">ISFP</option> 
                        <option value="ISFJ">ISFJ</option> 
                        <option value="ISFP">ISFP</option> 
                        <option value="INFJ">INFJ</option> 
                        <option value="INTP">INTP</option> 
                        <option value="INFP">INFP</option> 
                        <option value="INTJ">INTJ</option>
                        </select>
                     </td>
                     
                     </tr>
                     
            
                        <tr>
                        <td>당신이 싫어하는 MBTI : 
                        </td>
                        <td>
                        <select name="dislikembti" size=1 required="required">
                        <option value="">뭐예요?</option>
                        <option value="ESTJ">ESTJ</option> 
                        <option value="ESTP">ESTP</option> 
                        <option value="ESFP">ESFP</option> 
                        <option value="ESFJ">ESFJ</option> 
                        <option value="ENTP">ENTP</option> 
                        <option value="ENFP">ENFP</option> 
                        <option value="ENFJ">ENFJ</option> 
                        <option value="ENTJ">ENTJ</option> 
                        <option value="ISTJ">ISTJ</option> 
                        <option value="ISTP">ISTP</option> 
                        <option value="ISFP">ISFP</option> 
                        <option value="ISFJ">ISFJ</option> 
                        <option value="ISFP">ISFP</option> 
                        <option value="INFJ">INFJ</option> 
                        <option value="INTP">INTP</option> 
                        <option value="INFP">INFP</option> 
                        <option value="INTJ">INTJ</option>
                        </select>
                        </td>
                        
                        </tr>
                   
                  </table>
               </td>
            </tr>
      </table>   
      
   
<br>


<h3>당신은 어디에 살고 계신가요?</h3>
<h4>※주의※ 개인정보노출등의 우려가 있으니 실제 주소를 입력하지 않도록 해주세요</h4>

 

<%--주소입력 --%>
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
<input type="text" id="sample5_address" placeholder="주소찾기 버튼을 눌러주세요">
<br><br>


<div id="map" style="width:60%;height:400px;margin-top:10px;"></div>

<br>
<br>

당신의 위치는 ? :
<input type="text" name="find_lat" id="find_lat" value="" placeholder="위도"/>
<input type="text" name="find_lng" id="find_lng" value="" placeholder="경도"/>

<%--주소입력 
--%>
<script type="text/javascript" src="script.js"></script>

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6a3c7102f00d432155b446ee7cd902b1&libraries=services"></script>



<script>
    
       var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    
        mapOption = {
            center: new daum.maps.LatLng(37.472417374923204, 126.89605468246113), // 지도의 중심좌표
            level: 6 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
     
    
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
 
                        //추가
                        document.getElementById('find_lat').value = result.y;
                         document.getElementById('find_lng').value = result.x;
                  
                         
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        
                        

                      //인포윈도우
                        var infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">여기 살아요!</div>'
                        });
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        
                        var marker = new daum.maps.Marker({
                            position: coords,
                            map: map
                        });
                        
                        infowindow.open(map, marker);
                        
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                        
                      
                    }
                    
                });
            }
        }).open();
        
      
    }
    
</script>

<br><br>



   
  
   
   <br>
   <br>
   <br>
   <p style="margin-top: -12px">
      <em class="link"> <a href="javascript:void(0);"
         onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
      </em>
   </p>
   
   <br>
   <br>
   <br>
   <br>
  
   

<input type="submit" value="회원가입" onclick="insert_btn()">&nbsp; &nbsp; 
   
<input type="reset" value="초기화"> &nbsp; &nbsp; 
 <br>
   <br>
    <br>
   <br>
   <br>
   <br>
   </form>
   
   </div>
   <footer>
      <%@ include file="/jsp/include/footer.jsp" %> <!-- xml,include,forward의 /는 Mission-Web까지 말함 -->
   </footer>
</body>
</html>