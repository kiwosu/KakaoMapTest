package com.example.kakaomap.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class indexController {
    @GetMapping("/")
    public String index() {
        return "menu";
    }

    //마커 생성
    @GetMapping("/marker")
    public String marker() {
        return "mapMarker";
    }

    //마커 생성 심화1
    @GetMapping("/marker1")
    public String marker1() {
        return "mapMarker1";
    }

    //마커 드래그
    @GetMapping("/markerDrag")
    public String markerDrag() {
        return "mapMarkerDrag";
    }

    //마커 이미지 변경
    @GetMapping("/markerImg")
    public String markerImg() {
        return "mapMarkerImg";
    }

    //마커 인포윈도우
    @GetMapping("/markerInfo")
    public String markerInfo() {
        return "mapMarkerInfo";
    }

    //마커 인포윈도우 같이
    @GetMapping("/markerInfoWith")
    public String markerInfoWith() {
        return "mapMarkerInfoWith";
    }

    //마커 인포윈도우 심화
    @GetMapping("/markerInfo1")
    public String markerInfo1() {
        return "mapMarkerInfo1";
    }

    //마커 클릭이벤트
    @GetMapping("/markerClick")
    public String markerClick() {
        return "mapClick";
    }

    //마커 마우스이벤트
    @GetMapping("/markerMouse")
    public String markerMouse() {
        return "mapMouse";
    }

    //마커 드래그
    @GetMapping("/markerDraggable")
    public String markerDraggable() {
        return "mapDraggable";
    }

    //마커 드래그
    @GetMapping("/markerCTR")
    public String markerCTR() {
        return "mapControll";
    }

    //마커 이벤트
    @GetMapping("/markerEvent")
    public String markerEvent() {
        return "mapMarkerEvent";
    }

    //마커 이벤트
    @GetMapping("/markerImage")
    public String markerImage() {
        return "mapImage";
    }

    //마커 거리 구하기
    @GetMapping("/markerDistance")
    public String markerDistance() {
        return "mapDistance";
    }

    //마커 거리 구하기
    @GetMapping("/libKey")
    public String libKey() {
        return "libKey";
    }

    //마커 거리 구하기
    @GetMapping("/libKeyWord")
    public String libKeyWord() {
        return "libKeyWord";
    }


    //카카오 db연동
    @GetMapping("/DBdata")
    public String DBdata() {
        return "DBdata";
    }

    //카카오 db연동
    @GetMapping("/DBdata1")
    public String DBdata1() {
        return "DBdata1";
    }

    //카카오 db연동
    @GetMapping("/DBdata2")
    public String DBdata2() {
        return "DBdata2";
    }

    //카카오 db연동
    @GetMapping("/DBdata3")
    public String DBdata3() {
        return "DBdata3";
    }
}