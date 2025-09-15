package com.sist.vo;

import lombok.Data;

@Data
public class FoodVO {

	private int fno,hit;
	private double score;
	private String name, type, phone, address, theme, parking, poster,
		images, content, price, time;
	
}
