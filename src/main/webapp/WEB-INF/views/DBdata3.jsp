<%@ page language= "java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KaKaoMap Study : olrlobt</title>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<div id="clickLatlng"></div>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=685d5cd49acd20ac78b758246375b1ef&libraries=services"></script>
<script type="text/javascript">
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.67549872569038, 126.7788946601666),
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다
        startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다
        startOption = {
            offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
        };

    // 출발 마커 이미지를 생성합니다
    var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);

    var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다
        startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다
        startDragOption = {
            offset: new kakao.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
        };

    // 출발 마커의 드래그 이미지를 생성합니다
    var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);

    // 출발 마커가 표시될 위치입니다
    var startPosition = new kakao.maps.LatLng(37.67549872569038, 126.7788946601666);

    // 출발 마커를 생성합니다
    var startMarker = new kakao.maps.Marker({
        map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
        position: startPosition,
        draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
        image: startImage // 출발 마커이미지를 설정합니다
    });




    var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다
        arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다
        arriveOption = {
            offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
        };

    // 도착 마커 이미지를 생성합니다
    var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

    var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다
        arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다
        arriveDragOption = {
            offset: new kakao.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
        };

    // 도착 마커의 드래그 이미지를 생성합니다
    var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);

    // 도착 마커가 표시될 위치입니다
    var arrivePosition = new kakao.maps.LatLng(37.67549872569038, 126.7788946601666);

    // 도착 마커를 생성합니다
    var arriveMarker = new kakao.maps.Marker({
        map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
        position: arrivePosition,
        draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
        image: arriveImage // 도착 마커이미지를 설정합니다
    });


//////////////////////////////////////////
    const clickHandler = function (mouseEvent) {
        const latlng = mouseEvent.latLng;
        startMarker.setPosition(latlng);
    };

    function change_btn(event) {
        const btns = document.querySelectorAll(".button");
        btns.forEach(function (btn, i) {

            if (event.currentTarget == btn) {
                btn.classList.add("active");
                // "출발점" 버튼이 활성 상태일 때 실행할 코드 추가
                kakao.maps.event.addListener(map, 'click', function (mouseEvent){
                    const latlng = mouseEvent.latLng;
                    startMarker.setPosition(latlng);
                });
            } else {
                btn.classList.remove("active");
                console.log("출발점 버튼이 비활성화.");
                kakao.maps.event.removeListener(map, 'click', function (mouseEvent){
                    const latlng = mouseEvent.latLng;
                    startMarker.setPosition(latlng);
                });
            }
        });
        console.log( document.querySelectorAll(".button"));
        console.log(event.currentTarget);
    }
</script>
<style>
    .button:hover,
    .button.active {
        background: #7ea338;
        color: white;
    }
    .button:visited {
        background: #7ea338;
        color: white;
    }
    .button {
        border: 0;
    }
</style>
<div class="e" style="font-size:20px">
    <button class="button" id="start" onclick="change_btn(event)">출발점</button>
    <button class="button" id="end" onclick="change_btn(event)">도착점</button>
</div>
<input type="hidden" id="Latitude">
<input type="hidden" id="Longitude">
</body>
</html>