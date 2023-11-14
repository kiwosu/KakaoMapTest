package com.example.kakaomap.dao;

import com.example.kakaomap.dto.listDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class listDAOImpl implements listDAO{
    private final SqlSession session;
    @Override
    public int saveList(listDTO list) {
        System.out.println("saveMap daoimpl 테스트");
        int result = 0;
        System.out.println(list.getLatitude());
        System.out.println(list.getLongitude());

        try {
            result = session.insert("listSave", list);
            result++;
        } catch (Exception e) {
            System.out.println("mapDTO saveMap Error: " + e.getMessage());
        }
        return result;
    }

    @Override
    public List<listDTO> findAll(listDTO list) {
        System.out.println("dbLoad daoimpl 테스트");
        System.out.println("dbLoad daoimpl 테스트->" +list);
        List<listDTO> klist = new ArrayList<>();

        try {
            klist = session.selectList("findAll", list);
            System.out.println("불러온 데이터 리스트: " + klist);

            if(klist == null || klist.isEmpty()){
                listDTO errorDTO = new listDTO();
                errorDTO.setMsg("불러오기 실패");
                System.out.println("데이터가 없거나 불러오기 실패");
            }
        } catch (Exception e){
            System.out.println("에러 메세지 ->" +e.getMessage());
        }
        return klist;
    }
}
