package com.example.kakaomap.dto;

import lombok.Data;

@Data
public class mapDTO {
    public int map_num;
    public double latitude;
    public double longitude;
    public String map_name;

    // 리뷰용
    public String msg;
    public int Result;

}
