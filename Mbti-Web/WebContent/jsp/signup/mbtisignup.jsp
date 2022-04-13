<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
h4{
color : red;
}

table{
width : 80%;
}
</style>

<script>

   //id중복체크
      function idCheck(id) {
      frm = document.reFrm;
      if(id == "") {
         alert("아이디를 입력해 주세요");
         frm.id.focus();
         return;
      }
      url = "idCheck.jsp?id=" + id;
      
      window.open(url, "IDCheck", "width=300, height=150");
   }
   

</script>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<body bgcolor="#FFFFCC" onLoad="regFrm.id.focus()">
   
   <h1 align="center">MBTI FRIENDS</h1>
   <br><br>
   
   
   <div align="center">
   <br /><br />
   <form name="regFrm" method="post" action="${pageContext.request.contextPath}/SignupProcess.do">
    <table align="center" border="0" cellspacing="0" cellpadding="5">
            <tr>
               <td align="center" valign="middle" bgcolor="FFFFCC">
                  <table align="1r" border="0" cellpadding="2" align="center"
                     width=100%>
                     <tr align="center" bgcolor="#996600">
                        <td colspan="3"><font color="#FFFFFF"><b>회원가입</b></font></td>
                     </tr>
                     <tr>
                        <td width="30%">아이디 :</td>
                        <td width="40%"><input name="id" size="15"> <input
                           type="button" value="ID중복확인"
                           onClick="idCheck(this.form.id.value)"></td>
                        <td width="30%">아이디를 적어주세요</td>
                     </tr>
                     <tr>
                        <td>패스워드 :</td>
                        <td><input type="password" name="pwd" size="15"></td>
                        <td>패스워드를 적어주세요</td>
                     </tr>
                     <tr>
                        <td>패스워드 확인 :</td>
                        <td><input type="password" name="repwd" size="15"></td>
                        <td>패스워드를 확인합니다</td>
                     </tr>
                     <tr>
                        <td>닉네임 :</td>
                        <td><input name="name" size="15"></td>
                        <td>닉네임을 적어주세요</td>
                     </tr>
                     
                     <tr>
                     <td>
                     
                     내 MBTI는? : 
                        </td>
                        <td>
                        <select>
                        <option>ESTJ</option> 
                        <option>ESTP</option> 
                        <option>ESFP</option> 
                        <option>ESFJ</option> 
                        <option>ENTP</option> 
                        <option>ENFP</option> 
                        <option>ENFJ</option> 
                        <option>ENTJ</option> 
                        <option>ISTJ</option> 
                        <option>ISTP</option> 
                        <option>ISFP</option> 
                        <option>ISFJ</option> 
                        <option>ISFP</option> 
                        <option>INFJ</option> 
                        <option>INTP</option> 
                        <option>INFP</option> 
                        <option>INTJ</option> 
                        </select>
                        </td>
                     </tr>
                     
                     <tr>
                     <td>
                     당신이 좋아하는 MBTI는? : 
                     </td>
                     <td>
                     <select>
                           <option>ESTJ</option> 
                           <option>ESTP</option> 
                           <option>ESFP</option> 
                           <option>ESFJ</option> 
                           <option>ENTP</option> 
                           <option>ENFP</option> 
                           <option>ENFJ</option> 
                           <option>ENTJ</option> 
                           <option>ISTJ</option> 
                           <option>ISTP</option> 
                           <option>ISFP</option> 
                           <option>ISFJ</option> 
                           <option>ISFP</option> 
                           <option>INFJ</option> 
                           <option>INTP</option> 
                           <option>INFP</option> 
                           <option>INTJ</option> 
                        </select>
                     </td>
                     
                     </tr>
                     
            
                        <tr>
                        <td>당신이 싫어하는 MBTI는? : 
                        </td>
                        <td>
                        <select>
                           <option>ESTJ</option> 
                           <option>ESTP</option> 
                           <option>ESFP</option> 
                           <option>ESFJ</option> 
                           <option>ENTP</option> 
                           <option>ENFP</option> 
                           <option>ENFJ</option> 
                           <option>ENTJ</option> 
                           <option>ISTJ</option> 
                           <option>ISTP</option> 
                           <option>ISFP</option> 
                           <option>ISFJ</option> 
                           <option>ISFP</option> 
                           <option>INFJ</option> 
                           <option>INTP</option> 
                           <option>INFP</option> 
                           <option>INTJ</option> 
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

<%--주소입력 --%>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6a3c7102f00d432155b446ee7cd902b1&libraries=services"></script>
<%-- 빈칸 체크 --%>
<script type="text/javascript" src="script1.js"></script>

<script>
    
       var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    
        mapOption = {
            center: new daum.maps.LatLng(37.472417374923204, 126.89605468246113), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
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
  
   

<input type="submit" value="회원가입" >&nbsp; &nbsp; 
   
<input type="reset" value="초기화"> &nbsp; &nbsp; 
   </form>
   
   </div>
   

</body>
</html>