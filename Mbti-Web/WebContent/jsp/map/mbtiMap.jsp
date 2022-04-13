<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>MBTI 지도</title>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/topmenu.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/footer.css">
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
<style>


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
    margin-top:100px;
      width: 80%;
      text-align: center;
   }
   
   .cc {
   width:100%;
   height:250px;
   }
</style>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6a3c7102f00d432155b446ee7cd902b1"></script>
<script>

function gomap(){
   <c:choose>
   
   <c:when test="${ not empty userVO }">
   
         var mapContainer = document.getElementById('map'), // 지도의 중심좌표
          mapOption = { 
              center: new kakao.maps.LatLng( "${mapVO.addrx}", "${mapVO.addry}" ), // 지도의 중심좌표
              level: 6 // 지도의 확대 레벨
          }; 
         
         var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
   
         var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   
      
         var positions = [];
      
         positions[0] = {
            
              title: '내 위치', 
              latlng: new kakao.maps.LatLng(${mapVO.addrx}, ${mapVO.addry} )
         }
                      
         
         let ioc = 1;   
         
         <c:forEach items="${allmaplist}" var="map">
               
               var position =    {
                     
                    title: '${map.id}', 
                    latlng: new kakao.maps.LatLng(${map.addrx}, ${map.addry} )
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
           '                <img src="data:image/png;base64,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" width="73" height="70">' +
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
      
   
         
   
   
   
}   



</c:when>

<c:otherwise>
   alert('!!!')
   if(confirm('로그인서비스가 필요합니다\n로그인페이지로 이동하시겠습니까?')){
      
      location.href = '${ pageContext.request.contextPath }/login.do'
   }
</c:otherwise>

</c:choose>
</script>

<script>
window.onload=function(){
   
         gomap();
}
</script>

</head>
<header>
   <jsp:include page="/jsp/include/topmenu.jsp" />
</header>
<body>

<br>
<hr>
<table border="0" cellpadding="2" align="center">
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
   <div align="center">
   <div id="map" style="width:80%;height:800px;"></div>
   </div>
<div class="cc">

</div>
<footer> 
   <%@ include file="/jsp/include/footer.jsp" %> <%--절대경로 써야함. 상대경로 안됨. 모두다 써야하기 때문 --%>
</footer>

</body>
</html>