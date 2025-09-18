package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.sist.vo.Used_MerchandiseVO;

public class Used_MerchandiseDAO {

	private Connection conn;
	private PreparedStatement ps;
	
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private static Used_MerchandiseDAO dao;
	private final int ROWSIZE=10;
	
	
	//드라이버 등록
	public Used_MerchandiseDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			}
		catch(Exception ex){
			
			}	
		}
	
	public static Used_MerchandiseDAO newInstance() {
		if(dao == null) {
			dao= new Used_MerchandiseDAO();
		}
		return dao;
			
	}
		
	//연결
	public void getConnection() {
		try {
			
			//1조 => hr_1, 2조 hr_2, 3조 hr_3
			conn = DriverManager.getConnection(URL,"hr","happy");
				
		}
		catch(Exception ex) {}
	}
		
	public void disConnection() {
		
		try {
		
			if(ps!=null) {
				ps.close();
				}
			
			if(conn!= null) { 
				conn.close();
				}
			
		}
		catch(Exception ex) {}
	}
	
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
	 * 
	 * 
	 */
	
	//
	public void usedInsert(Used_MerchandiseVO vo) {
		
		try {
			getConnection();
			
			String sql = "INSERT INTO used_merchandise(no, title, price, detail_link, "
					+ "trade_type, location, seller_Trust, category, "
					+ "seller, create_date, modify_date, description) "
					+ "VALUES(um_no_seq.nextval, ?,?,?,?,?,?,?,?,TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS'), TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS'),?)";
			
			ps = conn.prepareStatement(sql);
//			ps.setInt(1, vo.getNo());
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getPrice());
			ps.setString(3, vo.getDetail_link());
			ps.setString(4, vo.getTrade_type());
			ps.setString(5, vo.getLocation());
			ps.setString(6, vo.getSeller_Trust());
			ps.setString(7, vo.getCategory());
			ps.setString(8, vo.getSeller());
			ps.setString(9, vo.getCreate_date());
			ps.setString(10, vo.getModify_date());
//			ps.setString(11, vo.getState());
			ps.setString(11, vo.getDescription());

			
			ps.executeUpdate();
			
			
		} catch (Exception ex) {

			ex.printStackTrace();
		}
		finally {
			disConnection();
		}
		
	}
	
	
	
	
	
	
	
	
}