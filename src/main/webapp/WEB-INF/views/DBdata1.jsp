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
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 지도를 클릭한 위치에 표출할 마커입니다
    var marker = new kakao.maps.Marker({
        // 지도 중심좌표에 마커를 생성합니다
        position: map.getCenter()
    });

    marker.setMap(map);

    kakao.maps.event.addListener(map, 'click', function (mouseEvent){
        var latlng = mouseEvent.latLng;

        marker.setPosition(latlng);

        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + '이고,';
        message += '경도는' + latlng.getLng() + '입니다';

        var resultDiv = document.getElementById('clickLatlng');
        resultDiv.innerHTML = message;

        var Latitude = document.getElementById('Latitude');
        Latitude.innerHTML = latlng.getLat();
        var Longitude = document.getElementById('Longitude');
        Longitude.innerHTML = latlng.getLng();
    });
    //db값 저장
    function DBinsert(){

        var clickLatlngText = $("#clickLatlng").text(); // 사용하려는 id 값인 "clickLatlng"을 가져옴
        console.log(clickLatlngText); // 결과를 콘솔에 출력

        var LatitudeText = $("#Latitude").text(); // 사용하려는 id 값인 "clickLatlng"을 가져옴
        console.log(LatitudeText); // 결과를 콘솔에 출력

        var LongitudeText = $("#Longitude").text(); // 사용하려는 id 값인 "clickLatlng"을 가져옴
        console.log(LongitudeText); // 결과를 콘솔에 출력

        var test = '데이터 삽입 테스트'

        $.ajax({
            url : "/mapSave",
            type : 'post',
            data: {
                latitude : LatitudeText,
                longitude : LongitudeText,
                name : test
            },
            success: function (data){
                if(data.result == 0){
                    alert("성공했습니다");
                } else{
                    alert("개같이 실패!");
                }
            }
        })
    };
        </script>
<input type="hidden" id="Latitude">
<input type="hidden" id="Longitude">
<div><input type="submit" onclick="return DBinsert()" value="저장하기"></div>

        </body>
</html>