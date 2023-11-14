package com.example.kakaomap.controller;

import com.example.kakaomap.dto.listDTO;
import com.example.kakaomap.dto.mapDTO;
import com.example.kakaomap.service.MapService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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
            System.out.println("값은 가져옴->" + map);
            if (map != null) {
                //결과 값이 존재 할경우 1 삽입
                map.setResult(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return map;
    }


    @PostMapping("/clickInfo")
    public ResponseEntity<String> receiveClickInfo(@RequestBody Map<String, List<Map<String, Double>>> requestBody) {
        System.out.println("receiveClickInfo start");
        System.out.println(requestBody.get("data"));
        List<Map<String, Double>> path = requestBody.get("data");
        int result = 0;
        for (int i = 0; i < path.size(); i++) {
            Map<String, Double> point = path.get(i);
            double latitude = point.get("La");
            double longitude = point.get("Ma");
            System.out.println("Point " + i + ": Latitude: " + latitude + ", Longitude: " + longitude);

            // 여기에서 list 객체를 생성하거나 초기화하세요.
            listDTO list = new listDTO();
            list.setLatitude(latitude);
            list.setLongitude(longitude);

            try {
                result = mapService.saveList(list);
                result++;
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

        // 클라이언트에게 응답을 보냅니다.
        return ResponseEntity.ok("Success");
    }

    @ResponseBody
    @RequestMapping("/clickLoad")
    public List<Map<String, Double>> clickLoad(@RequestParam int user_num, @RequestParam int board_num) {
        System.out.println("clickLoad start");
        System.out.println("clickLoad start" + user_num);
        System.out.println("clickLoad start" + board_num);

        listDTO list = new listDTO();
        list.setBoard_num(board_num);
        list.setUser_num(user_num);
        List<Map<String, Double>> dataList = null;
        try {
            dataList = mapService.getAllData(list);
            System.out.println("값은 가져옴->" + dataList);
            if (list != null) {
                //결과 값이 존재 할경우 1 삽입
                list.setResult(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return  dataList;
    }

}
