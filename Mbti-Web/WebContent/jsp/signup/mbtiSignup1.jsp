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
</style>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6a3c7102f00d432155b446ee7cd902b1&libraries=services"></script>

<script>
//주소확인
let finaddr = '서울특별시 금천구 가산로 70 B동'
	
	//인덱스 페이지로 이동
	function goindex(){
		location.href = "mbtiIndex.jsp";
	
	}

	//주소확인
	function checkaddr(){
		if(confirm('주소가 맞습니까?')){
		let addr = document.getElementById('addrdetail')
		finaddr = addr.value;
		showMap()
		}
		
	}
	
	//지도 표시
	function showMap() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.47241467692675, 126.89608667042519), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch( finaddr , function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">여기 살아요!</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
	}

</script>

<script>
	window.onload = function() {
		showMap()
	}
	
</script>

</head>



<%--body --%>
<body>
	<h1>회원가입 페이지입니다</h1>
	<br><br><br><br>

아이디 : <input type ="text" size ="30"><br><br>
비밀번호 : <input type ="text" size="30" ><br><br>
비밀번호 확인 : <input type ="password" ><br><br>
닉네임 : <input type ="text" size ="30"><br><br>
<h2>내 MBTI는?</h2> <br>  

<img src="/MBTI/image/mbtiphoto.jpeg" width="400" height="400" border = "3" style="border-color:pink" alt="다음로고" title="mbti">
<br>

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
<br><br><br>

<h3>당신은 어디에 살고 계신가요?</h3>
<h4>※주의※ 개인정보노출등의 우려가 있으니 실제 주소를 입력하지 않도록 해주세요</h4>

<div id="div01">

<%--주소입력 --%>

주소 입력 : <input type="text" name="addrdetail" id="addrdetail" placeholder="주소를 입력해주세요">
<input type="button" id="addr" value="주소확인" onclick="checkaddr()">

<br><br>


</div>

	
	<div id="map" style="width: 50%; height: 350px;"></div>
	
	<br>
<p style="margin-top: -12px">
		<em class="link"> <a href="javascript:void(0);"
			onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
				혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
		</em>
	</p>
	
	<br>
	<br>
	<h2>당신이 원하는 MBTI는?</h2>
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
	
	<h2>당신이 싫어하는 MBTI는?</h2>
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
	
	<br>
	<br>
	<br>
	
	
	<input type="button" id="goindex" value="회원가입 완료" onclick="goindex()">
</body>
</html>