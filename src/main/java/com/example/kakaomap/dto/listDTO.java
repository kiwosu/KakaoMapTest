package com.example.kakaomap.dto;

import lombok.Data;

@Data
public class listDTO {
    public int map_num;
    public int user_num;
    public int board_num;
    public double latitude;
    public double longitude;
    public String map_name;

    // 리뷰용
    public String msg;
    public int Result;
}
