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
<script>


    // 마커가 지도 위에 표시되도록 설정합니다

</script>
<script type="text/javascript">
    function DBload(){
        $.ajax({
            url : "/dbLoad",
            type : 'get',
            data : { map_num : 5 },
            dataType : 'json',
            success:function(data)
            {
                var result = data;
                if(result.result > 0)
                {
                    var resultDiv = document.getElementById('DBresult');
                    resultDiv.innerHTML = data.latitude;


                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                        mapOption = {
                            center: new kakao.maps.LatLng(data.latitude, data.longitude), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };

                    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                    // 마커가 표시될 위치입니다
                    var markerPosition  = new kakao.maps.LatLng(data.latitude, data.longitude);

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        position: markerPosition

                    });

                    marker.setMap(map);
                }
                else{
                    alert('불러오기 실패');
                }
            }
        });
    }

</script>
<div><input type="button" onclick="return DBload()" value="불러오기"></div>
<input type="hidden" id="Latitude">
<input type="hidden" id="Longitude">
<div id="DBresult"></div>
        </body>
</html>