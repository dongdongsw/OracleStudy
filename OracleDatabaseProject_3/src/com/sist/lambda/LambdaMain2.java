package com.sist.lambda;

import java.util.*;
/*
 * function aaa(){
 * 
 * }
 * 
 * 함수 / 메소드 => 변수형
 * 
 */



// 함수형 인터페이스
@FunctionalInterface
interface MyCalc
{
	int calc(int a, int b);
	/*
	 * 	Runnable => run()
	 * 	ActionListner => actionPerformed()
	 * 	단순하게 DB에서 가지고 오는 데이터 제어
	 * 
	 * 	=> 코드 간결 
	 * 	=> Stream 지원 => Collection 제어
	 *  => 가독성이 떨어진다
	 *  => 복잡한 로직에는 사용금지
	 *  => 자바의 기본 개념에서
	 *  => 분석
	 *  
	 *  전체 사원 출력
	 *  급여가 2000이상
	 *  부서별 평균
	 *  직위별 최고 급여
	 *  가장 높은 급여
	 *  -------------SQL
	 *  조건 : filter(vo -> vo.getSal() >= 2000)
	 *  출력 형식 : map(EmpVO::getEname)
	 *  여러개 출력 : forEach
	 *  정렬 ㅣ sorted(EmpVO::getSal)
	 *  --------------------------------------
	 *  -> 함수 포인터 => lambda:x+y
	 *  JWT => Spring-boot : 카카오 / 네이버....
	 *  --- 쿠키
	 */
}

public class LambdaMain2 {

	public static void main(String[] args) {
		
		/*
		 * public int calc(int a, int b)
		 * ---------------
		 * {
		 * 		return a + b;
		 * 		------
		 * }
		 * 람다로 쓰면 -는 생략이 가능하다
		 * 
		 * 
		 */
		
//		MyCalc plus = (a,b)-> {return a+b;};
		MyCalc plus = (a,b)-> a+b;
		MyCalc minus = (a,b) -> a-b;
		MyCalc gop = (a,b) -> a*b;
		MyCalc div = (a,b) -> a/b;
		
		System.out.println(plus.calc(10, 3));
		System.out.println(minus.calc(10, 3));
		System.out.println(gop.calc(10, 3));
		System.out.println(div.calc(10, 3));
		
	}

}
