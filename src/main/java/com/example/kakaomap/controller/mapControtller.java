package com.example.kakaomap.controller;

import com.example.kakaomap.dto.mapDTO;
import com.example.kakaomap.service.MapService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class mapControtller {

    private final MapService mapService;

    @ResponseBody
    @RequestMapping("/mapSave")
    public double mapSave(@RequestParam double latitude, @RequestParam double longitude, @RequestParam String name) {
        System.out.println("mapSave start");
        System.out.println(latitude);
        System.out.println(longitude);
        System.out.println(name);
        mapDTO map = new mapDTO();

        map.setLatitude(latitude);
        map.setLongitude(longitude);
        map.setMap_name(name);

        int result = 0;
        try {
            result = mapService.saveMap(map);
            result++;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/dbLoad")
    public mapDTO dbLoad(@RequestParam int map_num) {
        System.out.println("dbLoad start");
        System.out.println(map_num);

        mapDTO map = new mapDTO();

        try {
            map = mapService.dbLoad(map_num);
            System.out.println("값은 가져옴->"+map);
            if (map != null){
                //결과 값이 존재 할경우 1 삽입
                map.setResult(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return map;
    }
}
