package com.example.kakaomap.service;

import com.example.kakaomap.dao.mapDAO;
import com.example.kakaomap.dto.mapDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MapService {
    private  final mapDAO md;
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
}
