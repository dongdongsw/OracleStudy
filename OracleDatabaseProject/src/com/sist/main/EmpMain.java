package com.sist.main;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

public class EmpMain { //1

	public static void main(String[] args) {//2
		
		Scanner scan = new Scanner(System.in);
		
		EmpDAO dao = EmpDAO.newInstance();
		
		while(true) {//3
			
			System.out.println("--------------메뉴--------------");
			System.out.println("1. 사원 목록");
			System.out.println("2. 사원 상세보기");
			System.out.println("3. 사원 검색");
			System.out.println("4. 종료");
			System.out.println("-------------------------------");
			
			int menu = scan.nextInt();
			
			if(menu == 4) {//4
				
				System.out.println("프로그램 종료");
				break;
				
			}//4
			
			// 사원 목록
			else if(menu == 1) {//5
				
				List<EmpVO> list = dao.empListData();
				
				for(EmpVO vo : list) {
					
					System.out.println(
					vo.getEmpno() + " "
					+ vo.getEname() + " "
					+ vo.getJob() + " "
					+ vo.getDbday() + " "
					+ vo.getSal()
					);
					
				}
				
			}//5
			
			// 사원 상세보기
			else if(menu == 2) { //6
				EmpVO vo = dao.empDetailData(7900);
				
				System.out.println("사번 : " + vo.getEmpno());
				System.out.println("사번 : " + vo.getEname());
				System.out.println("사번 : " + vo.getJob());
				System.out.println("사번 : " + vo.getHiredate());
				
			} //6
			
			// 사원 검색
			else if(menu == 3) { //7
				System.out.println("검색할 사원 이름 입력 : ");
				
				String ename = scan.next();
				
				List<EmpVO> list = dao.empFindData(ename);

				for(EmpVO vo : list) {
					
					System.out.println(
					vo.getEmpno() + " "
					+ vo.getEname() + " "
					+ vo.getJob() + " "
					+ vo.getDbday() + " "
					+ vo.getSal()
					);
					
				}
				
			} //7
			
		}//3
		
	}//2
	
}//1























