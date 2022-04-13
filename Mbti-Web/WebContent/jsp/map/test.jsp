<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    
</head>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=kakaomapappkey&amp;libraries=services"></script>
    <script>

        var listData = [
            ["서울 중구 세종대로 110","서울특별시청"],
            ["경기 수원시 팔달구 효원로 1","경기도청"]
        ];

        // 맵을 넣을 div
        var mapContainer = document.getElementById('map');
        var mapOption = {
            center: new daum.maps.LatLng(35.95, 128.25),
            level: 13
        };  

        // 맵 표시
        var map = new daum.maps.Map(mapContainer, mapOption); 

        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        // 주소 -&gt; 좌표 변환 라이브러리        
        var geocoder = new daum.maps.services.Geocoder();
        
        // foreach loop
        listData.forEach(function(addr, index) {
            geocoder.addressSearch(addr[0], function(result, status) {
                if (status === daum.maps.services.Status.OK) {
                    var coords = new daum.maps.LatLng(result[0].y, result[0].x);
        
                    var marker = new daum.maps.Marker({
                        position: coords,
                        clickable: true
                    });
        
                    // 마커를 지도에 표시합니다.
                    marker.setMap(map);
    
                    // 인포윈도우를 생성합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '&lt;div style="width:150px;text-align:center;padding:6px 0;"&gt;' + addr[1] + '&lt;/div&gt;',
                        removable : true
                    });
                        
                    // 마커에 클릭이벤트를 등록합니다
                    kakao.maps.event.addListener(marker, 'click', function() {
                          // 마커 위에 인포윈도우를 표시합니다
                          infowindow.open(map, marker);  
                    });
                } 
            });
        });
    </script>
    
    
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:350px;"></div>


</body>
</html>