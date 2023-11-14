package com.example.kakaomap.dao;

import com.example.kakaomap.dto.listDTO;

import java.util.List;

public interface listDAO {
    int saveList(listDTO list);

    List<listDTO> findAll(listDTO list);
}
