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
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

    var map = new kakao.maps.Map(container, options);

    var positions = [
        {
            title : '카카오1',
            latlng: new kakao.maps.LatLng(33.450701, 126.570667)
        },
        {
            title : '카카오2',
            latlng: new kakao.maps.LatLng(33.453701, 126.573667)
        },
        {
            title : '카카오3',
            latlng: new kakao.maps.LatLng(33.455701, 126.575667)
        },
        {
            title : '카카오4',
            latlng: new kakao.maps.LatLng(33.448701, 126.568667)
        }
    ];

    for (var i = 0; i < positions.length; i++ ){
        var marker = new kakao.maps.Marker({
            map: map,
            position : positions[i].latlng,
            title: positions[i].title,
        });
    }
</script>
</body>
</html>