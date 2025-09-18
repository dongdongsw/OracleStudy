package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*


 */
@Data
public class Used_MerchandiseVO {
	public int no,view_count, like_count, jjim_count;
	public String title, price, detail_link, 
					trade_type, location, seller_Trust, 
					category, seller, state,
					description, image,   key;
	public String create_date,modify_date;
}
