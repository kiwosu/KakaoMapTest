package com.example.kakaomap.dao;

import com.example.kakaomap.dto.mapDTO;

public interface mapDAO {
    int saveMap(mapDTO map);

    mapDTO dbLoad(int mapNum);

}
