<%@ page language= "java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>선의 거리 계산하기</title>
    <style>
        .dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}
        .startdot {overflow:hidden;float:left;width:50px;height:45px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png');}
        .enddot {overflow:hidden;float:left;width:50px;height:45px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png');}
        .dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
        .dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
        .number {font-weight:bold;color:#ee6152;}
        .dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
        .distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
        .distanceInfo .label {display:inline-block;width:50px;}
        .distanceInfo:after {content:none;}
    </style>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<p>
    <em>지도를 마우스로 클릭하면 선 그리기가 시작되고<br>오른쪽 마우스를 클릭하면 선 그리기가 종료됩니다</em>
</p>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=685d5cd49acd20ac78b758246375b1ef"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
    var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
    var clickLine; // 마우스로 클릭한 좌표로 그려질 선 객체입니다
    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
    // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
    // 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
    function showDistance(content, position) {

        if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

            // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
            distanceOverlay.setPosition(position);
            distanceOverlay.setContent(content);

        } else { // 커스텀 오버레이가 생성되지 않은 상태이면

            // 커스텀 오버레이를 생성하고 지도에 표시합니다
            distanceOverlay = new kakao.maps.CustomOverlay({
                map: map, // 커스텀오버레이를 표시할 지도입니다
                content: content,  // 커스텀오버레이에 표시할 내용입니다
                position: position, // 커스텀오버레이를 표시할 위치입니다.
                xAnchor: 0.186,
                yAnchor: 0.4,
                zIndex: 3
            });
        }
    }


    // 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여
    // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
    function displayCircleDot(position, distance) {

        console.log("dots"+dots);
        //수정된 코드 해당 코드를 통해 찍히는 이미지가 변경됨
        //시작 dot
        // if(dots.length == 0){
        //     var circleOverlay = new kakao.maps.CustomOverlay({
        //         content: '<span class="startdot"></span>',
        //         position: position,
        //         xAnchor: 0.3,
        //         yAnchor: 1,
        //         zIndex: 1
        //     });
        //     //끝 dot
        // }else{
        //     //기본 dot
        //     var circleOverlay = new kakao.maps.CustomOverlay({
        //         content: '<span class="dot"></span>',
        //         position: position,
        //         zIndex: 1
        //     });
        // }
        var circleOverlay = new kakao.maps.CustomOverlay({
                     content: '<span class="dot"></span>',
                     position: position,
                     zIndex: 1
                 });
        circleOverlay.setMap(map);
        console.log("되는지도 이제 모르겠다"+circleOverlay.setMap(map));
        if (distance > 0) {
            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
            var distanceOverlay = new kakao.maps.CustomOverlay({
                content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
                position: position,
                yAnchor: 1,
                zIndex: 2
            });

            // 지도에 표시합니다
            distanceOverlay.setMap(map);
        }

        // 배열에 추가합니다
        dots.push({circle:circleOverlay, distance: distanceOverlay});
    }

    // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여
    // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
    // HTML Content를 만들어 리턴하는 함수입니다
    function getTimeHTML(distance) {

        // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
        var walkkTime = distance / 67 | 0;
        var walkHour = '', walkMin = '';

        // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
        if (walkkTime > 60) {
            walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
        }
        walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

        // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
        var bycicleTime = distance / 227 | 0;
        var bycicleHour = '', bycicleMin = '';

        // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
        if (bycicleTime > 60) {
            bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
        }
        bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

        // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
        var content = '<span class="enddot"></span><ul class="dotOverlay distanceInfo">';
        content += '    <li>';
        content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
        content += '    </li>';
        content += '    <li>';
        content += '        <span class="label">도보</span>' + walkHour + walkMin;
        content += '    </li>';
        content += '    <li>';
        content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
        content += '    </li>';
        content += '</ul>'

        return content;
    }
    function deleteClickLine() {
        if (clickLine) {
            clickLine.setMap(null);
            clickLine = null;
        }
    }
    function deleteDistnce () {
        if (distanceOverlay) {
            distanceOverlay.setMap(null);
            distanceOverlay = null;
        }
    }
    function deleteCircleDot() {
        var i;

        for ( i = 0; i < dots.length; i++ ){
            if (dots[i].circle) {
                dots[i].circle.setMap(null);
            }

            if (dots[i].distance) {
                dots[i].distance.setMap(null);
            }
        }

        dots = [];
    }
    //불러오기
    function clickLoad(){
        $.ajax({
            url : "/clickLoad",
            type : 'get',
            data : { user_num : 6933,
                    board_num : 1},
            dataType : 'json',
            success: function(dataList) {
                console.log(dataList);

                // dataList를 원하는 방식으로 활용
                // 예: 각 데이터 항목을 반복하며 처리
                deleteClickLine();

                // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
                deleteDistnce();

                // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
                deleteCircleDot();
                dataList.forEach(function(data) {
                    console.log("Latitude: " + data.La + ", Longitude: " + data.Ma);
                    console.log("카카오맵 길 불러오기");
                    // 필요한 작업 수행

                    // 마우스로 클릭한 위치입니다
                    var clickPosition = new kakao.maps.LatLng(data.La, data.Ma);


                        // 마우스로 클릭한 위치입니다
                        var clickPosition = new kakao.maps.LatLng(data.La, data.Ma);

                        // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
                        if (!drawingFlag) {

                            // 상태를 true로, 선이 그리고있는 상태로 변경합니다
                            drawingFlag = true;
                            // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다

                            // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
                            clickLine = new kakao.maps.Polyline({
                                map: map, // 선을 표시할 지도입니다
                                path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
                                strokeWeight: 3, // 선의 두께입니다
                                strokeColor: '#db4040', // 선의 색깔입니다
                                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                                strokeStyle: 'solid' // 선의 스타일입니다
                            });

                            // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
                            moveLine = new kakao.maps.Polyline({
                                strokeWeight: 3, // 선의 두께입니다
                                strokeColor: '#db4040', // 선의 색깔입니다
                                strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
                                strokeStyle: 'solid' // 선의 스타일입니다
                            });

                            // 클릭한 지점에 대한 정보를 지도에 표시합니다
                            displayCircleDot(clickPosition, 0);


                        } else { // 선이 그려지고 있는 상태이면

                            // 그려지고 있는 선의 좌표 배열을 얻어옵니다
                            var path = clickLine.getPath();

                            // 좌표 배열에 클릭한 위치를 추가합니다
                            path.push(clickPosition);

                            // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
                            clickLine.setPath(path);

                            var distance = Math.round(clickLine.getLength());
                            displayCircleDot(clickPosition, distance);
                        }

                });
            },
            error: function(error) {
                console.error(error);
            }
        });
    }

</script>
<div><input type="submit" onclick="return clickLoad()" value="불러오기"></div>
</body>
</html>