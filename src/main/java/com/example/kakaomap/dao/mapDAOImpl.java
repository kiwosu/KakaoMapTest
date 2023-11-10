package com.example.kakaomap.dao;

import com.example.kakaomap.dto.mapDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;

@Repository
@RequiredArgsConstructor
public class mapDAOImpl implements mapDAO{
    private final SqlSession session;
    @Override
    public int saveMap(mapDTO map) {
        System.out.println("saveMap daoimpl 테스트");
        int result = 0;
        System.out.println(map.getLatitude());
        System.out.println(map.getLongitude());
        System.out.println(map.getMap_name());

        try {
            result = session.insert("mapSave", map);
            result++;
        } catch (Exception e) {
            System.out.println("mapDTO saveMap Error: " + e.getMessage());
        }
        return result;
    }

    @Override
    public mapDTO dbLoad(int map_Num) {

        System.out.println("dbLoad daoimpl 테스트");
        System.out.println("dbLoad daoimpl 테스트->" +map_Num);
        mapDTO kmap = new mapDTO();

        try {
            kmap = session.selectOne("dbLoad", map_Num);
            System.out.println("null인지 아닌지 좀 보자"+ kmap);
            if(kmap == null){
                kmap = new mapDTO();
                kmap.setMsg("불러오기 실패");
                System.out.println("dbLoad null 불러오기 실패");
            }
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
        return kmap;
    }
}
