<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>MBTI 지도</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6a3c7102f00d432155b446ee7cd902b1"></script>
<script>

function gomap(){

	<c:choose>
	
		<c:when test="${ not empty userVO }">
      	
		var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	    mapOption = { 
	        center: new kakao.maps.LatLng(${mapVO.addrx}, ${mapVO.addry}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    }; 
		
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	let listlength = ${fn:length(allmaplist) };
	
	var positions = [
		
		{
	    
	        title: '안녕', 
	        latlng: new kakao.maps.LatLng(${allmaplist[0].addrx}, ${allmaplist[0].addry})
	},
	
	
	
	{
		
			title: '나',
			latlng: new kakao.maps.LatLng(${mapVO.addrx}, ${mapVO.addry})
		
	}
	    
	        

	];
	
	// 지도에 마커를 표시합니다 

	let markers = []
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage, // 마커 이미지 
	    });
	    
	    markers[i] = marker
	}
		


	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다
	let contents = []


	for(let i = 0; i < positions.length; i++) {
		var content = '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title">' + 
        '            MBTI : ${mapVO.mymbti}' + 
       // '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
        '        </div>' + 
        '        <div class="body">' + 
        '            <div class="img">' +
        '                <img src="data:image/jpeg;base64,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" width="73" height="70">' +
        '           </div>' + 
        '            <div class="desc">' + 
        '                <div class="id">ID : ${mapVO.id} </div>' + 
        '                <div class="like">좋아하는 MBTI : ${mapVO.likembti}</div>' + 
        '                <div class="dislike">싫어하는 MBTI : ${mapVO.dislikembti}</div>' + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';
        
        contents[i] = content
	}
	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다


	for(let i = 0; i < positions.length; i++) {	
	var overlay = new kakao.maps.CustomOverlay({
	    content: contents[i],
	    map: map,
	    position: markers[i].getPosition()      
	});
	}
	
	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	kakao.maps.event.addListener(marker, 'click', function() {
	    overlay.setMap(map);
	});
	
	

		

		
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다

	function closeOverlay() {
	    //overlay.setMap(null); 
	    overlay.close();
	}

		
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

<tr>
<td>
나의 주소 좌표는? : 
<c:out value="${mapVO.addrx }" default="값 없음"/>
<c:out value="${mapVO.addry }" default="값 없음"/>



</td>
</tr>



</table>

<br>

<c:forEach var="allmaplist" items="${allmaplist}" >
	${ allmaplist.id }
	 
</c:forEach>





<br>
	<%--이미지 지도를 표시할 div 입니다  --%>
	<div id="map" style="width:100%;height:350px;"></div>
	
</section>

<footer> 
	<%@ include file="/jsp/include/footer.jsp" %> <%--절대경로 써야함. 상대경로 안됨. 모두다 써야하기 때문 --%>
</footer>



</body>
</html>