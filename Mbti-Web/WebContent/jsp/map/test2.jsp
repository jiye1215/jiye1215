<?php
// 데이터베이스에서 읽어서 주소와 인포윈도우 내용을 출력하는 함수 작성
function WriteAddress() {

    echo '
            ["서울 중구 세종대로 110","서울특별시청"],
            ["경기 수원시 팔달구 효원로 1","경기도청"]
    ';

}

?>

&lt;!doctype html&gt;
&lt;html lang="ko"&gt;
&lt;head&gt;
    &lt;meta charset="utf-8"&gt;

    &lt;meta name="viewport" content="initial-scale=1.0,user-scalable=no"&gt;
    &lt;style type="text/css"&gt;
        html { height: 100% }
        body { height: 100%; margin: 0; padding: 0 }
        h1,h5   { text-align : center}
        #map { width: 90%; height: 80%; border : solid blue ; margin-left:auto; margin-right:auto }
    &lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;
    &lt;h1&gt;주소 -&gt; 좌표 전환, 다중 마커, 다중 인포윈도우 표시&lt;/h1&gt;
    &lt;div id="map"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=kakaomapappkey&amp;libraries=services"&gt;&lt;/script&gt;
    &lt;script&gt;

        var listData = [
&lt;?php
            WriteAddress();
?&gt;
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