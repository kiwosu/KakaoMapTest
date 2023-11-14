package com.example.kakaomap.service;

import com.example.kakaomap.dao.listDAO;
import com.example.kakaomap.dao.mapDAO;
import com.example.kakaomap.dto.listDTO;
import com.example.kakaomap.dto.mapDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MapService {
    private  final mapDAO md;
    private  final listDAO ld;
    public int saveMap(mapDTO map) {
        int result = 0;
        try {
            result = md.saveMap(map);
        } catch (Exception e) {
            System.out.println("login error" + e.getMessage());
        }

        return result;
    }

    public mapDTO dbLoad(int map_num) {
        mapDTO map = new mapDTO();
        try {
            map = md.dbLoad(map_num);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return map;
    }

    public int saveList(listDTO list) {
        int result = 0;
        try {
            result = ld.saveList(list);
        } catch (Exception e) {
            System.out.println("login error" + e.getMessage());
        }

        return result;
    }

    public List<Map<String, Double>> getAllData(listDTO list) {
        List<listDTO> entities = ld.findAll(list);

        List<Map<String, Double>> dataList = new ArrayList<>();
        for (listDTO entity : entities) {
            Map<String, Double> dataMap = new HashMap<>();
            dataMap.put("La", entity.getLatitude());
            dataMap.put("Ma", entity.getLongitude());
            // 필요한 다른 필드들도 추가
            dataList.add(dataMap);
        }
        System.out.println("datalist->"+dataList);
        return dataList;
    }

}
