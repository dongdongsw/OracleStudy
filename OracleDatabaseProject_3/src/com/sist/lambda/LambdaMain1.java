package com.sist.lambda;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

public class LambdaMain1 {

	public static void main(String[] args) {
		LambdaMain1 la = new LambdaMain1();
		la.lambdaDisplay1();
		System.out.println("\n-----------------------------------\n");
		la.lambdaDisplay2();
		System.out.println("\n-----------------------------------\n");
		la.lambdaDisplay3();
		System.out.println("\n-----------------------------------\n");
		la.lambdaDisplay4();
		System.out.println("\n-----------------------------------\n");
		la.lambdaDisplay5();
	}
	
	// 1. 급여가 3000이상인 사원의 이름과 급여 출력
	// SELECT ename, sal FROM emp WHERE sal >= 3000
	/*
	 * 	1. 함수형 인터페이스
	 * 		1) Predicate : 조건 검색 => true / false
	 * 			ㄴ .filter()
	 * 		2) Function : 컬럼 변환(컬럼 가공 같은 느낌) / 매핑 
	 * 			ㄴ .map()
	 * 		3) Consumer : 저장 / 출력
	 * 			ㄴ .filter()
	 * 		4) Supplier : 데이터 수집
	 * 
	 */
	public void lambdaDisplay1() {
		EmpDAO dao = EmpDAO.newInstance();
		List<EmpVO> list = dao.empListData();
		
		list.stream()
			.filter(vo -> vo.getSal() >= 3000) //WHERE 문장 => Predicate
			.map(vo -> vo.getEname() + ":" + vo.getSal()) //=> Function
			.forEach(System.out::println); //Consumer 
		
		// filter => if(vo.getSal() >= 3000)
		// map => 출력 형식을 만든다
		// forEach => for 
		// 람다 => 많이 사용하면 가독성이 떨어진다 / 속도가 느려진다
		// Stream => java => sql연동

	}
	
	//SELECT empno,ename,job,hiredate,sal FROM emp
	public void lambdaDisplay2() {
		EmpDAO dao = EmpDAO.newInstance();
		List<EmpVO> list = dao.empListData();
		
		list.stream()
			.forEach(vo -> System.out.println(
					vo.getEname() + " "
					+ vo.getComm() + " "
					+ vo.getHiredate() + " "
					+ vo.getJob() + " "
					+ vo.getSal()
					));
	}
	
	// SELECT * FROM emp WHERE ename LIKE 'A%' , '%A', '%A%'
	public void lambdaDisplay3() {
		EmpDAO dao = EmpDAO.newInstance();
		List<EmpVO> list = dao.empListData();
		
		list.stream()
//		.filter(vo -> vo.getEname().startsWith("A")) //"A"로 시작하는지
//		.filter(vo -> vo.getEname().endsWith("T")) //"T"로 끝나는지
//		.filter(vo -> vo.getEname().contains("B")) //"B"를 포함하는지
//		.filter(vo -> vo.getEname().equals("SCOTT")) // "SCOTT"과 정확히 같은지
		.filter(vo -> vo.getEname().equalsIgnoreCase("scott")) // 대소문자 구분 없이 같은지
		.forEach(vo->System.out.println(
						vo.getEname() + " "
						+ vo.getComm() + " "
						+ vo.getHiredate() + " "
						+ vo.getJob() + " "
						+ vo.getSal()
						));
	}

	// SELECT * FROM emp ORDER BY hiredate ASC Limit 1
	public void lambdaDisplay4() {
		
		EmpDAO dao = EmpDAO.newInstance();
		List<EmpVO> list = dao.empListData();
		
		list.stream()
			.min(Comparator.comparing(EmpVO::getHiredate))
			.ifPresent(vo -> System.out.println(
					vo.getEname() + " "
					+ vo.getHiredate()
					));
	}
	
	// Optional => null 값 처리
	// 전체 사원의 총급여 ***
	// SELECT SUM(*) FROM emp 
	public void lambdaDisplay5() {
		
		EmpDAO dao = EmpDAO.newInstance();
		List<EmpVO> list = dao.empListData();		
//		double total = list.stream()
		OptionalDouble total = list.stream()
						.mapToDouble(EmpVO::getSal)
						//.sum();
						.average();
		// sum / avg / max / min => 집계 함수
		System.out.println("총 급여 : " + total);
		/*
		 *	1. 함수형 인터페이스
		 * 		1) Predicate : WHERE
		 * 		2) Function : SELECT
		 * 		3) Consumer : INSERT
		 * 		4) Supplier : Values => 새로운 추가
		 * 		5) Collectors.groupingBy=> Group By
		 * 		6) min / max.sum / average => 집계함수
		 */
			
	}	
	
	
	
	
}
