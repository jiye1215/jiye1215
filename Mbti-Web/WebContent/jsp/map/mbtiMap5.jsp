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
		        center: new kakao.maps.LatLng( ${mapVO.addrx}, ${mapVO.addry} ), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    }; 
			
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		
			var positions = [];
		
			positions[0] = {
				
		        title: '내 위치', 
		        latlng: new kakao.maps.LatLng(${mapVO.addrx}, ${mapVO.addry})
			}
						    
			
			let ioc = 1;	
			
			<c:forEach items="${allmaplist}" var="map">
					
					var position = 	{
							
				        title: '${map.id}', 
				        latlng: new kakao.maps.LatLng(${map.addrx}, ${map.addry})
					}		    
				
					
					positions[ioc++] = position
				
				
				
					
				
			</c:forEach>
	

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
		
		//나의 정보
		contents[0] = '<div class="wrap">' + 
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
		
		let j = 1;
		<c:forEach items="${allmaplist}" var="map">
		
			var content = '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + 
	        '            MBTI : ${map.mymbti}' + 
	       // '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
	        '                <img src="data:image/jpeg;base64,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" width="73" height="70">' +
	        '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="id">ID : ${map.id} </div>' + 
	        '                <div class="like">좋아하는 MBTI : ${map.likembti}</div>' + 
	        '                <div class="dislike">싫어하는 MBTI : ${map.dislikembti}</div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';
	        
	        contents[j++] = content
	
        
     
        
		</c:forEach>
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
	    	    overlay.setMap(null); 
	    	  
	    	}
		
	
			
	</c:when>
			
		<c:otherwise>
			if(confirm('로그인서비스가 필요합니다\n로그인페이지로 이동하시겠습니까?')){
				alert('!!!')
				//location.href = '${ pageContext.request.contextPath }/login.do'
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



	 

<br>
	<%--이미지 지도를 표시할 div 입니다  --%>
	<div id="map" style="width:100%;height:500px;"></div>
	
</section>

<footer> 
	<%@ include file="/jsp/include/footer.jsp" %> <%--절대경로 써야함. 상대경로 안됨. 모두다 써야하기 때문 --%>
</footer>



</body>
</html>