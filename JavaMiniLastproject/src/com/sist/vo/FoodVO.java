package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
 * 	FNO     NOT NULL NUMBER        
	NAME    NOT NULL VARCHAR2(200) 
	TYPE    NOT NULL VARCHAR2(100) 
	PHONE            VARCHAR2(20)  
	ADDRESS NOT NULL VARCHAR2(500) 
	SCORE            NUMBER(2,1)   
	THEME            CLOB          
	PRICE            VARCHAR2(50)  
	TIME             VARCHAR2(100) 
	PARKING          VARCHAR2(100) 
	POSTER  NOT NULL VARCHAR2(260) 
	IMAGES           CLOB          
	CONTENT          CLOB          
	HIT              NUMBER        

 * 
 * 
 */
@Data
public class FoodVO {
	private int fno,hit;
	   private String name,subject,content,pwd,dbday,poster,type,phone,score,theme,address;
	   private Date regdate;
	
	
}
