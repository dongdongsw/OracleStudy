package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
 NO                 	NOT NULL NUMBER
 TITLE                	NOT NULL VARCHAR2(200)
 SELLER               	NOT NULL VARCHAR2(100)
 PRICE                	NOT NULL VARCHAR2(100)
 IMAGE                	NOT NULL VARCHAR2(260)
 CATEGORY				VARCHAR2(30)
 STATE					VARCHAR2(30)
 KEY					VARCHAR2(100)
 HIT					NUMBER
 LIKECOUNT				NUMBER
 JJIMCOUNT				NUMBER
 CREATE_DATE			DATE
 */
@Data
public class Used_MerchandiseVO {
	public int no,hit, likecount, jjimcount;
	public String title, seller, image, category, state, key,price;
	public Date create_date;
}
