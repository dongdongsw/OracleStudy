package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.*;
import com.sist.vo.GenieMusicVO;


public class GenieMusicDAO {

	private Connection conn;
	private PreparedStatement ps;
	
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private static GenieMusicDAO dao;
	private final int ROWSIZE=10;
	
	
	//드라이버 등록
	public GenieMusicDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			}
		catch(Exception ex){
			
			}	
		}
	
	public static GenieMusicDAO newInstance() {
		if(dao == null) {
			dao= new GenieMusicDAO();
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
	 *  NO         NOT NULL NUMBER
		CNO                 NUMBER
		RANK   		 NOT NULL NUMBER
		TITLE      NOT NULL VARCHAR2(200)
		SINGER     NOT NULL VARCHAR2(100)
		ALBUM      NOT NULL VARCHAR2(200)
		POSTER     NOT NULL VARCHAR2(260)
		STATE              CHAR(6)
		IDCREMENT          NUMBER
		KEY          VARCHAR2(100)
		HIT                NUMBER
		LIKECOUNT          NUMBER
	 * 
	 * 
	 */
	
	//
	public void genieInsert(GenieMusicVO vo) {
		
		try {
			getConnection();
			
			String sql = "INSERT INTO genie_music(no,cno,rank,title, "
					+ "singer, album, poster, state, idcrement) "
					+ "VALUES(gm_no_seq.nextval, ?,?,?,?,?,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getCno());
			ps.setInt(2, vo.getRank());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getSinger());
			ps.setString(5, vo.getAlbum());
			ps.setString(6, vo.getPoster());
			ps.setString(7, vo.getState());
			ps.setInt(8, vo.getIdcrement());
			ps.executeUpdate();
			
		} catch (Exception ex) {

			ex.printStackTrace();
		}
		finally {
			disConnection();
		}
		
	}
	
	public List<GenieMusicVO> genieListData(int cno){
		
		List<GenieMusicVO> list = new ArrayList<GenieMusicVO>();
		
		try {
			getConnection();
			String sql = "SELECT /* + INDEX_ASC(genie_music gm_no_pk)*/no,rank, title, singer, album, "
					+ "poster, idcrement, state "
					+ "FROM genie_music "
					+ "WHERE cno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GenieMusicVO vo = new GenieMusicVO();
				vo.setNo(rs.getInt(1));
				vo.setRank(rs.getInt(2));
				vo.setTitle(rs.getString(3));
				vo.setSinger(rs.getString(4));
				vo.setAlbum(rs.getString(5));
				vo.setPoster(rs.getString(6));
				vo.setIdcrement(rs.getInt(7));
				vo.setState(rs.getString(8));
				list.add(vo);
			}
			
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			
		}finally {
			
			disConnection();
		}
		
		
		return list;
	}
	
	
	
	
	
	
}
