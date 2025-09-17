package com.sist.jsoup;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.Used_MerchandiseDAO;
import com.sist.vo.GenieMusicVO;
import com.sist.vo.Used_MerchandiseVO;

public class Used_MerchandiseJsoup {
public void usedDataCollenction() throws Exception {
		
		
		int l=0;
		
		List<String> list = new ArrayList<String>();
		
		list.add("");
		for(int p = 1; p<22; p++) {
			list.add(String.valueOf(p));
		}
		list.add("1348");
		Used_MerchandiseDAO dao = Used_MerchandiseDAO.newInstance();
		
		
		
		for(int i =0; i<list.size(); i++) {
			int r = 1;
			
			String url = "";
			

			for(int p = 1; p <= 10; p++) {
				
					
				url = "https://web.joongna.com/search?page="+p+"&category="+list.get(i);
				
				
				
				Document doc = Jsoup.connect(url).get();
				Elements title = doc.select("li a.relative div h2");
				Elements image = doc.select("li a.relative img");
				Elements price = doc.select("li a.relative div.font-semibold");

				/*
				 * 	HTML => 데이터 출력
				 * 	-----------------
				 *  <a> aaa </a> => text()
				 *  <img src = "aaa"> => attr("src")
				 *  <a href = "">
				 * 
				 * 
				 */
				
				
				for(int j = 0; j < title.size(); j++) {
					try {
						l++;
						String title1 = title.get(j).text();
					    String priceText = price.get(j).text().replaceAll("[^0-9]", "");
					    int price1 = priceText.isEmpty() ? 0 : Integer.parseInt(priceText);
					    String image1 = image.get(j).attr("src");

					    Used_MerchandiseVO vo = new Used_MerchandiseVO();
					    vo.setTitle(title1);
					    vo.setPrice(String.valueOf(price1));
					    vo.setImage(image1);

					    dao.usedInsert(vo);
					    System.out.println("DB 저장 완료: " + title1);
					}catch(Exception ex) {
						ex.printStackTrace();
					}
					
					
					
				}
				
				
			}
			System.out.println("데이터 수집 완료");
			System.out.println(l + "개");
		}
}
	
	public static void main(String[] args) throws Exception {
		Used_MerchandiseJsoup gm = new Used_MerchandiseJsoup();
		gm.usedDataCollenction();
	}
}
