<%@ page language= "java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KaKaoMap Study : olrlobt</title>
</head>
<body>
<div id="map" style="width: 1000px; height: 800px;"></div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=685d5cd49acd20ac78b758246375b1ef" ></script>
<script type="text/javascript">
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var positions = [
        {
            content: '<div>카카오</div>',
            latlng: new kakao.maps.LatLng(33.450705, 126.570677)
        },
        {
            content: '<div>생태연못</div>',
            latlng: new kakao.maps.LatLng(33.450936, 126.569477)
        },
        {
            content: '<div>텃밭</div>',
            latlng: new kakao.maps.LatLng(33.450879, 126.569940)
        },
        {
            content: '<div>근린공원</div>',
            latlng: new kakao.maps.LatLng(33.451393, 126.570738)
        }
    ];

    for (var i = 0; i<positions.length; i++){
        var marker = new kakao.maps.Marker({
            map:map,
            position: positions[i].latlng
        });

        var infowindow = new kakao.maps.InfoWindow({
            content: positions[i].content
        })

        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    }

    function  makeOverListener(map, marker, infowindow){
        return function (){
            infowindow.open(map, marker);
        };
    }

    function makeOutListener(infowindow){
        return function (){
            infowindow.close();
        };
    }

    // 다른방법
   /* for (var i = 0; i < positions.length; i ++) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng // 마커의 위치
        });

        // 마커에 표시할 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: positions[i].content // 인포윈도우에 표시할 내용
        });

        // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
        // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
        (function(marker, infowindow) {
            // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.open(map, marker);
            });

            // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
        })(marker, infowindow);
    }*/

</script>
</body>
</html>