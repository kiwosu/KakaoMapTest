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

    var map = new kakao.maps.Map(mapContainer, mapOption);


    var  position = [
        {
            title: '카카오1',
            latlng: new kakao.maps.LatLng(33.450701, 126.570667),
            content: '<div style="padding:5px;">카카오1<br>'
        },
        {
            title : '카카오2',
            latlng: new kakao.maps.LatLng(33.453701, 126.573667),
            content: '<div style="padding:5px;">카카오2<br>'
        },
        {
            title : '카카오3',
            latlng: new kakao.maps.LatLng(33.455701, 126.575667),
            content: '<div style="padding:5px;">카카오3<br>'
        },
        {
            title : '카카오4',
            latlng: new kakao.maps.LatLng(33.448701, 126.568667),
            content: '<div style="padding:5px;">카카오4<br>'
        }
    ]

    for(var i=0;i< position.length; i++){
        var marker = new kakao.maps.Marker({
            map: map,
            position: position[i].latlng
        });
        var Infowindow = new kakao.maps.InfoWindow({
            map: map,
            position: position[i].latlng,
            content: position[i].content
        });
    }
    Infowindow.open(map, marker);


</script>
</body>
</html>