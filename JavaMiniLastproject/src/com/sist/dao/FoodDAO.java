package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.FoodVO;

import java.util.*;



public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	private static FoodDAO dao;
	private final int ROWSIZE=12;
	
	
	//드라이버 등록
	public FoodDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			}
		catch(Exception ex){
			
			}	
		}
	
	public static FoodDAO newInstance() {
		if(dao == null) {
			dao= new FoodDAO();
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
	// = 목록
	public List<FoodVO> foodListData(int page){
		//페이징 처리 => 인라인 뷰
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			//인덱스 자동화 : PRIMARY KEY, UNIQUE
			getConnection();
			String sql = "SELECT fno,name,poster,num "
					+ "FROM (SELECT fno, name,poster,rownum as num "
					+ "FROM (SELECT/*+ INDEX_ASC(menupan_food menuf_fno_pk)*/fno,name,poster "
					+ "FROM menupan_food)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int start = (page*ROWSIZE)-(ROWSIZE-1);
			int end = page * ROWSIZE;
			/*
			 * 	1page => 1~12 => rownum은 1번 부터 시작
			 * 	2page => 13 ~14
			 * 
			 * 
			 * 
			 */
			ps.setInt(1, start);
			ps.setInt(2, end);
			//오라클 실행
			ResultSet rs = ps.executeQuery();
			//결과 값이 rs안에 존재 => List에 채운다
			while(rs.next()) {	// 출력한 첫 번째위치에 커서 이동
				// JDBC => 읽기 => ROW단위로 읽어온다
				// fno, name, poster 읽기
				// => 한번에 저장 => VO
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				
				list.add(vo);
			}
			rs.close();
			
			
		} catch(Exception ex){
			
			ex.printStackTrace();
			
		}
		finally {
			
			disConnection();
			
		}
		return list;
	}
	// 1-1 총페이지
	public int foodTotalPage() {
		
		int total = 0;
		
		try {
			
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/"+ROWSIZE+") FROM menupan_food";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		finally {
			
			disConnection();
			
		}
		return total;
	}
	// => 인기가 많은 맛집 10개 추출 
	public List<FoodVO> foodTop10(){
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql = "SELECT fno,name,SUBSTR(address,1,2),poster,rownum "
					+ "FROM (SELECT fno,name,address,poster "
					+ "FROM menupan_food ORDER BY hit DESC) "
					+ "WHERE rownum<=10";
			
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAddress(rs.getString(3));
				vo.setPoster(rs.getString(4));
				list.add(vo);
				
			}
			rs.close();
			
		} 
		catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		finally {
			
			disConnection();
			
		}
		return list;
	}
	
	// = 상세보기
	// = 검색
	
	
}
