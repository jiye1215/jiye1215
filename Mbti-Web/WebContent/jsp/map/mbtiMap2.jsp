<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>MBTI 지도</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6a3c7102f00d432155b446ee7cd902b1"></script>
<script>
function gomap(){

	<c:choose>
	
		<c:when test="${ not empty userVO }">

			// 이미지 지도에 표시할 마커입니다
			// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
			var markers = [
			    {
			        position: new kakao.maps.LatLng(33.450701, 126.570667),
			        text: 'MBTI : ESTJ ID:hs94'
			    
			    },
			    {
			        position: new kakao.maps.LatLng(33.450001, 126.570467), 
			        text: 'MBTI : ESTJ ID:hs94' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
			    }
			];
	
			var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
			    staticMapOption = { 
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
			        level: 3, // 이미지 지도의 확대 레벨
			        marker: markers // 이미지 지도에 표시할 마커 
			    };    
	
			// 이미지 지도를 생성합니다
			var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
		
		</c:when>
		
		<c:otherwise>
			if(confirm('로그인서비스가 필요합니다\n로그인페이지로 이동하시겠습니까?')){
				location.href = '${ pageContext.request.contextPath }/login.do'
			}
		</c:otherwise>
	
	</c:choose>
	
	
}	
</script>
<script>
window.onload=function(){
	gomap()
}
</script>

</head>
<body>
<header>
	<jsp:include page="/jsp/include/topmenu.jsp" />
</header>
<section>
<br>

<table>
<tr>

<td>
당신의 주소는? : 
<c:out value="${mapVO.addr}" default="값 없음"/>
</td>

</tr>


<tr>
<td>
당신의 MBTI는? : 
<c:out value="${mapVO.mymbti }" default="값 없음"/>
</td>

</tr>


<tr>
<td>
당신이 좋아하는 MBTI는? :
<c:out value="${mapVO.likembti }" default="값 없음"/>

</td>
</tr>


<tr>
<td>
당신이 싫어하는 MBTI는? :
<c:out value="${mapVO.dislikembti }" default="값 없음"/>

</td>
</tr>


</table>
<br><br>
	<!-- 이미지 지도를 표시할 div 입니다 -->

	<div id="staticMap" style="width:600px;height:350px;"></div> 
</section>

<footer> 
	<%@ include file="/jsp/include/footer.jsp" %> <%--절대경로 써야함. 상대경로 안됨. 모두다 써야하기 때문 --%>
</footer>



</body>
</html>